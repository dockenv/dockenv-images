#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2023-12-03 18:18:36
 # @LastEditTime: 2023-12-03 20:12:26
 # @LastEditors: Cloudflying
 # @Description: 
### 

apt update -y
apt upgrade -y
apt install -y neovim \
	&& apt install -y python3 python3-pip python3-apt \
	&& apt install -y neovim \
	&& apt install -y lsb-release apt-transport-https apt-utils software-properties-common \
    && apt install -y locales supervisor sudo openssh-server \
    && apt install -y iso-codes openssl gnupg lsof \
        universal-ctags strace psmisc file psutils dnsutils expect \