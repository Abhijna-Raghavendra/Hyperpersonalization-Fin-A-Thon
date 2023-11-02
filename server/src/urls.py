from django.urls import path,include
from rest_framework import routers
from  .views import *
from rest_framework.routers import DefaultRouter

router=DefaultRouter()
router.register(r"dumy",DumyModelViewSet,basename="dumy")

urlpatterns=[
    path('server/',hello),
]+router.urls