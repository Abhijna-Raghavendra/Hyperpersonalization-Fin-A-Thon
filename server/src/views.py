from django.shortcuts import render,HttpResponse
from .serializers import *
from .models import *
from rest_framework import viewsets

# Create your views here.

class UserModelViewSet(viewsets.ModelViewSet):
    queryset=User.objects.all()
    serializer_class=UserSerializer

class CreditScoreModelViewSet(viewsets.ModelViewSet):
    queryset=CreditScore.objects.all()
    serializer_class=CreditScoreSerializer


class ExpensesModelViewSet(viewsets.ModelViewSet):
    queryset=Expenses.objects.all()
    serializer_class=ExpensesSerializer