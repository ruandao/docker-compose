
1. jenkins 登陆的账号是 admin  密码在 $jenkins_home/secrets/initialAdminPassword

2. 记得创建的时候要创建 Multibranch Pipeline

3. 记得到后台申请一个 API token：
    Manage Jenkins --> Manage Users --> 点击想要选定的用户（默认是 admin) --> Configure --> API Token

    生成后，记得保存下来


4. 提交到仓库后，自动构建, 这个需要用到 git hook：

    在指定仓库的 .git/hooks/post-receive 里面设定

    curl -X POST http://localhost:8080/job/$projectName/job/$branchName/build?delay=0sec --user USER:API_TOKEN

    (上面这个URL， 可以通过观察 Jenkins 里面具体任务的 Build Now 按钮)
