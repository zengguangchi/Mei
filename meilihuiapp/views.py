import hashlib
import random
import time
from django.shortcuts import render, redirect

# Create your views here.
from meilihuiapp.models import User, Lunbo


def index(request):
    lunbos= Lunbo.objects.all()
    token = request.session.get('token')
    users = User.objects.filter(token=token)
    if users.count():
        user= users.first()
        username=user.username
    else:
        username = None

    return render(request, 'index.html', context={'username':username ,'lunbos':lunbos})



def getattr_token():
    token=str(time.time())+str(random.random())
    m=hashlib.md5()
    m.update(token.encode('utf8'))
    return m.hexdigest()


def getattr_password(password):
    hast=hashlib.md5()
    hast.update(password.encode('utf8'))
    return hast.hexdigest()



def regsiter(request):
    if request.method=="GET":
        return render(request, 'regsiter.html')
    elif request.method=='POST':
        user=User()
        user.username=request.POST.get('phone')
        user.passwrod=getattr_password(request.POST.get('password'))
        user.token=getattr_token()
        user.save()
        response=redirect('mlh:index')
        request.session['token']=user.token
        return response


def login(request):
    if request.method=='GET':
        return render(request,'login.html')
    elif request.method =='POST':
        username=request.POST.get('username')
        password=getattr_password(request.POST.get('password'))
        users=User.objects.filter(username=username).filter(passwrod=password)
        if users.count():
            user=users.first()
            user.token=getattr_token()
            user.save()
            response=redirect('mlh:index')
            request.session['token'] = user.token
            return response
        else:
            return render(request,'login.html',context={'err':'用户不存在或密码错误'})
def logout(request):
    response=redirect('mlh:index')
    request.session.flush()
    return response


def detailed(request):
    return render(request,'detailed.html')