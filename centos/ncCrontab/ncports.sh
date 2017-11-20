#!/bin/bash
#执行方法：*/3 * * * *  /data/timer/ncports.sh

#脚本执行路径
TIMERHOME=/data/timer/
#软件目录
SOFTWARE=/data/soft/

#成功日志
PORTSSUCCESS=${TIMERHOME}logs/ports-success.log
#重启记录日志
PORTSRELOAD=${TIMERHOME}logs/ports-reload.log

#检测服务器端口是否开放，成功会返回0值显示ok，失败会返回1值显示fail
cat ${TIMERHOME}/ip-ports.txt | while read line
do
  nc -w 10 -z $line > /dev/null 2>&1
  if [ $? -eq 0 ]
  then
      echo "date:"`date "+%G-%m-%d %H:%M:%S"`, "server:"$line:ok >> $PORTSSUCCESS
  else
      echo "nczookeeper:"`bash ${TIMERHOME}zookeeper-3.3.6/bin/zkServer.sh start` >> $PORTSRELOAD
      echo "date:"`date "+%G-%m-%d %H:%M:%S"`, "server:"$line:fail >> $PORTSRELOAD
  fi
done
exit 0
