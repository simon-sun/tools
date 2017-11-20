1，nc为centos的软件：通过使用TCP或UDP协议的网络连接读写数据，同时还是功能强大的网络调试和探测工具<br/>
2，netcat参考网址：<br/>
   http://blog.csdn.net/yjh314/article/details/52209438<br/>
   http://blog.csdn.net/fym0121/article/details/8190078<br/>
   http://blog.csdn.net/juexin840/article/details/67635080<br/>
3，目前使用nc监控数据，完成软件挂了，重新启动功能，使用到nc和crontab服务<br/>
4，crontab -e 编辑，crontab -l 查看列表<br/>
  /sbin/service crond start //启动服务<br/>
  /sbin/service crond stop //关闭服务<br/>
  /sbin/service crond restart //重启服务<br/>
  /sbin/service crond reload //重新载入配置<br/>
5，crontab参考网址：http://www.linuxidc.com/Linux/2015-01/112054.htm和https://www.cnblogs.com/Gbeniot/p/5421371.html<br/>
