from django.urls import path
from . import views

app_name = 'admin'

urlpatterns = [
    path('product_Modify',views.product_Modify,name='product_Modify'),
    path('dashboard',views.dashboard,name='dashboard'),
    path('statusChange',views.statusChange,name='statusChange'),
    path('product_Add',views.product_Add,name='product_Add'),
    path('products_List',views.products_List,name='products_List'),
    path('products_Update',views.products_Update,name='products_Update'),
    path('product_Update',views.product_Update,name='product_Update'),
    path('product_Delete',views.product_Delete,name='product_Delete'),
    path('orders_List',views.orders_List,name='orders_List'),
    path('users_List',views.users_List,name='users_List'),
]