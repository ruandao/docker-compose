sonarqube 的默认用户名密码
    
    admin:admin
    
[安装go语言插件--sonar-golang](https://www.jianshu.com/p/aa44d4a822d0)

    1、cd ~/sonarqube/extensions
    2、wget https://github.com/uartois/sonar-golang/releases/download/v1.2.11/sonar-golang-plugin-1.2.11.jar
    3、cd ~/sonarqube/bin/linux-x86-64&sonar.sh restart
    以admin用户登入编辑GO规则（目前版本只支持58条规则）
    4、点击Quality Profiles 页面---点击"Create" 按钮---点击Restore Built-In Profiles选择language (Go)点击保存
    
    作者：老余2017
    链接：https://www.jianshu.com/p/aa44d4a822d0
    來源：简书
    简书著作权归作者所有，任何形式的转载都请联系作者获得授权并注明出处。


这个 docker-compose.yml 依赖于一些目录配置, 你先要创建一下这些目录

    - /root/ljy/sonarqube/conf:/opt/sonarqube/conf
    - /root/ljy/sonarqube/data:/opt/sonarqube/data
    - /root/ljy/sonarqube/extensions:/opt/sonarqube/extensions
    - /root/ljy/sonarqube/plugins:/opt/sonarqube/lib/bundled-plugins

    - /root/ljy/postgresql/db:/var/lib/postgresql
    # This needs explicit mapping due to https://github.com/docker-library/postgres/blob/4e48e3228a30763913ece952c611e5e9b95c8759/Dockerfile.template#L52
    - /root/ljy/postgresql/data:/var/lib/postgresql/data


插件的正确安装方法:

    在管理界面上点击install,
    然后失败后,去看容器里面的日志链接,
    手动下载链接的jar包, 放置到 extensions/plugins/ 里面

