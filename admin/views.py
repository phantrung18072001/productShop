from django.shortcuts import redirect, render
from django.db import connection
from django.contrib import messages
from django.core.files.storage import FileSystemStorage
from django.utils import timezone
from django.utils import formats

from account.models import Account
from store.models import Category, Discount, Image, Inventory, Order, Product
# Create your views here.

def dashboard(request):
    cursor1 = connection.cursor()
    cursor1.execute("SELECT \
        (SELECT COUNT(id) FROM store_product) AS total_products,\
        (SELECT SUM(store_orderitem.`quantity`) FROM store_orderitem) AS total_products_sold")
    total_products = cursor1.fetchall()

    cursor1.execute("SELECT count(id) FROM account_account;")
    total_users = cursor1.fetchall()

    cursor1.execute("SELECT count(id) FROM store_order  \
        WHERE \
            DAY(created_at) = DAY(NOW()) AND \
            MONTH(created_at) = MONTH(NOW()) AND \
            YEAR(created_at) = YEAR(NOW()) ")
    total_orders_day = cursor1.fetchall()

    cursor1.execute("SELECT count(id) FROM store_order  \
        WHERE \
            MONTH(created_at) = MONTH(NOW()) AND \
            YEAR(created_at) = YEAR(NOW()) ")
    total_orders_month = cursor1.fetchall()

    cursor1.execute("SELECT \
        MONTH(updated_at) AS _month, \
        SUM(total) AS total_revenue \
    FROM \
        store_order \
    WHERE \
        (store_order.`status` = 'Hoàn thành') \
    GROUP BY _month \
    ORDER BY _month")
    total_revenue_by_months = cursor1.fetchall()

    cursor1.execute("\
        select p.name, sum(quantity)\
        from store_orderitem as oi\
        join store_product as p on(oi.product_id_id = p.id)\
        group by product_id_id\
        order by sum(quantity) desc;\
    ")
    bestsellers = cursor1.fetchall()
    print(bestsellers)
    return render(request,'admin/dashboard.html', {
        'total_products': total_products,
        'total_users': total_users, 
        'total_orders_day': total_orders_day,
        'total_orders_month': total_orders_month,
        'total_revenue_by_months': total_revenue_by_months,
        'bestsellers': bestsellers
    })

def statusChange(request):
    if request.user.is_admin:
        if request.method == 'POST':
            order = Order.objects.get(id=request.POST.get('orderID'))
            order.status = request.POST.get('newStatus')
            order.save()
        return redirect("adminPage:orders_List")
    return redirect('store:home')

def product_Modify(request):   
    product_id = request.POST.get('productID')
    product = Product.objects.filter(id=product_id).select_related('inven').prefetch_related('images')[0]
    discounts = Discount.objects.filter(is_active=True)
    categories = Category.objects.all()
    return render(request, 'admin/product_Modify.html', {'product' : product, 'discounts':discounts, 'categories': categories})

def product_Update(request):    
    if request.user.is_admin:
        if request.method == 'POST':
                product = Product.objects.get(id=request.POST.get('id'))
                inventory = Inventory.objects.get(product_id=product)
                try:
                    image1 = Image.objects.get(product_id=product, main_image=True)
                except:
                    image1 = Image(product_id=product)
                try:
                    image2 = Image.objects.get(product_id=product, main_image=False)
                except:
                    image2 = Image(product_id=product)

                    

                product.name = request.POST.get('name')
                product.RAM = request.POST.get('RAM')
                product.price = request.POST.get('price')
                product.CPU = request.POST.get('CPU')
                product.Card = request.POST.get('Card')
                product.Screen = request.POST.get('Screen')
                product.desc = request.POST.get('description')

                product.category_id = Category.objects.get(id=request.POST.get('category'))
                product.discount_id = Discount.objects.get(id=request.POST.get('discount'))
                product.save()

                inventory.quantity = request.POST.get('quantity')
                inventory.save()

                fs = FileSystemStorage()
                if request.FILES.get('FrontCover_Image'):
                    uploaded_FrontCover_image = request.FILES.get('FrontCover_Image')
                    image1.path = uploaded_FrontCover_image.name
                    fs.save(uploaded_FrontCover_image.name, uploaded_FrontCover_image)
                    image1.save()
                if request.FILES.get('BackCover_Image'):    
                    uploaded_BackCover_image = request.FILES.get('BackCover_Image')
                    image2.path = uploaded_BackCover_image.name
                    fs.save(uploaded_BackCover_image.name, uploaded_BackCover_image)
                    image2.save()         
        return redirect('adminPage:products_List')
    return redirect('store:home')

def product_Delete(request):
    if request.user.is_admin:
        if request.method == 'POST':
            product = Product.objects.get(id=request.POST.get('id'))
            product.delete()
        return redirect('adminPage:products_List')
    return redirect('store:home')

def product_Add(request):
    if request.user.is_admin:
        discounts = Discount.objects.filter(is_active=True)
        categories = Category.objects.all()
        if request.method == 'POST':
            if request.POST.get('name') and request.POST.get('RAM') and request.POST.get('CPU') and \
            request.POST.get('price') and request.POST.get('Card') and request.POST.get('Screen') and request.POST.get('description') \
            and request.POST.get('quantity') and request.FILES.get('FrontCover_Image') and request.FILES.get('BackCover_Image'):

                product = Product()
                inventory = Inventory()
                image1 = Image()
                image2 = Image()

                product.name = request.POST.get('name')
                product.RAM = request.POST.get('RAM')
                product.price = request.POST.get('price')
                product.CPU = request.POST.get('CPU')
                product.Card = request.POST.get('Card')
                product.Screen = request.POST.get('Screen')
                product.desc = request.POST.get('description')
                
                product.category_id = Category.objects.get(id=request.POST.get('category'))
                product.discount_id = Discount.objects.get(id=request.POST.get('discount'))
                product.save()

                inventory.product_id = Product.objects.last()
                inventory.quantity = request.POST.get('quantity')
                inventory.save()

                uploaded_FrontCover_image = request.FILES['FrontCover_Image']
                uploaded_BackCover_image = request.FILES['BackCover_Image']
                image1.product_id = Product.objects.last()
                image2.product_id = Product.objects.last()
                image1.main_image = True
                image1.path = uploaded_FrontCover_image.name
                image2.path = uploaded_BackCover_image.name
                fs = FileSystemStorage()
                fs.save(uploaded_FrontCover_image.name, uploaded_FrontCover_image)
                fs.save(uploaded_BackCover_image.name, uploaded_BackCover_image)
                image1.save()
                image2.save()
                messages.success(request, 'Thêm sách thành công!')
            else:
                messages.error(request, 'Thêm sách thất bại! Bạn phải điền đầy đủ thông tin!')
            return render(request,'admin/product_Add.html', {'discounts':discounts, 'categories': categories})
        else:
            return render(request,'admin/product_Add.html', {'discounts':discounts, 'categories': categories})
    return redirect('store:home')     

def products_List(request):
    if request.user.is_admin:
        products = Product.objects.select_related('inven').all().filter(deleted_at=None)
        return render(request,'admin/products_List.html', {'products': products})   
    return redirect('store:home')  
 

def orders_List(request):
    if request.user.is_admin:
        orders = Order.objects.all().select_related('user_id').prefetch_related('order_item')
        return render(request,'admin/orders_List.html',{'orders': orders})
    return redirect('store:home')      


def users_List(request):
    if request.user.is_admin:
        users_List = list(Account.objects.values_list('username', 'email', 'phone', 'address'))
        users = []
        for x in range(len(users_List)):
            user = []
            user.append(x + 1)
            user.extend(users_List[x])
            users.append(user)
        return render(request,'admin/users_List.html',{'users': users})    
    return redirect('store:home')    
