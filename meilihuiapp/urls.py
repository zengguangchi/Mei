from django.conf.urls import url

from meilihuiapp import views

urlpatterns=[
    url(r'^$',views.index,name='index'),
    url(r'^index/$',views.index,name='index'),
    url(r'^regsiter/$',views.regsiter,name='regsiter'),
    url(r'^logout/$',views.logout,name='logout'),
    url(r'^login/$',views.login,name='login'),
    url(r'^men/$',views.men,name='men'),
    url(r'^detailed/(\d+)/$',views.detailed,name='detailed'),
]
