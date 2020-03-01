
使用 `apt-get install xxx` 时尽可能的锁定版本，并且将 `apt-get update` 放在同一行，如下例子
    
    FROM golang:latest
    RUN apt-get update && apt-get install -y bzr=2.7.0+bzr6622-15
    # Copy the local package files to the container’s workspace.
    ADD . /go/src/github.com/EwanValentine/project/api
    
上面的例子中， `RUN apt-get update && apt-get install -y bzr=2.7.0+bzr6622-15` 会锁定要安装的软件版本，下次要装的时候，会复用上次的缓存    

另外一个，尽可能将会变化的地方往后移动，
譬如需要从外界拷贝文件到 镜像里面，由于外界拷贝什么是不确定的，每次碰到这里的时候，docker 镜像都会重新编译，那么我们可以尽量往后移动这个阶段