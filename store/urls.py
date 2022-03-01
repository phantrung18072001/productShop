from django.urls import path
from . import views

app_name = 'store'

urlpatterns = [
    path('',views.home,name='home'),
    path('detail/<int:pk>',views.detail,name='detail'),
    path('shelf/',views.shelf,name='shelf'),
    path('add_cart/<int:pk>/', views.add_cart, name='add_cart'),
    path('update_cart', views.update_cart, name='update_cart'),  
    path('remove_cart', views.remove_cart, name='remove_cart'),
    path('order',views.order, name='order'),
    path('update_order/<int:order_id>',views.update_order, name='update_order'),
    path('infoShip',views.infoShip,name='infoShip'),
]