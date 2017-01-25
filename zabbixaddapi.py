#!/bin/python
from pyzabbix import ZabbixAPI

zapi = ZabbixAPI("http://zabbix.theserverguy.com/zabbix")
zapi.login("admin", "divyanshu@theserverguy.com")
print("Connected to Zabbix API Version %s" % zapi.api_version())
for hostids in zapi.host.create({ 
'host': "testpythonapi", 
'interfaces':[{
'type': "1", 
'main': "1", 
'useip': "1", 
'dns' : "2.2.2.2",
'ip' : "1.1.1.1",
'port' : "10050",}],
'groups': [{"groupid":"2"}], 
'templates' : [{ "templateid":"10094"}]}):
    print "succesfull"
