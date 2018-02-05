#!/bin/bash
echo "Enter server's ip"
read $serverip
echo "Enter path of file with name"
read $path
echo "Enter hotname"
read $hostname
echo "Enter dns"
read $dns
echo "ip"
read $ip
echo "groupid"
read $groupid
echo "template"
read $templateid
#yum list installed | grep zabbix &>/dev/null && echo "zabbix agent Installed" || echo "zabbix agent Not installed.. Attempting to install zabbix agent 3-2.0-1"
#if [ $? -eq 1 ]; then

#rpm -Uvh http://repo.zabbix.com/zabbix/3.2/rhel/6/x86_64/zabbix-agent-3.2.0-1.el6.x86_64.rpm
#yum install zabbix-agent
#fi


RESULT=$?
if [ $RESULT -eq 0 ]; then
  cp /etc/zabbix/zabbix_agentd.conf /etc/zabbix/zabbix_agentd.conf.bak
  echo backup made
    if [ -s /etc/zabbix/zabbix_agentd.conf ]; then
        serverip=43.252.91.194
        sed -i "s/Hostname=Zabbix/Hostname=$(hostname -i)/g" /etc/zabbix/zabbix_agentd.conf
        sed -i "s/127.0.0.1/$serverip/g" /etc/zabbix/zabbix_agentd.conf
                echo  $(service zabbix-agent start); echo "editing configuration done"
                 #replacehostname 
sed 's/hostname/$hostname/g' $path

#replacedns   
sed 's/dns/$dns/g' $path
#replaceip
sed 's/ip/$ip/g' $path
#replacegroupid
sed 's/groupid/$groupid/g' $path
#replace templateid 
sed 's/templateid/$templateid/g' $path


chmod u+x $path
python $path

    else
        echo $(tail -n10 /var/log/zabbix/zabbix_agentd.log).ERROR
    fi
else
  echo failed installing zabbix agent
fi

echo Script ran properly 
