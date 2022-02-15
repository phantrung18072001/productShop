from django.shortcuts import redirect, render
from django.db import connection
from django.contrib import messages
from django.core.files.storage import FileSystemStorage
from django.utils import timezone
from django.utils import formats
# Create your views here.

def dashboard(request):
    return render(request,'admin/dashboard.html')

def statusChange(request):
    return redirect("adminPage:orders_List")

def product_Update(request):    
    return redirect('adminPage:products_Update')

def product_Delete(request):
    return redirect('adminPage:products_Update')

def product_Modify(request):
    return render(request,'admin/product_Modify.html')    

def product_Add(request):
    return render(request,'admin/product_Add.html')    


def products_List(request):
    return render(request,'admin/products_List.html')    


def products_Update(request):
    return render(request,'admin/products_Update.html')    

def orders_List(request):
    return render(request,'admin/orders_List.html')    


def users_List(request):
    return render(request,'admin/users_List.html')    
