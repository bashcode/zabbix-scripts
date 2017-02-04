#!/bin/python
from pyzabbix import ZabbixAPI
zapi = ZabbixAPI("http://url")
zapi.login("user", "password")
print("Connected to Zabbix API Version %s" % zapi.api_version())
for h in zapi.host.delete("10112") :
print "successfull"
