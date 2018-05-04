from django.db import connection
from django.http.response import JsonResponse

def history(request):

    currencyPair = request.GET.get('currencyPair')
    period = request.GET.get('period')
    start = request.GET.get('start')
    end = request.GET.get('end')

    query = "SELECT * from " + currencyPair +" WHERE timestamp >= " + start + " AND timestamp <= " + end

    cursor= connection.cursor()
    try:
        cursor.execute(query)
        data = cursor.fetchall()
        cursor.close()
    finally:
        cursor.close()

    return JsonResponse(data, safe=False)

def info(request):
    currencyPair = request.GET.get('currencyPair')
    query = "SELECT * from COINS_INFO  WHERE TABLE_NAME = '" + currencyPair + "'"

    cursor = connection.cursor()
    try:
        cursor.execute(query)
        data = cursor.fetchall()
        cursor.close()
    finally:
        cursor.close()

    return JsonResponse(data, safe=False)