from django.shortcuts import render, get_object_or_404
import cx_Oracle
from django.http import HttpResponse
from django.http.response import JsonResponse

def index(request):

    currencyPair = request.GET.get('currencyPair')
    period = request.GET.get('period')
    start = request.GET.get('start')
    end = request.GET.get('end')

    # connect to database
    connect = cx_Oracle.connect('SYSTEM','root','localhost:1521/COINS');

    # open cursor
    cursor = connect.cursor()
    query = "SELECT * from " + currencyPair +" WHERE timestamp >= " + start + " AND timestamp <= " + end
    cursor.execute(query)

    data = cursor.fetchall()

    cursor.close()
    connect.close()
    print(data[0])

    return JsonResponse(data, safe=False)