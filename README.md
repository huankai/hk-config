# hk-config
配置中心

配置说明：

## 1、目录结构说明 ##

- doc
	- docker
		- 使用 `docker-compose` 编排服务，相应目录中有对应的配置文件
	- sql
		- 项目sql 脚本
- platform-config
项目配置文件，请查看 [hk-config-server](https://github.com/huankai/hk-platform/blob/master/hk-config-server/src/main/resources/application.yml) 
## 2、安装Docker 与 Docker compose ##
- 安装Docker
请点击 [这里](https://github.com/huankai/blog-resources/blob/master/blog/Docker/Docker_01_%E7%AE%80%E4%BB%8B%E4%B8%8E%E5%AE%89%E8%A3%85.md) 查看

- 安装Docker compose
使用root 账号执行：
	```
	[root@localhost ~]# curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
	
	[root@localhost ~]# chmod +x /usr/local/bin/docker-compose
	```

## 3、创建目录： ##

```
[huangkai@localhost ~]$ mkdir -p /data/docker/
```

## 4、复制文件： ##
将 `doc/docker` 目录下的文件与文件夹上传到 `/data/docker` 目录下，该目录下有`docker-compose.yml` 文件，可根据需要修改。

想看目录结构如下：
```
[huangkai@localhost ~]$ pwd
/data/docker
[huangkai@localhost ~]$ tree -L 2   # -L 2 表示显示2级目录
.
├── docker-compose.yml
├── gitlab
│   ├── config
│   ├── data
│   └── logs
├── mysql8.0.13
│   ├── conf
│   ├── data
│   └── logs
├── nexus3
├── nginx
│   ├── conf
│   ├── conf.d
│   ├── html
│   ├── logs
│   └── resources
├── postgres
│   └── data
├── redis5.0
│   ├── conf
│   └── data
├── solr
│   └── server
└── springcloud
    ├── config-server
    ├── docker-compose.yml
    ├── Dockerfile
    ├── eureka-server
    ├── oauth2-server
    └── sprintboot-admin
[root@localhost docker]# 
```

### 5、启动服务 #

使用 `docker-compose up -d` 启动服务

```
[huangkai@localhost ~]$ cd /data/docker/
[huangkai@localhost docker]$ docker-compose up -d
``` 