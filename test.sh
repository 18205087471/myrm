#! /bin/bash
pid=`ps -ef|grep nginx |awk '{print $2}'|sed -n '2p'`
if [ -z "${pid}" ]
	then
                echo "nginx is running!"
        else
                echo "nginx not running!"
fi

