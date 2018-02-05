from pyzabbix import ZabbixAPI

zapi = ZabbixAPI(" #http://URL")
zapi.login(" #username", " #password")
print("Connected to Zabbix API Version %s" % zapi.api_version())
for hostids in zapi.graph.get({
"output": "extend",
"hostids": " #ID",
"sortfield": "name"}):
    print "successfull"
text_file = open('output.txt', 'w')
text_file.write(str(hostids))
text_file.close()
