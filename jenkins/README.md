
1. jenkins 登陆的账号是 admin  密码在 $jenkins_home/secrets/initialAdminPassword

2. 记得创建的时候要创建 Multibranch Pipeline

3. 记得到后台申请一个 API token：
    Manage Jenkins --> Manage Users --> 点击想要选定的用户（默认是 admin) --> Configure --> API Token

    生成后，记得保存下来

4. 将 post-receive 放到指定仓库的 hooks/ 目录中，

4. 提交到仓库后，自动构建, 这个需要用到 git hook：

    在指定仓库的 .git/hooks/post-receive 里面设定

    curl -X POST http://localhost:8080/job/$projectName/job/$branchName/build?delay=0sec --user USER:API_TOKEN

    (上面这个URL， 可以通过观察 Jenkins 里面具体任务的 Build Now 按钮)



下面这些变量是 post-receive 中会用到的，需要手动修改的

    hostUrl=http://censusvm:8080
    projectName=mbx
    USER=admin
    API_TOKEN=119f3847c73e9508d8667dd69ac7f47329


设置过程中遇到的问题：

    1.Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: 。。。
    解决办法：
        这个问题，应该是宿主的 docker.sock 映射到容器里面的时候， 容器无法正常与之通讯
        不考虑安全，直接  chmod a+rwx /var/run/docker.sock

    2."docker-proxy": executable file not found in $PATH.
    解决办法：
        ln -s /usr/libexec/docker/docker-proxy-current /usr/bin/docker-proxy

注意，小心 Jenkinsfile 里面的容器的端口与已经使用的端口的冲突
然后 最好 Jenkins 不要并发进行build， 否则会出现 Jenkinsfile 里面的端口冲突

和 sonarqube 结合：


        stage("analysis") {
            agent {
                docker {
                    image 'emeraldsquad/sonar-scanner:latest'
                }
            }
            steps {
                sonar-scanner \
                        -Dsonar.projectKey=fish \
                        -Dsonar.sources=. \
                        -Dsonar.host.url=http://census:8888 \
                        -Dsonar.login=71e05dcefbdfc0ef7b5b1da69ed89235a0d05978
            }
        }