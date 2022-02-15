from django.db import connection
from django.http.response import JsonResponse
from django.shortcuts import redirect, render
from django.http import HttpResponse
from django.contrib import messages
from django.core.paginator import Paginator, EmptyPage

# Create your views here.

def home(request):
    return render(request,'store/home.html')

def detail(request,pk):
    return render(request,'store/detail.html')

def listProduct(request):
    return render(request,'store/listProductSearch.html')