from django.db import models
from .calculator import calculate_credit_score
from django.contrib.auth.models import AbstractUser
from django.contrib.auth.base_user import BaseUserManager

LOAN_CHOICES=[("Auto Loan","Auto Loan"), ("Mortgage Loan","Mortgage Loan"), ("Other","Other")]
PAST_DUE_DAYS_CHOICES=[("30 Days","30 Days"),("60 Days","60 Days"),("90 Days","90 Days")]

# Create your models here.
class CustomUserManager(BaseUserManager):
     use_in_migrations=True
     def create_user(self,phone_no,name,password=None, is_staff=False,is_superuser=False,**extra_fields):
        if not phone_no:
             raise ValueError("phone_no must be provided")
        if not name:
             raise ValueError("name must be provided")
        user=self.model(phone_no=phone_no,name=name,**extra_fields)
        user.set_password(password)
        user.is_active=True
        user.is_staff=is_staff
        user.is_superuser=is_superuser
        user.save(self._db)
        return user
     
     def create_superuser(self,phone_no,name,password,**extra_fields):
          extra_fields.setdefault('is_staff',True)
          extra_fields.setdefault('is_active',True)
          extra_fields.setdefault('is_superuser',True)
          return self.create_user(phone_no,name,password,**extra_fields)

class User(AbstractUser):
    phone_no=models.CharField(verbose_name="phone",max_length=12,unique=True,primary_key=True)
    name=models.CharField(verbose_name="name",max_length=250,null=True)
    password=models.CharField(verbose_name="mpin",max_length=100,null=True)
    USERNAME_FIELD = 'phone_no'
    REQUIRED_FIELDS = ['name']
    username=None
    first_name = None
    last_name = None
    objects=CustomUserManager()

    def __str__(self):
        return self.phone_no

class CreditScore(models.Model):
        user=models.ForeignKey(User,on_delete=models.CASCADE)
        total_credit_limit=models.IntegerField(default=0)
        current_outstanding=models.IntegerField(default=0)
        utilization_ratio=models.FloatField()
        new_application=models.BooleanField(default=True)
        loan_type=models.CharField(max_length=250,default="Other",choices=LOAN_CHOICES)
        emi_payment=models.BooleanField()
        past_due_days=models.CharField(max_length=50,choices=PAST_DUE_DAYS_CHOICES)
        pay_emi_next_month=models.BooleanField()
        settlement=models.BooleanField()
        settling_amount=models.IntegerField()
        amount_due=models.IntegerField()
        credit_score=models.FloatField(null=True,default=750)

        def save(self, *args, **kwargs):
            previous_credit_score=650
            self.credit_score= calculate_credit_score( previous_credit_score,self.total_credit_limit, self.current_outstanding, self.utilization_ratio,self.new_application, self.loan_type, self.emi_payment, self.past_due_days, self.pay_emi_next_month, self.settlement, self.settling_amount, self.amount_due)
            super(CreditScore, self).save(*args, **kwargs)

class Expenses(models.Model):
    user=models.ForeignKey(User,on_delete=models.CASCADE)
    timestamp=models.DateField(auto_now=False)
    category=models.CharField(max_length=250)
    expense=models.FloatField(default=0)

