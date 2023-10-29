from django.urls import path,include
from rest_framework import routers
from src import views

urlpatterns=[
    path('server/',views.hello)
]
