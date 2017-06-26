#!/usr/bin/env python
# -*- coding: utf-8 -*-

import requests
import time
import json
from bs4 import BeautifulSoup

log_url='http://user.lenovobp.com/login?redirect=http://www.lenovobp.com'
var_url='http://user.lenovobp.com/login/auth'
uname='17896060538'
upass='308731044@qq.com'
session=requests.Session()


img_base_url='http://user.lenovobp.com/login/captcha?{0}'
ctime=time.time()*1000
img_url=img_base_url.format(int(ctime))
print(img_url)
img=session.get(
    url=img_url
)
with open('code.png','wb') as file:
    file.write(img.content)
img_code=input('请输入验证码:').strip()

u_obj=session.post(
    url=var_url,
    data={
        'customer_code':uname,
        'customer_password':upass,
        'captcha':img_code,
    },
)
cookies_obj=u_obj.cookies.get_dict()
mall_obj=session.get(
    url='http://mall.lenovobp.com/',
)
mall_bs4_obj=BeautifulSoup(mall_obj.text,'html.parser')
dl_obj=mall_bs4_obj.find(name='section',attrs={'id':'js_cart'})
p_obj=dl_obj.children
for i in p_obj:
    print(i)