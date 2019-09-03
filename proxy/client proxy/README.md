
[如果有openwrt 路由器的化](https://www.evernote.com/l/AEdmy9YZQ0hMjpFuNB7ablQjavg82MqwVyE)



## 1 开启代理通道
安装 autossh 

    brew install autossh
将 `google` 和 `kgoogle` 放到 bin 目录,(记得，将 bin 目录加入PATH： `export PATH=$PATH:~/bin`)， 然后 运行 `google`  

## 2 配置自动代理

[下载 并运行 docker](https://www.docker.com/products/docker-desktop)
然后运行 本目录里面的 `run.sh` 脚本

在 /Users/ljy/www 里面放置 proxy.pac

然后 在 mac 的网络上配置 自动代理（就是前两个选项）  
然后 把 http://127.0.0.1:8888/proxy.pac 输入进去

ok 然后 浏览器会自动走 代理


## 3 配置 git 的代理
    
设置 git 走代理

    git config --global http.proxy "socks5://127.0.0.1:1080"
    git config --global https.proxy "socks5://127.0.0.1:1080"
    
编辑 `.ssh/config`

    # 必须是 github.com
    Host github.com
    HostName github.com
    User git
    # 走 HTTP 代理
    # ProxyCommand socat - PROXY:127.0.0.1:%h:%p,proxyport=1235
    # 走 socks5 代理（如 Shadowsocks）
    # ProxyCommand nc -v -x 127.0.0.1:1235 %h %p
    # ssh跳板的方式
    #ProxyCommand ssh -q somanyad nc %h %p
    



## 4 处理命令行代理

命令行需要
    
    proxychains4 command xxx
    
接着安装 proxychains4
然后 

    ln -s /usr/local/etc/proxychains.conf  proxychains.conf

在 proxychains.conf 文件的最下放增加：

    # somanyad
    socks5  127.0.0.1 1235



           
