进入`docker`容器

docker exec 后边可以跟多个参数，这里主要说明 -i -t 参数。  
只用 -i 参数时，由于没有分配伪终端，界面没有我们熟悉的 Linux 命令提示符，但命令执行结果仍然可以返回。  
当 -i -t 参数一起使用时，则可以看到我们熟悉的 Linux 命令提示符。  

    $ docker run -dit ubuntu
    69d137adef7a8a689cbcb059e94da5489d3cddd240ff675c640c8d96e84fe1f6
    
    $ docker container ls
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
    69d137adef7a        ubuntu:latest       "/bin/bash"         18 seconds ago      Up 17 seconds                           zealous_swirles
    
    $ docker exec -i 69d1 bash
    ls
    bin
    boot
    dev
    ...
    
    $ docker exec -it 69d1 bash
    root@69d137adef7a:/#
