---
# 1.使用多阶段容器
采用类似如下的方案

    FROM golang:alpine as builder
    
    RUN apk update && apk upgrade && \
        apk add --no-cache git
    
    RUN mkdir /app
    WORKDIR /app
    
    ENV GO111MODULE=on
    
    COPY . .
    
    RUN go mod download
    RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o shippy-service-consignment
    
    # Run container
    FROM alpine:latest
    
    RUN apk --no-cache add ca-certificates
    
    RUN mkdir /app
    WORKDIR /app
    COPY --from=builder /app/shippy-service-consignment .
    
    CMD ["./shippy-service-consignment"]
    
前面的 `FROM xxx` 用来创建一个编译二进制文件的环境 
后面 `FROM alpine:latest` 目的是让镜像尽可能小   
然后把编译的二进制文件放到轻量镜像中， 这样上传之类的都可以使用轻量镜像


--- 
# 2.尽可能让每个阶段可以缓存


使用 `apt-get install xxx` 时尽可能的锁定版本，并且将 `apt-get update` 放在同一行，如下例子
    
    FROM golang:latest
    RUN apt-get update && apt-get install -y bzr=2.7.0+bzr6622-15
    # Copy the local package files to the container’s workspace.
    ADD . /go/src/github.com/EwanValentine/project/api
    
上面的例子中， `RUN apt-get update && apt-get install -y bzr=2.7.0+bzr6622-15` 会锁定要安装的软件版本，下次要装的时候，会复用上次的缓存    

另外一个，尽可能将会变化的地方往后移动，
譬如需要从外界拷贝文件到 镜像里面，由于外界拷贝什么是不确定的，每次碰到这里的时候，docker 镜像都会重新编译，那么我们可以尽量往后移动这个阶段