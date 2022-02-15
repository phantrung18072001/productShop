from django.shortcuts import redirect, render
from django.http import HttpResponse
from django.contrib import messages
from django.contrib import auth
from django.contrib.auth.decorators import login_required 
# Create your views here.

def login(request):
    return render(request,'account/login.html')

def register(request):
    return render(request,'account/register.html')

@login_required(login_url="login")
def logout(request):
    auth.logout(request)
    return redirect('account:login')