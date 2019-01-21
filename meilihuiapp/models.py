from django.db import models

class User(models.Model):
    email=models.CharField(max_length=100)
    phone=models.CharField(max_length=20)
    name=models.CharField(max_length=50)
    passwrod=models.CharField(max_length=50)
    token=models.CharField(max_length=200 )

class Lunbo(models.Model):
    img=models.CharField(max_length=200)
    def __str__(self):
        return self.img

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
class Cart(models.Model):
    user= models.ForeignKey(User)
    goods=models.ForeignKey(GoodsDetailed)
    isselect=models.BooleanField(default=True)
    number=models.IntegerField()
class Order(models.Model):
    user =models.ForeignKey(User)
    status=models.IntegerField(default=0)
    createtime=models.DateField(auto_now_add=True)
    identifier=models.CharField(max_length=256)
class OrderGoods(models.Model):
    order=models.ForeignKey(Order)
    goods=models.ForeignKey(GoodsDetailed)
    number=models.IntegerField()