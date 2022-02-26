from store.models import *
from django.db.models import Sum


def trendingProducts():
    productsSold = OrderItem.objects.values('product_id').annotate(sold=Sum('quantity')).order_by('sold')[:12:1]
    products = []
    for trend in productsSold:
        product = list(Product.objects.filter(id=trend['product_id'])) + [trend['sold']]
        products.append(product)
    return products

def newProducts():
    products = Product.objects.order_by('-created_at')[:12:1];
    return products

def discountProducts():
    products = Product.objects.select_related('discount_id').filter(discount_id__is_active=True)[:12:1]
    return products