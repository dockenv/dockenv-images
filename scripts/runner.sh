#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2022-06-27 16:54:27
 # @LastEditTime: 2022-06-30 00:47:27
 # @LastEditors: Cloudflying
 # @Description:
 # @FilePath: /dockenv/scripts/runner.sh
###

run_boxs()
{
    docker run -d \
		--name cmdide \
		--hostname cmdide \
		-p 30022:22 \
		-p 30080:80 \
		-e RUN_MODE="remote" \
		-v /Volumes/MacData/Code:/data:rw \
		-v /Volumes/MacData/Code/Devenv/Volumes/nginx:/etc/nginx/conf:rw \
		imxieke/cmdide:latest
}

run_boxs_archlinux()
{
    docker run -d \
		--name archboxs \
		--hostname archboxs \
        --privileged \
        --tty \
        --interactive \
		-p 10022:22 \
		-p 10080:80 \
		-p 10443:443 \
		-p 15901:5901 \
		-p 16080:6080 \
		-p 16901:6901 \
		registry.cn-hongkong.aliyuncs.com/boxs/boxs:xfce-arch
}

run_xfce4()
{
    docker run -d \
		--name xfce4 \
		--hostname xfce4 \
        --privileged \
        --tty \
        --interactive \
		-p 20022:22 \
		-p 20080:80 \
		-p 20443:443 \
		-p 25901:5901 \
		-p 26080:6080 \
		-p 26901:6901 \
		registry.cn-hongkong.aliyuncs.com/boxs/boxs:xfce
}

run_cmdide()
{
    docker run -d \
		--name cmdide \
		--hostname cmdide \
		-p 30022:22 \
		-p 30080:80 \
		-e RUN_MODE="remote" \
		-v /Volumes/MacData/Code:/data:rw \
		-v /Volumes/MacData/Code/Devenv/Volumes/nginx:/etc/nginx/conf:rw \
		imxieke/cmdide:latest
}

run_gogs()
{
    docker run \
        --rm \
        --name gogs \
        --hostname gogs \
        -p 10022:22 \
        -p 13000:3000 \
        -v $(pwd)/runtime/data/gogs:/data \
        gogs/gogs:latest
}

run_homestead()
{
    docker run -d \
          -p 30022:22 \
          -p 30080:80 \
          -e RUN_MODE="remote" \
          imxieke/cmdide:homestead
}

run_mariadb()
{
    docker run -d \
		  --name mariadb \
		  -v /Volumes/Data/Volumes/mariadb:/var/lib/mysql \
          -p 3306:3306 \
          -e MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} \
          mariadb:10.3.8 \
          --character-set-server=utf8mb4 \
          --collation-server=utf8mb4_unicode_ci
}

run_mysql()
{
    MYSQL_PASSWORD=$(grep MYSQL_PASSWORD conf.ini | awk -F '=' '{print $2}')
    docker run -d \
        -p 3306:3306 \
        -p 33060:33060 \
        --hostname=mysql \
        --name=mysql \
        -e MYSQL_ROOT_PASSWORD=${MYSQL_PASSWORD} \
        -v /Volumes/Data/Dev/mysql/docker:/var/lib/mysql \
        registry.cn-hongkong.aliyuncs.com/imxieke/mysql:latest \
        --character-set-server=utf8mb4 \
        --collation-server=utf8mb4_unicode_ci
}
