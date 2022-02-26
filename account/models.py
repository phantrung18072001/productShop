from django.core.checks.messages import Error
from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager


class MyAccountManager(BaseUserManager):
    def create_user(self , username, phone, email, password=None):
        if not email:
            raise ValueError('Email address is required')

        if not username:
            raise ValueError('User name is required')

        if not phone:
            raise ValueError('Phone is required')

        # Tạo đối tượng user mới
        user = self.model(
            email=self.normalize_email(email=email),    # Chuyển email về dạng chuan hoa
            username=username,
            phone=phone,
        )
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, phone, username, password):
        user = self.create_user(
            email=self.normalize_email(email=email),
            username=username,
            password=password,
            phone=phone,
        )
        user.is_admin = True
        user.is_staff = True
        user.is_superuser = True
        user.save(using=self._db)
        return user

class Account(AbstractBaseUser):
    username = models.CharField(max_length=30, unique=True)
    email = models.EmailField(max_length=100, unique=True)
    phone = models.CharField(max_length=50)
    address = models.CharField(max_length=500)
    # required
    date_joined = models.DateTimeField(auto_now_add=True)
    last_login = models.DateTimeField(auto_now=True)
    is_admin = models.BooleanField(default=False)
    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)

    USERNAME_FIELD = 'username'    # Trường quyêt định khi login
    REQUIRED_FIELDS = ['email', 'phone']    # Các trường yêu cầu khi đk tài khoản

    objects = MyAccountManager()

    def __str__(self):
        return self.username

    def has_perm(self, perm, obj=None):
        return self.is_admin    # Admin có tất cả quyền trong hệ thống

    def has_module_perms(self, add_label):
        return True