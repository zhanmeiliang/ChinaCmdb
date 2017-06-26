from cmdb import views
from django.conf.urls import url

urlpatterns = [
    url(r'^index.html$',views.Index.as_view()),
    # url(r'^meta.html$',views.display_meta),
]
