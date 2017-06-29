#!/usr/bin/env python
# -*- coding: utf-8 -*-
# author:zml
# import os
# import sys
import re
import time
import json
import requests
import pytesseract
from PIL import Image
from bs4 import BeautifulSoup
import time

# BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
# sys.path.append(BASE_DIR)
# img_file=os.path.join(BASE_DIR,'cmdb','code.png')
# print(img_file)

class Len_Longin(object):
    #用户登陆信息
    def __init__(self,name,pwd):
        self.uname=name
        self.upwd=pwd
        self.cookies={}
        self.times = int(time.time() * 1000)

    def get_cookie(self,url='http://www.lenovobp.com/',cookies=None,headers=None):
        #1.获取初始cookies
        index_url=url
        index_obj=requests.get(
            url=index_url,cookies=self.cookies,
            headers={'redirect':headers,},
        )
        self.cookies.update(index_obj.cookies.get_dict())
        return index_obj,self.cookies

    def get_vcode(self):
        #2.获取验证码
        bash_url='http://user.lenovobp.com/login/captcha?{0}'
        v_url=bash_url.format(self.times)#根据时间戳生成的验证码链接
        k,v=self.get_cookie(v_url)
        with open('code.png','wb') as file:#保存验证码图片
            file.write(k.content)
        img_obj=Image.open('code.png')#打开图片
        img_code=pytesseract.image_to_string(img_obj)#识别图片并输出字符串
        print('验证码:',img_code)
        return img_code

    def post_info(self):
        #3.提交用户名密码验证码等信息
        l_url='http://user.lenovobp.com/login/auth'
        u_obj=requests.post(
            url=l_url,
            data={
                'customer_code':self.uname,
                'customer_password':self.upwd,
                'captcha':self.get_vcode(),
            },
            cookies=self.cookies,
        )
        self.cookies.update(u_obj.cookies.get_dict())
        log_status=json.loads(u_obj.text,encoding='utf-8')
        return log_status

    def get_info(self):
        #4.获取用户简单信息
        qiandao_url='http://www.lenovobp.com/my_account_score'
        u_obj=self.get_cookie(url=qiandao_url,cookies=self.cookies)
        k,v = u_obj
        u_info_obj=BeautifulSoup(k.text,features='lxml')
        u_name=u_info_obj.find(name='dt')
        jifen_obj=u_info_obj.find(name='p',text=re.compile('可用积分.*'))
        jifen_num=jifen_obj.text
        print('''
        用户名:{0}
        手机号:{1}
        {2}
        '''.format(u_name.text.strip(),self.uname,jifen_num))

    def dati_post(self):
        d_url='http://jiazhipc.lenovo.com.cn/login/'
        d_urls=d_url.format(self.times)
        d_obj=self.get_cookie(url=d_urls,cookies=self.cookies,headers='http://jiazhipc.joinusad.com/login/index.php?')
        k,v = d_obj

    def pc_post(self):
        valid={'PHPSESSID':'f509m7779fg6q0l4du4do2ssd2'}
        pc_url='http://jiazhipc.joinusad.com/login/index.php?'
        pc_obj=self.get_cookie(
            # url=pc_url,cookies=self.cookies,
            url=pc_url,cookies=self.cookies.update(valid),
            headers = 'http://jiazhipc.joinusad.com/index.php?s=/Home/Index/index.html',
        )
        k,v = pc_obj
        # time.sleep(2)
        # print(self.cookies)
        # print(k.text)
        t_url='http://jiazhipc.joinusad.com/index.php?s=/Home/Exam/questions/id/106.html'
        t_obj=self.get_cookie(url=t_url,cookies=self.cookies)
        a,b=t_obj
        print(self.cookies)
        print(a.text)


if __name__ == '__main__':
    u1=Len_Longin('17896047621','308731044@qq.com')
    u_info=u1.post_info()
    u1.get_info()
    # u1.dati_post()
    u1.pc_post()
    print('登陆信息:',u_info)


