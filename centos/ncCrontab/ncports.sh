#!/bin/bash

#SHELL=/bin/bash
#执行方法: */10 * * * * /bin/bash  /data/timer/ncports.sh

#脚本执行路径
TIMERHOME=/data/timer/;
#软件目录
SOFTWARE=/data/soft/;

#成功日志
PORTSSUCCESS=${TIMERHOME}logs/ports-success.log;
#重启记录日志
PORTSRELOAD=${TIMERHOME}logs/ports-reload.log;


#检测服务器端口是否开放，成功会返回0值显示ok，失败会返回1值显示fail
cat ${TIMERHOME}/ip-ports.txt | while read line;
do
#  echo $line
#  echo $line >> $PORTSSUCCESS
#  echo $line >> $PORTSRELOAD
#
#  echo `/usr/local/bin/netcat -v -w 50 -z $line` >> $PORTSSUCCESS
#  echo `/usr/local/bin/netcat -v -w 50 -z $line` >> $PORTSRELOAD
  /usr/local/bin/nc -v -w 50 -z $line;
  if [ $? -eq 0 ];
  then
        echo "date:"`date "+%G-%m-%d %H:%M:%S"`" server:"$line":ok";
        echo "date:"`date "+%G-%m-%d %H:%M:%S"`" server:"$line":ok" >> $PORTSSUCCESS;
  else
      echo "nczookeeper:"`bash ${SOFTWARE}zookeeper-3.3.6/bin/zkServer.sh start` >> $PORTSRELOAD;
      echo "date:"`date "+%G-%m-%d %H:%M:%S"`" server:"$line":fail";
      echo "date:"`date "+%G-%m-%d %H:%M:%S"`" server:"$line":fail" >> $PORTSRELOAD;
  fi
done
exit 0;

