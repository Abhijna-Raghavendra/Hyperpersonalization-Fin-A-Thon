from django.core.management.base import BaseCommand
import csv
from src.models import *
import datetime

class Command(BaseCommand):
    help='import booms'

    def add_arguments(self, parser):
        pass

    def handle(self, *args, **options) :
        with open('csv_files/Jan_expense.csv') as file:
            reader=csv.reader(file)
            next(reader)  # Advance past the header

            Expenses.objects.all().delete()

            for row in reader:
                print(row)
                new_user=User.objects.get_or_create(phone_no=9896420171,name="ABC",mpin=22372)
                new_expense = Expenses(user=User.objects.get(phone_no=9896420171),
                            timestamp=row[1],
                            category=row[2],
                            expense=int(row[3]))
                new_expense.save()


