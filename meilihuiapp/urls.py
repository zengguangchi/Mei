from django.conf.urls import url

from meilihuiapp import views

urlpatterns=[
    url(r'^$',views.index,name='index'),
    url(r'^index/$',views.index,name='index'),
    url(r'^regsiter/$',views.regsiter,name='regsiter'),
    url(r'^logout/$',views.logout,name='logout'),
    url(r'^login/$',views.login,name='login'),
    url(r'^cart/$',views.cart,name='cart'),
    url(r'^addcart/$',views.addcart,name='addcart'),
    url(r'^checkemail/$',views.checkemail,name='checkemail'),
    url(r'^men/$',views.men,name='men'),
    url(r'^detailed/(\d+)/$',views.detailed,name='detailed'),
    url(r'^cartaddgoods/$',views.cartaddgoods,name='cartaddgoods'),
    url(r'^cartsugoods/$',views.cartsugoods,name='cartsugoods'),
    url(r'^chakanstuats/$',views.chakanstuats,name='chakanstuats'),
    url(r'^chakanall/$',views.chakanall,name='chakanall'),
    url(r'^genratorder/$',views.genratorder,name='genratorder'),
    url(r'^orderdetail/(.+)/$',views.orderdetail, name='orderdetail'),
    url(r'^orderlist/(\d+)/$',views.orderlist,name='orderlist'),
]
