from django.contrib import admin
from .models import *
# Register your models here.

class ProductAdmin(admin.ModelAdmin):
    list_display = ('name', 'price' , 'category_id', 'discount_id')
    list_display_links = ('name',)   # Các trường có gắn link dẫn đến trang detail
    ordering = ('-created_at',)     # Sắp xếp theo chiều ngược
    search_fields = ('name','category_id')

class DiscountAdmin(admin.ModelAdmin):
    list_display = ('name', 'discount_percent','is_active')

class ImageAdmin(admin.ModelAdmin):
    list_display = ('product_id', 'path')
    list_display_links = ('product_id',)   # Các trường có gắn link dẫn đến trang detail
class InventoryAdmin(admin.ModelAdmin):
    list_display = ('product_id', 'quantity')
    list_display_links = ('product_id',)   # Các trường có gắn link dẫn đến trang detail

class CategoryAdmin(admin.ModelAdmin):
    list_display = ('id', 'name')
    list_display_links = ('name',)

class CartAdmin(admin.ModelAdmin):
    list_display = ('user_id', 'total',)

class CartItemAdmin(admin.ModelAdmin):
    list_display = ('product_id', 'cart_id', 'quantity',)

class OrderAdmin(admin.ModelAdmin):
    list_display = ('user_id','address','total','status','created_at')

class OrderItemAdmin(admin.ModelAdmin):
    list_display = ('order_id','product_id','quantity','price')

admin.site.register(Category,CategoryAdmin)
admin.site.register(Product,ProductAdmin)
admin.site.register(Discount,DiscountAdmin)
admin.site.register(Image,ImageAdmin)
admin.site.register(Inventory,InventoryAdmin)

admin.site.register(Cart, CartAdmin)
admin.site.register(CartItem, CartItemAdmin)

admin.site.register(Order,OrderAdmin)
admin.site.register(OrderItem,OrderItemAdmin)