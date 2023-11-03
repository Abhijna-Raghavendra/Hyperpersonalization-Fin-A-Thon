from django.urls import path,include
from rest_framework import routers
from  .views import *
from rest_framework.routers import DefaultRouter

router=DefaultRouter()
router.register(r"User",UserModelViewSet,basename="User")
router.register(r"CreditScore",CreditScoreModelViewSet,basename="CreditScore")
router.register(r"Expenses",ExpensesModelViewSet,basename="Expenses")

urlpatterns=router.urls