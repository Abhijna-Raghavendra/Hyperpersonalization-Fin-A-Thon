from rest_framework import serializers
from .models import *

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model=User
        fields="__all__"

class CreditScoreSerializer(serializers.ModelSerializer):
    class Meta:
        model=CreditScore
        fields="__all__"

class ExpensesSerializer(serializers.ModelSerializer):
    class Meta:
        model=Expenses
        fields="__all__"

class PredictionInputSerializer(serializers.Serializer):
    saving = serializers.CharField(required=True, max_length=250)