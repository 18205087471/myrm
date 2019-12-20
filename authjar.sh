#!/bin/bash
time=`date`
clear
echo -e '\033[36m####################################\033[0m'
echo -e '\e[1;34m|//////|__ 发布微服务程序 __|\\\\\\|\e[0m'
echo -e '\033[36m####################################\033[0m'

ansible auth1 -m shell -a 'killall java'
echo -e '\033[31m1.177-179微服务程序已杀死!\033[0m'
echo
sleep 3

#ansible 10.0.18.177 -m shell -a 'for i in {178..179};do scp -r /usr/java-jar 10.0.18.$i:/usr/;done'
ansible 10.0.18.177 -m shell -a 'for i in {178..179};do rsync -aSH /usr/java-jar/ 10.0.18.$i:/usr/java-jar/;done'
ansible auth1 -m shell -a 'for i in {auth-server,file-center,log-center,statistics-center,supervise-center,system-center,user-center,work-center,queue-center};do `nohup java -jar /usr/java-jar/$i.jar >/dev/null 2>&1 &` sleep 0.5;done'
echo -e '\033[32m1.----------|微服务启动完成|----------\033[0m'
echo
ansible auth1 -m shell -a 'ps -ef|grep -v grep|grep java'
sleep 1

ansible auth2 -m shell -a 'killall java'
echo -e '\033[31m2.180-182微服务程序已杀死!\033[0m'
echo
sleep 3

#ansible 10.0.18.177 -m shell -a 'for i in {180..182};do scp -r /usr/java-jar 10.0.18.$i:/usr/;done'
ansible 10.0.18.177 -m shell -a 'for i in {180..182};do rsync -aSH /usr/java-jar/ 10.0.18.$i:/usr/java-jar/;done'
ansible auth2 -m shell -a 'for i in {auth-server,file-center,log-center,statistics-center,supervise-center,system-center,user-center,work-center,queue-center};do `nohup java -jar /usr/java-jar/$i.jar >/dev/null 2>&1 &` sleep 0.5;done'
echo -e '\033[32m2.-----------|微服务启动完成|----------\033[0m'
echo
ansible auth2 -m shell -a 'ps -ef|grep -v grep|grep java'
sleep 1

clear
ansible auth3 -m shell -a 'killall java'
echo -e '\033[31m3.243,244微服务程序已杀死!\033[0m'
echo
sleep 3

#ansible 10.0.18.177 -m shell -a 'for i in {243..244};do scp -r /usr/java-jar 10.0.18.$i:/usr/;done'
ansible 10.0.18.177 -m shell -a 'for i in {243..244};do rsync -aSH /usr/java-jar/ 10.0.18.$i:/usr/java-jar/;done'
ansible auth3 -m shell -a 'for i in {auth-server,file-center,log-center,statistics-center,supervise-center,system-center,user-center,work-center,queue-center};do `nohup java -jar /usr/java-jar/$i.jar >/dev/null 2>&1 &` sleep 0.5;done'
ansible auth3 -m shell -a 'ps -ef|grep -v grep|grep java'
echo -e '\033[32m3.-----------|微服务启动完成|----------\033[0m'
echo

echo '${time} 微服务发布成功!'>> /var/log/jar.log

printf "\e[42m%s\n\e[0m" '##################################'
printf "\e[42m%s\e[0m\n" '|//////|__ 程序发布完成 __|\\\\\\|'
printf "\e[42m%s\n\e[0m" '##################################'
