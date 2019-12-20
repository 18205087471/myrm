#!/bin/bash
echo '#######start task-center########'

ansible task -m shell -a 'killall java'
ansible task -m shell -a 'nohup java -jar /usr/task-center.jar >/dev/null 2>&1 &'
ansible task -m shell -a 'ps -ef|grep java'

echo '--------over--------'
