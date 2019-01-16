import hashlib
import random
import time

from django.http import JsonResponse
from django.shortcuts import render, redirect

# Create your views here.
from meilihuiapp.models import User, Lunbo,Men, GoodsDetailed


def index(request):
    lunbos= Lunbo.objects.all()

    token = request.session.get('token')
    user=None
    if token:
        user=User.objects.get(token=token)
    return render(request, 'index.html', context={'user':user ,'lunbos':lunbos})



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
        user.email=request.POST.get('email')
        user.passwrod=getattr_password(request.POST.get('password'))
        user.name=request.POST.get('name')
        user.phone=request.POST.get('phone')
        user.token=getattr_token()
        request.session['token'] = user.token
        user.save()
        return redirect('mlh:index')


def login(request):
    if request.method=='GET':
        return render(request,'login.html')
    elif request.method =='POST':
        email=request.POST.get('email')
        print(email)
        password=getattr_password(request.POST.get('password'))

        try:
            user=User.objects.get(email=email)

            if user.passwrod == password:
                user.token=getattr_token()
                user.save()
                request.session['token']=user.token
                return redirect('mlh:index')
            else:
                return render(request,'login.html',context={'err':'密码错误'})
        except:
            return render(request,'login.html',context={'err':'用户不存在'})
def logout(request):
    response=redirect('mlh:index')
    request.session.flush()
    return response


def detailed(request,goodsid):
    goods=GoodsDetailed.objects.get(pk=goodsid)

    return render(request,'details.html', context={'goods':goods})


def men(request):
    mens=Men.objects.all()
    return render(request,'men.html',context={'mens':mens})


def checkemail(request):
    email=request.GET.get("email")
    users=User.objects.filter(email=email)
    if users.exists():
        return JsonResponse({'msg':'账号已存在','status':0})
    else:
        return JsonResponse({'mgs':'账号可用','status':1})