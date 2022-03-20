FROM java:8-alpine

WORKDIR /opt

RUN apk update
RUN apk add tzdata
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN  echo 'Asia/Shanghai' >/etc/timezone