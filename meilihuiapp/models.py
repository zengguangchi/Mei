from django.db import models

class User(models.Model):
    username=models.CharField(max_length=50)
    passwrod=models.CharField(max_length=50)
    token=models.CharField(max_length=200 )

class Lunbo(models.Model):
    img=models.CharField(max_length=200)
    def __str__(self):
        return self.img


class Men1(models.Model):
    menid=models.CharField(max_length=10)
    mai=models.CharField(max_length=20)
    img=models.CharField(max_length=100)
    title=models.CharField(max_length=100)
    p1=models.CharField(max_length=50)
    span=models.CharField(max_length=100)
    span1=models.CharField(max_length=100)

class GoodsDetailed1(models.Model):
    title = models.CharField(max_length=100)
    pr1 = models.CharField(max_length=50)
    span = models.CharField(max_length=20)
    span1 = models.CharField(max_length=20)
    smallimg1=models.CharField(max_length=100)
    smallimg2=models.CharField(max_length=100)
    smallimg3=models.CharField(max_length=100)
    dis=models.CharField(max_length=10)

class Men(models.Model):
    menid=models.CharField(max_length=10)
    mai=models.CharField(max_length=20)
    img=models.CharField(max_length=100)
    title=models.CharField(max_length=100)
    p1=models.CharField(max_length=50)
    span=models.CharField(max_length=100)
    span1=models.CharField(max_length=100)

class GoodsDetailed(models.Model):
    title = models.CharField(max_length=100)
    img=models.CharField(max_length=100)
    pr1 = models.CharField(max_length=50)
    span = models.CharField(max_length=20)
    span1 = models.CharField(max_length=20)
    smallimg1=models.CharField(max_length=100)
    smallimg2=models.CharField(max_length=100)
    smallimg3=models.CharField(max_length=100)
    dis=models.CharField(max_length=10)
