from .models import CATEGORY_CHOICES, Cart, CartItem

def add_variable_to_context(request):
    categories = CATEGORY_CHOICES
    total = 0
    count = 0
    cart_items = None
    if request.user.is_authenticated:
        try:
            cart = Cart.objects.get(user_id=request.user)
            cart_items = CartItem.objects.filter(cart_id=cart)
            for cart_item in cart_items:
                count += 1
            total = cart.total
        except Cart.DoesNotExist:
            cart = None
            total = 0
    return {
        'cart_items':cart_items,
        'categories': categories,
        'total': total ,
        'count': count,
    }
