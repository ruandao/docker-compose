
注意，有可能出现的问题是： 再运行 `docker stack deploy -c docker-compose.yml xxx` 的时候， 镜像还没拉下来导致 `REPLICAS` 一直显示 `0/1` 

然后还有个可能的问题是 docker-compose.yml 的挂载路径不存在、没有写入权限

mkdir -p xxx/xxx/xxx
chmod a+w xxx/xxx/xxx