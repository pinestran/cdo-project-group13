from django.db import models
from django.urls import reverse

# Create your models here.
'''
class Item(models.Model):
    date = models.BigIntegerField()
    high = models.BigIntegerField()
    low = models.BigIntegerField()
    open = models.BigIntegerField()
    close = models.BigIntegerField()
    volume = models.FloatField()
    quoteVolume = models.FloatField()
    weightedAverage = models.FloatField()

    
    def get_absolute_url(self):
        return reverse('music:detail', kwargs={'pk' : self.pk})
    
    def __str__(self):
        return self.date + ' - ' + self.open

'''
