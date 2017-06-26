from django.db import models


# Create your models here.


class UserProfile(models.Model):
    '''用户信息'''

    duties_type_choices = (
        (0, 'IT'),
        (1, '运维'),
        (2, 'DBA'),
        (3, '运维经理'),
        (4, '开发'),
        (5, '开发经理'),
        (6, '项目经理'),
        (7, '技术总监'),
    )

    sector_type_choices = (
        (0, '网络系统部'),
        (1, '开发部'),
        (2, '项目部'),
        (3, '技术部'),
    )

    name = models.CharField(max_length=32, unique=True, verbose_name='姓名')
    duties = models.PositiveSmallIntegerField(choices=duties_type_choices, verbose_name='职务',default=1)
    sector = models.PositiveSmallIntegerField(choices=sector_type_choices, verbose_name='部门',default=0)
    phone = models.CharField(max_length=16, blank=True,verbose_name='座机')
    wechat = models.CharField(max_length=32, verbose_name='微信')
    mobile = models.CharField(max_length=15, verbose_name='手机', unique=True)
    email = models.EmailField(verbose_name='邮箱')
    create_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')
    modify_time = models.DateTimeField(auto_now=True, verbose_name='最后修改时间')

    class Meta:
        verbose_name_plural = '用户表'
        ordering=['sector']

    def __str__(self):
        return self.name


class AdminInfo(models.Model):
    '''管理用户登陆相关信息'''
    admin_type_choices = (
        (0, '普通用户'),
        (1, '管理员'),
        (2, '超级管理员'),
    )
    name = models.OneToOneField('UserProfile', verbose_name='用户名')
    password = models.CharField(max_length=32, verbose_name='用户密码')
    admin_type = models.PositiveSmallIntegerField(choices=admin_type_choices, verbose_name='用户类型',default=0)
    create_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')
    modify_time = models.DateTimeField(auto_now=True, verbose_name='最后修改时间')

    class Meta:
        verbose_name_plural = '管理用户表'
        ordering=['admin_type']

    def __str__(self):
        return str(self.name)


class UserGroup(models.Model):
    '''用户组'''
    name = models.CharField(max_length=32, unique=True, verbose_name='用户组')
    users = models.ManyToManyField('UserProfile', verbose_name='关联用户')
    group_info = models.CharField(max_length=128,blank=True, null=True, verbose_name="用户组描述")
    create_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')
    modify_time = models.DateTimeField(auto_now=True, verbose_name='最后修改时间')

    class Meta:
        verbose_name_plural = '用户组表'
        ordering=['name']

    def __str__(self):
        return self.name


class Project(models.Model):
    '''项目信息'''
    name = models.CharField(max_length=64, unique=True, verbose_name='项目名')
    head = models.ForeignKey('UserGroup', verbose_name='项目负责人', related_name='project_head')
    manager = models.ForeignKey('UserGroup', verbose_name='系统管理员', related_name='project_manager')
    description = models.CharField(max_length=128,blank=True, verbose_name='项目备注')
    create_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')
    modify_time = models.DateTimeField(auto_now=True, verbose_name='最后修改时间')

    class Meta:
        verbose_name_plural = '项目表'
        ordering=['name']

    def __str__(self):
        return self.name


class IDC(models.Model):
    '''机房信息'''
    isp_type_choices = (
        (0, '电信'),
        (1, '联通'),
        (2, '移动'),
        (3, 'BGP'),
    )

    idc_type_choices = (
        (0, '第三方'),
        (1, '自建'),
        (2, '阿里云'),
    )
    name = models.CharField(max_length=32, verbose_name='机房名')
    phone = models.CharField(max_length=32, verbose_name='联系电话')
    linkman = models.CharField(max_length=32, blank=True, verbose_name='联系人')
    operator = models.IntegerField(choices=isp_type_choices, blank=True, null=True, verbose_name="运营商", default=3)
    type = models.IntegerField(choices=idc_type_choices, blank=True, null=True, verbose_name="机房类型",default=0)
    bandwidth = models.CharField(max_length=64, blank=True, verbose_name='机房带宽')
    floor = models.IntegerField(default=1, verbose_name='机房楼层')
    address = models.CharField(max_length=128, blank=True, verbose_name="机房地址")
    create_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')
    modify_time = models.DateTimeField(auto_now=True, verbose_name='最后修改时间')

    class Meta:
        verbose_name_plural = '机房表'
        ordering=['name']

    def __str__(self):
        return self.name


class Service(models.Model):
    '''安装服务信息:Nginx,php,lvs,haproxy...'''
    name = models.CharField(max_length=32, unique=True,blank=True, verbose_name='服务名')
    version = models.CharField(max_length=16, unique=True, blank=True, verbose_name='服务版本')
    port = models.PositiveIntegerField(null=True, blank=True, verbose_name='服务端口')
    path = models.CharField(blank=True, max_length=32, verbose_name='服务路径')
    cmd = models.CharField(blank=True, max_length=32, verbose_name='服务重启命令')
    create_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')
    modify_time = models.DateTimeField(auto_now=True, verbose_name='最后修改时间')

    class Meta:
        verbose_name_plural = '安装服务表'
        ordering=['name']

    def __str__(self):
        return self.name


class CustomTag(models.Model):
    '''自定义标签'''
    name = models.CharField(max_length=32, verbose_name='自定义标签', unique=True)
    create_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')
    modify_time = models.DateTimeField(auto_now=True, verbose_name='最后修改时间')

    class Meta:
        verbose_name_plural = '自定义标签'
        ordering=['name']

    def __str__(self):
        return self.name


class Assets(models.Model):
    '''资产信息表'''

    device_type_choices = (
        (0, '物理机'),
        (1, '虚拟机'),
        (2, '交换机'),
        (3, '路由器'),
        (4, '防火墙'),
    )

    device_status_choices = (
        (0, '使用'),
        (1, '未用'),
        (2, '报废'),
    )

    device_type_id = models.PositiveSmallIntegerField(choices=device_type_choices, default=0, verbose_name='设备类型')
    device_status_id = models.PositiveSmallIntegerField(choices=device_status_choices, default=0, verbose_name='设备状态')
    cabinet_num = models.CharField(max_length=32,blank=True, verbose_name='机柜号')
    cabinet_order = models.CharField(max_length=32, blank=True, verbose_name='机柜序号')
    idc = models.ForeignKey('IDC', null=True, blank=True, verbose_name='所属机房')
    Project = models.ForeignKey('Project', null=True, blank=True, verbose_name='所属项目')
    create_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')
    modify_time = models.DateTimeField(auto_now=True, verbose_name='最后修改时间')
    notes = models.CharField(max_length=128,blank=True, null=True, verbose_name="备注")


    class Meta:
        verbose_name_plural = '资产表'
        ordering=['idc']

    def __str__(self):
        return '{idc_name}-{device_type}-{cabinet_num}-{cab_ord}'.format(idc_name=self.idc.name,
                                                                         device_type=self.device_type_choices[self.device_type_id][1],
                                                                         cabinet_num=self.cabinet_num,
                                                                         cab_ord=self.cabinet_order)


class Hosts(models.Model):
    '''服务器信息'''

    manfacturer_type_choices = (
        (0, 'Dell'),
        (1, 'HP'),
    )

    os_type_choices=(
        (0,'Centos'),
        (1,'RedHat'),
        (2,'Windos'),
    )

    asset_obj = models.OneToOneField('Assets',verbose_name='资产对象')
    hostname = models.CharField(max_length=32, unique=True, verbose_name='主机名')
    manage_ip = models.GenericIPAddressField(null=True, blank=True, verbose_name='管理IP')
    os_platform = models.PositiveSmallIntegerField(choices=os_type_choices, verbose_name='系统',default=0)
    os_version = models.CharField(max_length=16,verbose_name='系统版本')
    cpu_model = models.CharField(max_length=16, null=True, blank=True, verbose_name='CPU型号')
    cpu_physical_count = models.IntegerField(null=True, blank=True, verbose_name='CPU物理个数')
    cpu_count = models.IntegerField(null=True, blank=True, verbose_name='CPU逻辑核数')
    service = models.ManyToManyField('Service', verbose_name='服务')
    model = models.CharField(max_length=16, null=True, blank=True, verbose_name='设备型号')
    manfacturer_id = models.PositiveSmallIntegerField(choices=manfacturer_type_choices, default=0, verbose_name='制造商')
    custom_tag = models.ManyToManyField('CustomTag', verbose_name='自定义标签')
    assets_tag = models.CharField(max_length=32,unique=True,blank=True, verbose_name='资产标签')
    sn = models.CharField(max_length=32, db_index=True, verbose_name='SN号', unique=True)
    buy_date = models.DateField(blank=True, null=True, verbose_name='购买日期')
    warranty_date = models.DateField(blank=True, null=True, verbose_name='保修日期')
    create_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')
    modify_time = models.DateTimeField(auto_now=True, verbose_name='最后修改时间')

    class Meta:
        verbose_name_plural = '服务器表'
        ordering=['hostname']

    def __str__(self):
        return self.hostname


class NetworkDevice(models.Model):
    '''网络设备信息'''

    manfacturer_type_choices = (
        (0, 'CISO'),
        (1, 'RuiJie'),
        (2, 'H3C'),
    )

    asset_obj = models.OneToOneField('Assets',verbose_name='资产对象')
    vlan_ip = models.GenericIPAddressField(null=True, blank=True, verbose_name='VlanIP')
    intranet_ip = models.GenericIPAddressField(null=True, blank=True, verbose_name='内网IP')
    manage_ip = models.GenericIPAddressField(null=True, blank=True, verbose_name='管理IP')
    port_num = models.PositiveSmallIntegerField(null=True, blank=True, verbose_name='端口个数')
    model = models.CharField(max_length=16, null=True, blank=True, verbose_name='设备型号')
    manfacturer_id = models.PositiveSmallIntegerField(choices=manfacturer_type_choices, default=0, verbose_name='制造商')
    custom_tag = models.ManyToManyField('CustomTag', verbose_name='自定义标签')
    assets_tag = models.CharField(max_length=32, unique=True, blank=True, verbose_name='资产标签')
    sn = models.CharField(max_length=32, db_index=True, verbose_name='SN号', unique=True)
    buy_date = models.DateField(blank=True, null=True, verbose_name='购买日期')
    warranty_date = models.DateField(blank=True, null=True, verbose_name='保修日期')
    create_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')
    modify_time = models.DateTimeField(auto_now=True, verbose_name='最后修改时间')

    class Meta:
        verbose_name_plural = '网络设备表'
        ordering=['intranet_ip']

    def __str__(self):
        return self.intranet_ip


class Disk(models.Model):
    '''硬盘信息'''

    manfacturer_type_choices=(
        (0,'Dell'),
        (1,'Seagate'),
        (2,'WD'),
        (3,'HITACHI'),
        (4,'SamSung'),
    )

    capacity = models.FloatField(verbose_name='硬盘容量')
    pd_type = models.CharField(max_length=32, verbose_name='硬盘类型')
    slot = models.CharField(max_length=16, verbose_name='硬盘插槽位')
    model = models.CharField(max_length=16, verbose_name='硬盘型号')
    manfacturer_id = models.PositiveSmallIntegerField(choices=manfacturer_type_choices, default=0, verbose_name='制造商')
    assets_tag = models.CharField(max_length=32, unique=True, blank=True, verbose_name='资产标签')
    sn = models.CharField(max_length=32, db_index=True, verbose_name='SN号', unique=True)
    server_obj = models.ForeignKey('Hosts', related_name='disk', verbose_name='所属服务器')
    buy_date = models.DateField(blank=True, null=True, verbose_name='购买日期')
    warranty_date = models.DateField(blank=True, null=True, verbose_name='保修日期')
    create_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')
    modify_time = models.DateTimeField(auto_now=True, verbose_name='最后修改时间')


    class Meta:
        verbose_name_plural = '硬盘表'
        ordering=['server_obj']

    def __str__(self):
        return '{server}-{capacity}-{slot}'.format(server=self.server_obj.hostname,capacity=self.capacity,slot=self.slot)


class NIC(models.Model):
    '''网卡信息'''

    name = models.CharField(max_length=32, verbose_name='网卡名')
    hwaddr = models.CharField(max_length=32, verbose_name='MAC地址')
    netmask = models.CharField(max_length=32, verbose_name='子网掩码')
    ipaddrs = models.GenericIPAddressField(max_length=32, verbose_name='IP地址')
    model = models.CharField(max_length=16, verbose_name='网卡型号')
    server_obj = models.ForeignKey('Hosts', related_name='nic', verbose_name='所属服务器')
    create_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')
    modify_time = models.DateTimeField(auto_now=True, verbose_name='最后修改时间')

    class Meta:
        verbose_name_plural = '网卡表'
        ordering=['ipaddrs']

    def __str__(self):
        return '{server}-{name}-{ipaddrs}'.format(server=self.server_obj.hostname,name=self.name,ipaddrs=self.ipaddrs)


class Memory(models.Model):
    """内存信息"""

    manfacturer_type_choices=(
        (0,'SamSung'),
        (1,'Kingston'),
        (2,'Micron'),
    )

    model = models.CharField(max_length=16, verbose_name='内存型号')
    capacity = models.FloatField(null=True, blank=True, verbose_name='容量')
    slot = models.CharField(max_length=16, verbose_name='插槽位')
    manfacturer_id = models.PositiveSmallIntegerField(choices=manfacturer_type_choices, default=0, verbose_name='制造商')
    assets_tag = models.CharField(max_length=32, unique=True, blank=True, verbose_name='资产标签')
    sn = models.CharField(max_length=32, db_index=True, verbose_name='SN号', unique=True)
    server_obj = models.ForeignKey('Hosts', related_name='mem', verbose_name='所属服务器')
    buy_date = models.DateField(blank=True, null=True, verbose_name='购买日期')
    warranty_date = models.DateField(blank=True, null=True, verbose_name='保修日期')
    create_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')
    modify_time = models.DateTimeField(auto_now=True, verbose_name='最后修改时间')

    class Meta:
        verbose_name_plural = "内存表"
        ordering=['server_obj']

    def __str__(self):
        return '{server}-{capacity}-{slot}'.format(server=self.server_obj.hostname,capacity=self.capacity,slot=self.slot)


class AssetRecord(models.Model):
    """
    资产变更记录,creator为空时，表示是资产汇报的数据。
    """
    asset_obj = models.ForeignKey('Assets', related_name='rcord', verbose_name='变更对象')
    content = models.TextField(verbose_name='变更内容')
    creator = models.ForeignKey('UserProfile', null=True, blank=True)
    modify_time = models.DateTimeField(auto_now=True, verbose_name='最后修改时间')

    class Meta:
        verbose_name_plural = "资产记录表"
        ordering=['asset_obj']

    def __str__(self):
        return "{idc_name}-{cabinet_num}-{cabinet_order}".format(idc_name=self.asset_obj.idc.name,
                                                                 cabinet_num=self.asset_obj.cabinet_num,
                                                                 cabinet_order=self.asset_obj.cabinet_order,)


class ErrorLog(models.Model):
    """
    错误日志,如:agent采集数据错误或运行错误
    """
    asset_obj = models.ForeignKey('Assets', null=True, blank=True, verbose_name='错误对象')
    title = models.CharField(max_length=16, verbose_name='日志标题')
    content = models.TextField(verbose_name='日志内容')
    modify_time = models.DateTimeField(auto_now=True, verbose_name='最后修改时间')

    class Meta:
        verbose_name_plural = "错误日志表"
        ordering=['asset_obj']

    def __str__(self):
        return self.title