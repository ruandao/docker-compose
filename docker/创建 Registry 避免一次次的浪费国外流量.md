https://dev.to/mayeu/saving-time-and-bandwidth-by-caching-docker-images-with-a-local-registry-98b

### 创建对应存放目录
    mkdir docker-registry
### 拷贝配置文件
    docker run -it --rm registry:2 cat /etc/docker/registry/config.yml > docker-registry/config.yml
    
### 追加 拉取源头到配置文件中
#### docker-registry/config.yml
    
    proxy:
        remoteurl: https://registry-1.docker.io
        
### 运行 registry 映象
    docker run --restart=always -p 5000:5000 \
    --name v2-mirror \
    -v /path/to/your/docker-registry:/var/lib/registry \
    --detach registry:2 serve /var/lib/registry/config.yml
    
### 修改宿主的配置，让宿主从容器中拉取
#### 配置文件为 `/etc/docker/daemon.json` (`root`身份), 如果文件不存在，则自行创建
    {
        "registry-mirrors": ["http://localhost:5000"]
    }

### 重启宿主的docker
    sudo systemctl restart docker
 
### 验证镜像是否正确设置    
#### 1.尝试拉取镜像，然后再删除，再次拉取，看是否依旧使用外部流量(或者直接看再次拉取的速度是否很快)
    docker pull redis
    docker rmi redis
    docker pull redis
#### 2.也可以直接看registry 里面的内容
    curl http://localhost:5000/v2/_catalog
    
         