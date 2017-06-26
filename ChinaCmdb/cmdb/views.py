from django.views import View
from django.shortcuts import render,HttpResponse,redirect
from cmdb import models


class Index(View):

    def get(self,request,*args,**kwargs):
        host_info=models.Hosts.objects.all()
        return render(request,'index.html',locals())


# def display_meta(request):
#     values=request.META.items()
#     html=[]
#     for k,v in values:
#         html.append('<tr><td>%s</td><td>%s</td></tr>' % (k, v))
#     return HttpResponse('<table>%s</table>' % '\n'.join(html))