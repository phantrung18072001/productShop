from django.db import connection
from django.http.response import JsonResponse
from django.shortcuts import redirect, render
from django.http import HttpResponse
from django.contrib import messages
from django.core.paginator import Paginator, EmptyPage
from django.forms.models import model_to_dict


from store.models import *
from store.services import *
# Create your views here.

def home(request):
    context = {}
    categories = Category.objects.all();
    for category in categories:
        products = Product.objects.filter(category_id=category.id,deleted_at=None).prefetch_related('inven','images').select_related('discount_id').order_by('-created_at')[:6:1] #có 9 câu truy vấn
        if products:
            context[category.name] = products
    new = newProducts()
    discount = discountProducts()
    sold = trendingProducts()
    return render(request,'store/home.html',{
        'context':context,
        'newProducts': new,
        'discountProducts': discount,
        'trendingProducts': sold
    })

def detail(request,pk):
    product = Product.objects.filter(id=pk).prefetch_related('inven','images')[0]
    return render(request,'store/detail.html',{'product':product})

def shelf(request):
    info = request.GET.get('info',"")
    category = request.GET.get('category',"")
    products_list = None

    if info is not None and info.strip() != '':
        products_list = Product.objects.filter(name__icontains=info).select_related('category_id')
    elif category:
        products_list = Product.objects.filter(category_id__name=category)
    else:
        return redirect(request.META['HTTP_REFERER'])
    
    # search in admin
    if request.is_ajax():
        products = products_list.values()
        i = 0
        for product in products:
            product['category'] = products_list[i].category_id.name
            product['inventory'] = products_list[i].inven.quantity
            i += 1
        return JsonResponse({'status':"success", 'products':list(products)})


    #search in user
    p = Paginator(products_list, 6*3)
    page = request.GET.get('page')
    products = p.get_page(page)

    return render(request,'store/shelf.html',{
        'products':products,
        'category':category,
        'info':info
    })

def add_cart(request,pk):
    product = Product.objects.get(id=pk)
    percent = 0
    if product.discount_id and product.discount_id.is_active:
        percent = product.discount_id.discount_percent
    if request.user.is_authenticated:
        if request.method == 'POST':
            quantity = int(request.POST.get('quantity'))
            try:
                cart = Cart.objects.get(user_id=request.user)
            except Cart.DoesNotExist:
                cart = Cart.objects.create(user_id=request.user)

            is_exist_cart_item = CartItem.objects.filter(cart_id=cart,product_id=product).exists()
            if is_exist_cart_item:
                pass
            else:
                cart_item = CartItem.objects.create(cart_id=cart, product_id=product, quantity=quantity)
                cart.total += quantity * product.price * (1 - percent / 100);
                cart_item.save()
                cart.save()
        return redirect(request.META['HTTP_REFERER'])

def update_cart(request):
    if request.method == 'POST':    
        if request.user.is_authenticated:
            cartitem_id = int(request.POST.get('cartitem_id'))
            cart_item_quantity = int(request.POST.get('quantity'))
            cart_item = CartItem.objects.get(id=cartitem_id)

            percent = 0
            if cart_item.product_id.discount_id and cart_item.product_id.discount_id.is_active:
                percent = cart_item.product_id.discount_id.discount_percent

            old_quantity = cart_item.quantity
            cart_item.quantity = cart_item_quantity
            cart_item.save()
            cart = Cart.objects.get(id=cart_item.cart_id.id)
            cart.total = cart.total + (cart_item.quantity-old_quantity) * cart_item.product_id.price * (1 - percent/100)
            cart.save()
            return JsonResponse({'status':'Update successfully','total_cart':cart.total})
        else:
            return JsonResponse({'status':'Back to login'})
    return redirect("/")

def remove_cart(request):
    if request.method == 'POST':    
        if request.user.is_authenticated:
            cartitem_id = int(request.POST.get('cartitem_id'))
            count = int(request.POST.get('count'))
            count -= 1
            cart_item = CartItem.objects.get(id=cartitem_id)
            cart = Cart.objects.get(id=cart_item.cart_id.id)

            percent = 0
            if cart_item.product_id.discount_id and cart_item.product_id.discount_id.is_active:
                percent = cart_item.product_id.discount_id.discount_percent

            cart.total = cart.total - cart_item.quantity * cart_item.product_id.price * percent
            cart_item.delete()
            cart.save()
            return JsonResponse({'status':'Update successfully','total_cart':cart.total, 'count':count})
        else:
            return JsonResponse({'status':'Back to login'})
    return redirect("/")


def order(request):
    user = request.user
    cart = Cart.objects.get(user_id=user)
    cart_items = CartItem.objects.filter(cart_id=cart)

    if request.method == 'POST':
        address = request.POST.get('address')

        for cart_item in cart_items:
            if cart_item.product_id.inven.quantity < cart_item.quantity:
                messages.error(request,'Vượt quá số lượng sách %s còn lại trong kho'%cart_item.product_id.name)
                return redirect(request.META['HTTP_REFERER'])

        order = Order.objects.create(user_id=user, address=address, total=cart.total)
        for cart_item in cart_items:
            percent = 0
            if cart_item.product_id.discount_id and cart_item.product_id.discount_id.is_active:
                percent = cart_item.product_id.discount_id.discount_percent
            pay_product = cart_item.product_id.price * percent

            cart_item.product_id.inven.quantity -= cart_item.quantity
            cart_item.product_id.inven.save()
            orderitem = OrderItem.objects.create(order_id=order,product_id=cart_item.product_id,
                                    quantity=cart_item.quantity,price=pay_product)
        cart_items.delete()
        cart.delete()
    return redirect("store:infoShip")

def update_order(request,order_id):
    order = Order.objects.get(id=order_id)
    order.status = "Đã hủy"
    order.save()
    return redirect("store:infoShip")

def infoShip(request):
    user = request.user
    orders = Order.objects.filter(user_id=user).order_by('-created_at')
    return render(request,'store/infoShip.html',{'orders':orders})