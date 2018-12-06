# hk-config
配置中心

配置说明：


## 1、安装Docker 与 Docker compose： ##

```
[root@localhost ~]# yum -y install docker

[root@localhost ~]# curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

[root@localhost ~]# chmod +x /usr/local/bin/docker-compose
```

## 2、创建目录： ##

```
[huangkai@localhost ~]$ mkdir -p /data/docker/
```

## 3、复制文件： ##
将 docker 目录下的所有文件与文件夹上传到 `/data/docker` 目录下

### 4、启动服务 #

使用 `docker-compose up -d` 启动服务

```
[huangkai@localhost ~]$ cd /data/docker/
[huangkai@localhost docker]$ docker-compose up -d
``` 