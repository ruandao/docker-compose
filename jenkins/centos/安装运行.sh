
安装:

  ./install.sh

配置jenkis的端口

vi /etc/sysconfig/jenkins

找到修改端口号：
  JENKINS_PORT="8080"  此端口不冲突可以不修改 

如果修改目录时，发现修改的目录报权限问题，请查阅 [/linux/权限问题.md](../../../linux/权限问题.md)

启动：

  service jenkins start/stop/restart
