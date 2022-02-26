from django.shortcuts import redirect, render
from django.http import HttpResponse
from django.contrib import messages
from django.contrib import auth
from django.contrib.auth.decorators import login_required

from account.forms import RegistrationForm
from account.models import Account 
# Create your views here.

def login(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = auth.authenticate(username=username,password=password)
        if user is not None:
            auth.login(request, user)
            return redirect('store:home')
        else:
            messages.error(request,"Sai thông tin đăng nhập")
            return redirect('account:login')
    return render(request,'account/login.html')

def register(request):
    context = {}
    if request.method == 'POST':
        form = RegistrationForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data['username']
            raw_pass = form.cleaned_data['password1']
            user = auth.authenticate(username=username, password=raw_pass)
            auth.login(request, user)
            return redirect('store:home')
        else:
            context['register_form'] = form
    else:
        form = RegistrationForm()
        context['register_form'] = form
    return render(request,'account/register.html', context)

@login_required(login_url="login")
def logout(request):
    auth.logout(request)
    return redirect('account:login')
