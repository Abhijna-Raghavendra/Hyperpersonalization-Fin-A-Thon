from django.shortcuts import render,HttpResponse
from .serializers import *
from .models import *
from rest_framework import viewsets

# Create your views here.

def hello(request):
    return HttpResponse("HELLO WORLD")

class DumyModelViewSet(viewsets.ModelViewSet):
    queryset=Dumy.objects.all()
    serializer_class=DumySerializer
