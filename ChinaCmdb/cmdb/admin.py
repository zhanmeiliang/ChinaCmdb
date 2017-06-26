from django.contrib import admin
from cmdb import models
# Register your models here.

class MemoryAdmin(admin.ModelAdmin):
    list_display = ('model','capacity','slot','server_obj','warranty_date')
    search_fields = ('model',)
    list_filter = ('capacity','warranty_date',)
    date_hierarchy = 'warranty_date'
    ordering = ('slot',)


admin.site.register(models.UserProfile)
admin.site.register(models.AdminInfo)
admin.site.register(models.UserGroup)
admin.site.register(models.Project)
admin.site.register(models.IDC)
admin.site.register(models.Service)
admin.site.register(models.CustomTag)
admin.site.register(models.Assets)
admin.site.register(models.Hosts)
admin.site.register(models.NetworkDevice)
admin.site.register(models.Disk)
admin.site.register(models.NIC)
admin.site.register(models.Memory,MemoryAdmin)
admin.site.register(models.AssetRecord)
admin.site.register(models.ErrorLog)