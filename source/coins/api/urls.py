from django.conf.urls import url
from django.urls import path
from api import views

urlpatterns = [
    # /api/
    url(r'^history/$', views.history, name='history'),
    url(r'^info/$', views.info, name='info'),

    # url(r'^(?P<currencyPair>)/(?P<period>[0-9]+)/(?P<start>[0-9]+)/(?P<end>[0-9]+)/$', views.DetailView, name='detail'),

    # path('<slug:currencyPair>/<int:period>/<int:start>/<int:end>/', views.DetailView),

]