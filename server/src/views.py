from django.shortcuts import render,HttpResponse
from .serializers import *
from .models import *
from rest_framework import viewsets
from rest_framework.views import APIView
from rest_framework.response import Response
import joblib
import sklearn

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

class PredictAPIView(APIView):
    def post(self, request):
        # Load the trained model and vectorizer
        classifier = joblib.load('src/svm_classifier_model.pkl')
        tfidf_vectorizer = joblib.load('src/tfidf_vectorizer.pkl')

        # Deserialize the input data using your serializer
        serializer = PredictionInputSerializer(data=request.data)

        if serializer.is_valid():
            input_sentence = serializer.validated_data['saving']
            input_features = tfidf_vectorizer.transform([input_sentence])

            output = classifier.predict(input_features)[0]

            if (output==1):
                return Response("Most welcome, Good bye! Its been my pleasure to help you :)")
            elif (output==2):
                return Response("To check your current balance, click on the link below and navigate to the specific account based on your requirement.")
            elif (output==3):
                return Response("Hey there! I am you personal AI assistant VAMAN, here to help you with your South Indian Bank related queries. What can I do for you today?")
            elif (output==4):
                return Response("Please check your total expenditure using this link.")
            elif (output==5):
                return Response("You can check out your monthly savings from the dashboard along with insights :)")
            elif (output==6):
                return Response("You can choose from a wide range of loans using these links.")
            elif (output==7):
                return Response("You can choose from a wide range of credit cards using these links.")
            elif (output==8):
                return Response("You can open a new account by clicking on this link. South Indian Bank offers the following types of acounts:")
            elif (output==0):
                return Response("Sure, what would you like me to do today?")

        else:
            return Response(serializer.errors)