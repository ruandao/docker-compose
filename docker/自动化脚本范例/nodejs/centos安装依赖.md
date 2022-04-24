在 CentOS 企业版使用 n 安装 Node.js

    yum install epel-release
    yum install nodejs
    node -v
    # 显示的是旧版本
    npm cache clean -f
    # 清理缓存
    npm install -g n
    # 安装 n
    n stable
    # 安装稳定版 node
    node -v
    # 显示的是最新稳定版
    n ls
    # 查看安装的版本列表