from django.db import connection
from django.http.response import JsonResponse
from django.shortcuts import redirect, render
from django.http import HttpResponse
from django.contrib import messages
from django.core.paginator import Paginator, EmptyPage

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
    return render(request,'store/detail.html')

def listProduct(request):
    return render(request,'store/listProductSearch.html')