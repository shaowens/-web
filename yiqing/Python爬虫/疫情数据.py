import json

import numpy as np
import pymysql
import requests
from bs4 import BeautifulSoup
import datetime

url = 'https://ncov.dxy.cn/ncovh5/view/pneumonia?from=timeline&isappinstalled=0'  #请求地址
headers = {'user-agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36'}#创建头部信息
response =  requests.get(url,headers = headers)  #发送网络请求
#print(response.content.decode('utf-8'))#以字节流形式打印网页源码
content = response.content.decode('utf-8')
#print(content)
soup = BeautifulSoup(content, 'html.parser')
listA = soup.find_all(name='script',attrs={"id":"getAreaStat"})
listB = soup.find_all(name='script',attrs={"id":"getListByCountryTypeService2true"})
#世界确诊getAreaStat

#listA = soup.find_all(name='divlistB = soup.find_all(name='script',attrs={"id":"getListByCountryTypeService2true"})',attrs={"class":"c-touchable-feedback c-touchable-feedback-no-default"})
account = str(listA)
world_messages = str(listB)[95:-21]
messages = account[52:-21]
messages_json = json.loads(messages)
print(world_messages)
world_messages_json = json.loads(world_messages)
valuesList = []
cityList = []
worldList = []
now_time = datetime.datetime.now().strftime('%Y-%m-%d')

for k in range(len(world_messages_json)):
    worldvalue = (now_time,
             world_messages_json[k].get('countryType'),world_messages_json[k].get('continents'),world_messages_json[k].get('provinceId'),world_messages_json[k].get('provinceName'),
             world_messages_json[k].get('provinceShortName'),world_messages_json[k].get('cityName'),world_messages_json[k].get('currentConfirmedCount'),world_messages_json[k].get('confirmedCount'),
             world_messages_json[k].get('suspectedCount'),world_messages_json[k].get('curedCount'),world_messages_json[k].get('deadCount'),world_messages_json[k].get('locationId'),
             world_messages_json[k].get('countryShortCode'),)
    worldList.append(worldvalue)
for i in range(len(messages_json)):
    #value = messages_json[i]
    value = (now_time,messages_json[i].get('provinceName'),messages_json[i].get('provinceShortName'),messages_json[i].get('currentConfirmedCount'),messages_json[i].get('confirmedCount'),messages_json[i].get('suspectedCount'),messages_json[i].get('curedCount'),messages_json[i].get('deadCount'),messages_json[i].get('comment'),messages_json[i].get('locationId'),messages_json[i].get('statisticsData'))
    valuesList.append(value)
    cityValue = messages_json[i].get('cities')
    #print(cityValue)
    for j in range(len(cityValue)):
        cityValueList = (now_time,cityValue[j].get('cityName'),cityValue[j].get('currentConfirmedCount'),cityValue[j].get('confirmedCount'),cityValue[j].get('suspectedCount'),cityValue[j].get('curedCount'),cityValue[j].get('deadCount'),cityValue[j].get('locationId'),messages_json[i].get('provinceShortName'))
        #print(cityValueList)
        cityList.append(cityValueList)
    #cityList.append(cityValue)
db = pymysql.connect("localhost", "root", "123456", "yiqing", charset='utf8')
cursor = db.cursor()
array = np.asarray(valuesList[0])
#sql_clean_world = "TRUNCATE TABLE world_map"
sql_clean_city = "TRUNCATE TABLE city_map"
sql_clean_json = "TRUNCATE TABLE province_data_from_json"
sql_clean_province = "TRUNCATE TABLE province_map"
sql_clean_world = "TRUNCATE TABLE world_map"
sql1 = "INSERT INTO city_map values (%s,%s,%s,%s,%s,%s,%s,%s,%s)"
sql_world = "INSERT INTO world_map values (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
#sql = "INSERT INTO province_map values (0,'%s','%s','%s','%s','%s','%s','%s','%s','%s','%s') "
sql = "INSERT INTO province_map values (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s) "
#sql = "INSERT INTO province_map (provinceName,provinceShortName,correntConfirmedCount,confirmedCount,suspectedCount,curedCount,deadCount,comment,locationId,statisticsData) values (0,'%s','%s','%s','%s','%s','%s','%s','%s','%s','%s') "
#sql = """INSERT INTO province_map (provinceName,provinceShortName,correntConfirmedCount,confirmedCount,suspectedCount,curedCount,deadCount,comment,locationId,statisticsData) values ('湖北省', '湖北', 43334, 64786, 0, 18889, 2563, '', 420000, 'https://file1.dxycdn.com/2020/0223/618/3398299751673487511-135.json')"""
value_tuple = tuple(valuesList)
cityTuple = tuple(cityList)
worldTuple = tuple(worldList)
print(worldTuple)
print(tuple(value_tuple))
try:
    #cursor.execute(sql_clean_city)
    #cursor.execute(sql_clean_province)
    #cursor.executemany(sql, value_tuple)
    #cursor.executemany(sql1,cityTuple)
    db.commit()
except:
    print('执行失败，进入回调1')
    db.rollback()

try:
    #cursor.execute(sql_clean_city)
    #cursor.execute(sql_clean_province)
    #cursor.execute(sql_clean_world)
    #cursor.executemany(sql, value_tuple)
    #cursor.executemany(sql1,cityTuple)
    cursor.executemany(sql_world, worldTuple)
    db.commit()
except:
    print('执行失败，进入回调2')
    db.rollback()
try:
    #cursor.execute(sql_clean_city)
    #cursor.execute(sql_clean_province)
    cursor.executemany(sql, value_tuple)
    #cursor.executemany(sql1,cityTuple)
    db.commit()
except:
    print('执行失败，进入回调3')
    db.rollback()

try:
    #cursor.execute(sql_clean_city)
    #cursor.execute(sql_clean_province)
    #cursor.executemany(sql, value_tuple)
    cursor.executemany(sql1,cityTuple)
    db.commit()
except:
    print('执行失败，进入回调4')
    db.rollback()
#print(messages_json)
#print(account[52:-21])
# soupDiv = BeautifulSoup(listA,'html.parser')
# listB = soupDiv.find_all(name='div',attrs={"class":"c-gap-bottom-zero c-line-clamp2"})
#for i in listA:
    #print(i)
#listA[12]
#print(listA)


db.close()