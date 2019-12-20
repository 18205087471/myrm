#!/bin/bash
time=`date`
clear
echo -e "\033[1;32m###############################\033[0m"
echo -e "\033[1;32m#_______| 开始更换前端 |______#\033[0m"
echo -e "\033[1;32m###############################\033[0m"
echo

ansible back1 -m shell -a 'killall java'
sleep 3
echo -e "\033[9;31m1.___________|前端进程已杀死!|__________\033[0m"
echo

ansible 10.0.18.162 -m shell -a 'for i in {163..164};do rsync -aSH /usr/back-center.jar 10.0.18.$i:/usr/back-center.jar;done'
echo -e "\033[1;36m1.____________|前端同步完成|____________\033[0m"
echo

ansible back1 -m shell -a 'for i in {back-center,auth-server};do `nohup java -jar /usr/$i.jar >/dev/null 2>&1 &` sleep 1;done'
ansible back1 -m shell -a 'ps -ef|grep -v grep|grep java'
sleep 3

ansible back2 -m shell -a 'killall java'
sleep 3
echo -e "\033[9;31m2.___________|前端进程已杀死!|__________\033[0m"
echo

ansible 10.0.18.162 -m shell -a 'for i in {196..197};do rsync -aSH /usr/back-center.jar 10.0.18.$i:/usr/back-center.jar;done'
echo -e "\033[1;36m2.____________|前端同步完成|____________\033[0m"
echo

ansible back2 -m shell -a 'for i in {back-center,auth-server};do `nohup java -jar /usr/$i.jar >/dev/null 2>&1 &` sleep 1;done'
ansible back2 -m shell -a 'ps -ef|grep -v grep|grep java'

echo '${time} 前端页面发布成功!'>> /var/log/jar.log
echo
echo -e "\033[1;32m###############################\033[0m"
echo -e "\033[1;32m#________| 任务完成! |________#\033[0m"
echo -e "\033[1;32m###############################\033[0m"
echo
