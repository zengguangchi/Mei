import hashlib
import random
import time

from django.http import JsonResponse
from django.shortcuts import render, redirect

# Create your views here.
from meilihuiapp.models import User, Lunbo, Men, GoodsDetailed, Cart


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
    token = request.session.get('token')
    user = None
    if token:
        user = User.objects.get(token=token)

    return render(request,'details.html', context={'goods':goods,'user':user})


def men(request):
    mens=Men.objects.all()
    token = request.session.get('token')
    user = None
    if token:
        user = User.objects.get(token=token)
    return render(request,'men.html',context={'mens':mens,'user':user})


def checkemail(request):
    email=request.GET.get("email")
    users=User.objects.filter(email=email)
    if users.exists():
        return JsonResponse({'msg':'账号已存在','status':0})
    else:
        return JsonResponse({'mgs':'账号可用','status':1})


def cart(request):
    token = request.session.get('token')
    user = None
    if token:
        user = User.objects.get(token=token)
        carts=Cart.objects.filter(user=user).exclude(number=0)
        data ={
            'user': user,
            'carts':carts
        }
    return render(request,'cart.html',data)


def addcart(request):
    token=request.session.get('token')
    num = request.GET.get('value')
    if token:
        user=User.objects.get(token=token)
        goodsid = request.GET.get('goodsid')
        goods=GoodsDetailed.objects.get(pk=goodsid)
        carts=Cart.objects.filter(user=user).filter(goods=goods)
        if carts.exists():
         cart=carts.first()
         cart.number=cart.number+int(num)
         cart.save()

        else:
            cart=Cart()
            cart.user=user
            cart.goods=goods
            cart.number=num
            cart.save()
        return JsonResponse({'msg':'添加成功','status':1,'number':cart.number})

    else:
        return JsonResponse({'msg':'请登录','status':0})


def cartaddgoods(request):
    token=request.session.get('token')
    if token:
        user = User.objects.get(token=token)
        goodsid = request.GET.get('goodsid')
        goods = GoodsDetailed.objects.get(pk=goodsid)
        carts = Cart.objects.filter(user=user).filter(goods=goods)
        if carts.exists():
            cart = carts.first()
            cart.number = cart.number +1
            cart.save()
        return JsonResponse({'status':1,'number':cart.number})

def cartsugoods(request):
    token=request.session.get('token')
    user = User.objects.get(token=token)
    goodsid = request.GET.get('goodsid')
    goods = GoodsDetailed.objects.get(pk=goodsid)
    carts = Cart.objects.filter(user=user).filter(goods=goods)
    if carts.exists():
        cart = carts.first()
        cart.number = cart.number -1
        cart.save()
    return JsonResponse({'status':1,'number':cart.number})


def chakanstuats(request):
    cartid=request.GET.get('cartid')
    cart=Cart.objects.get(pk=cartid)
    cart.isselect= not  cart.isselect
    cart.save()
    data={
        'msg':'修改状态',
        "status":1,
        'isselect':cart.isselect
    }
    return JsonResponse(data)


def chakanall(request):
    token=request.session.get('token')
    user=User.objects.get(token=token)
    isall=request.GET.get('isall')
    if isall=='ture':
        isall=True
    else:
        isall=False
    cart=Cart.objects.filter(user=user).update(isselect=isall)

    data={
          'msg':'全选修改状态',
            'status':1
        }
    return JsonResponse(data)