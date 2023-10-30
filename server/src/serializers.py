from rest_framework import serializers
from .models import *

class DumySerializer(serializers.Serializer):
    class Meta:
        model=Dumy
        fields="__all__"