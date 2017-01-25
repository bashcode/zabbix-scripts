#!/bin/python
from pyzabbix import ZabbixAPI
zapi = ZabbixAPI("http://zabbix.theserverguy.com/zabbix")
zapi.login("admin", "divyanshu@theserverguy.com")
print("Connected to Zabbix API Version %s" % zapi.api_version())
for h in zapi.host.delete("10112") :
    print "successfull"
