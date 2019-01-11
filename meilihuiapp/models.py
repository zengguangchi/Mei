from django.db import models

class User(models.Model):
    username=models.CharField(max_length=50)
    passwrod=models.CharField(max_length=50)
    token=models.CharField(max_length=200 )

class Lunbo(models.Model):
    img=models.CharField(max_length=200)
    def __str__(self):
        return self.img

class Men(models.Model):
    mai=models.CharField(max_length=40)
    img=models.CharField(max_length=50)
    p=models.CharField(max_length=50)
    span=models.CharField(max_length=50)
    class Mate:
        id=models.CharField(max_length=20)