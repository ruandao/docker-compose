用来放置自己的一些便利服务

在部署时， 通常将 docker-compose.yml 文件放到一个目录， 表示一个应用， docker 会为这个应用创建一个独立的网络， 便于和其它应用进行隔离。

进入对应的目录进行以下对应的操作


运行服务

    docker-compose up -d
    
停止服务

    docker-compose down



// docker-machine init

    docker-machine create --driver generic --generic-ip-address=xxxx --generic-ssh-key ~/.ssh/id_rsa $(vmname)


使用方法

进入到对应的目录，然后运行

    docker stack deploy -c docker-compose.yml serviceName


grafana 的repeat pannel 的方法是，在图表的编辑页面下方有个

https://www.evernote.com/l/AEduO140j9RJT4lBzfOV6wvXR0KRKKuxy4s