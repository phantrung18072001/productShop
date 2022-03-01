from itertools import product
from django.db import models

from account.models import Account

# Create your models here.

CATEGORY_CHOICES = (
    ('Dell','Dell'),
    ('Asus','Asus'),
    ('HP','HP'),
    ('Lenovo','Lenovo'),
    ('Apple','Apple'),
    ('Razer','Razer'),
    ('Acer','Acer'),
)

class Category(models.Model):
    name = models.CharField(choices=CATEGORY_CHOICES,max_length=10)

class Discount(models.Model):
    name = models.CharField(max_length=50)
    desc = models.TextField(max_length=500)
    discount_percent = models.IntegerField(blank=True, default=0)
    is_active = models.BooleanField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)


class Product(models.Model):
    name = models.CharField(max_length=100)
    desc = models.TextField(max_length=500)
    CPU = models.CharField(max_length=100)
    RAM = models.CharField(max_length=50)
    Card = models.CharField(max_length=50)
    Screen = models.CharField(max_length=50)
    price = models.IntegerField()
    category_id = models.ForeignKey(Category, on_delete=models.CASCADE, related_name='cate')
    discount_id = models.ForeignKey(Discount,blank=True, null=True, on_delete=models.DO_NOTHING, related_name='disc')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    deleted_at = models.DateTimeField(null=True, blank=True)

class Image(models.Model):
    path = models.ImageField(default='logo_shop.jpg')
    product_id = models.ForeignKey(Product,on_delete=models.CASCADE,related_name='images')
    main_image = models.BooleanField(default=False)

class Inventory(models.Model):
    quantity = models.IntegerField()
    product_id = models.OneToOneField(Product, on_delete=models.CASCADE, related_name='inven')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    deleted_at = models.DateTimeField(null=True, blank=True)
class Cart(models.Model):
    user_id = models.OneToOneField(Account, on_delete=models.CASCADE)
    total = models.IntegerField(default=0)
    created_at = models.DateTimeField(auto_now_add=True) 
    def __str__(self): 
        return str(self.user_id)

class CartItem(models.Model):
    product_id = models.ForeignKey(Product, on_delete=models.CASCADE) 
    cart_id = models.ForeignKey(Cart, on_delete=models.CASCADE) 
    quantity = models.IntegerField() 
    def __str__(self): 
        return str(self.product_id)

STATUS_ORDER = (
    ('Chờ xử lý','Chờ xử lý'),
    ('Đang vận chuyển','Đang vận chuyển'),
    ('Đã hủy','Đã hủy'),
    ('Hoàn thành','Hoàn thành')
)

class Order(models.Model):
    user_id = models.ForeignKey(Account, on_delete=models.CASCADE)
    total = models.IntegerField()
    status = models.CharField(default=STATUS_ORDER[0][0],choices=STATUS_ORDER,max_length=100)
    address = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    deleted_at = models.DateTimeField(null=True, blank=True)

class OrderItem(models.Model):
    product_id = models.ForeignKey(Product,on_delete=models.CASCADE)
    order_id = models.ForeignKey(Order, on_delete=models.CASCADE, related_name="order_item")
    quantity = models.IntegerField()
    price = models.IntegerField()
