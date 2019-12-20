#! /bin/bash
nginx=`systemctl status nginx | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1 `
if [ "$nginx" == "running" ]
	then
		echo "10.0.18.160 nginx is running!"
	else
		echo "10.0.18.160 nginx not running!"
fi

keepalived=`systemctl status keepalived | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1 `
if [ "$keepalived" == "running" ]
  then
    echo "10.0.18.160 keepalived is running!"
  else
    echo "10.0.16.160 keepalived not running!"
fi
sleep 1
ssh 10.0.18.161 "./nginx_status.sh"
ssh 10.0.18.184 "./mysql_status.sh"
ssh 10.0.18.185 "./mysql_status.sh"
ssh 10.0.18.186 "./mysql_status.sh"
ssh 10.0.18.187 "./mysql_status.sh"
ssh 10.0.18.188 "./mysql_status.sh"
ssh 10.0.18.189 "./mysql_status.sh"
ssh 10.0.18.191 "./mysql_status.sh"
ssh 10.0.18.192 "./mysql_status.sh"
ssh 10.0.18.193 "./mysql_status.sh"
ssh 10.0.18.194 "./mysql_status.sh"
ssh 10.0.18.195 "./mysql_status.sh"
ssh 10.0.18.227 "./mysql_status.sh"
ssh 10.0.18.228 "./mysql_status.sh"
ssh 10.0.18.229 "./mysql_status.sh"
ssh 10.0.18.230 "./mysql_status.sh"
ssh 10.0.18.231 "./mysql_status.sh"
ssh 10.0.18.232 "./mysql_status.sh"
ssh 10.0.18.233 "./mysql_status.sh"
ssh 10.0.18.234 "./mysql_status.sh"
ssh 10.0.18.235 "./mysql_status.sh"
ssh 10.0.18.236 "./mysql_status.sh"
ssh 10.0.18.237 "./mysql_status.sh"
ssh 10.0.18.238 "./mysql_status.sh"
ssh 10.0.18.239 "./mysql_status.sh"
ssh 10.0.18.240 "./mysql_status.sh"
ssh 10.0.18.241 "./mysql_status.sh"
ssh 10.0.18.242 "./mysql_status.sh"
ssh 10.0.18.246 "./mysql_status.sh"
ssh 10.0.18.247 "./mysql_status.sh"
ssh 10.0.18.212 "./redis_status.sh"
ssh 10.0.18.213 "./redis_status.sh"
ssh 10.0.18.214 "./redis_status.sh"
ssh 10.0.18.215 "./redis_status.sh"
ssh 10.0.18.216 "./mycat_status.sh"
ssh 10.0.18.217 "./mycat_status.sh"
ssh 10.0.18.218 "./mycat_status.sh"
ssh 10.0.18.219 "./mycat_status.sh"
ssh 10.0.18.220 "./restart-activemq.sh status"


