from django.db import connection
from django.http.response import JsonResponse

def history(request):

    currencyPair = request.GET.get('currencyPair')
    period = request.GET.get('period')
    start = request.GET.get('start')
    end = request.GET.get('end')

    query = get_data_by_period(currencyPair,period,start,end)

    # query = "SELECT * from " + currencyPair +" WHERE timestamp >= " + start + " AND timestamp <= " + end
    # print(query)

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

def get_data_by_period(table, period, start, end):
    query = """
      select t.grp_id,
          t.high,
          t.low,
          price_min.open,
          price_max.close
          from (
            select tmp.grp_id,
            min(tmp.LOW) as low,
            max(tmp.HIGH) as high,
            min(tmp.TIMESTAMP) as min_time,
            max(tmp.timestamp) as max_time
              from (
                 select  (""" + period + """ * trunc(TIMESTAMP/""" + period + """)) as grp_id,low,HIGH,TIMESTAMP from """ + table + """ WHERE TIMESTAMP >= """ + start + """ AND timestamp <= """ + end + """
               ) tmp
            group by grp_id) t
          join usdt_btc price_min on price_min.timestamp = t.min_time
          join usdt_btc price_max on price_max.timestamp = t.max_time 
        """

    return query
