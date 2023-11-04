from django.db import models
from .calculator import calculate_credit_score

LOAN_CHOICES=[("Auto Loan","Auto Loan"), ("Mortgage Loan","Mortgage Loan"), ("Other","Other")]
PAST_DUE_DAYS_CHOICES=[("30 Days","30 Days"),("60 Days","60 Days"),("90 Days","90 Days")]

# Create your models here.
class User(models.Model):
    phone_no=models.BigIntegerField(primary_key=True)
    name=models.CharField(max_length=250)
    mpin=models.IntegerField()
    def __str__(self):
        return str(self.phone_no)

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

