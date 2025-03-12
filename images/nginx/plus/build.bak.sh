#!/usr/bin/env sh
###
 # @Author: Cloudflying
 # @Date: 2021-11-19 13:20:23
 # @LastEditTime: 2025-03-12 22:58:53
 # @LastEditors: Cloudflying
 # @Description:
 # @FilePath: /dockenv/images/nginx/1.20.2/build.sh
###

mkdir -p /tmp/build/ngx_mod
cd /tmp/build
if [[ ! -f "/tmp/build/nginx-${NGINX_VERSION}" ]]; then
    if [[ ! -f "/tmp/build/nginx-${NGINX_VERSION}.tar.gz" ]]; then
        URL="https://hk.mirrors.xieke.org/Src/nginx/nginx-${NGINX_VERSION}.tar.gz"
        wget -c ${URL}
    fi
    tar -xvf nginx-${NGINX_VERSION}.tar.gz > /dev/null 2>&1
    cd nginx-${NGINX_VERSION} && fix_conf
fi

if [[ -d '/tmp/build/ngx_mod/ngx_waf' ]]; then
    cd /tmp/build/ngx_mod/ngx_waf && make
    git clone --depth 1 https://github.com/libinjection/libinjection.git inc/libinjection
fi

cd /tmp/build/nginx-${NGINX_VERSION}
# fast to get module
# 不想编译的扩展删除扩展目录并注释 git 命令即可
# mod_ops=$(ls ../ngx_mod/ | tr ' ' '\n' | awk  '{print "--add-dynamic-module=../"$1" \\"}' | sed 's#njs#njs\/nginx#g' | sed 's#naxsi#naxsi/naxsi_src#g')
# mod_ops=$(ls ../ngx_mod/ | tr ' ' '\n' | grep -v 'ngx_devel_kit' | grep -v 'ngx_healthcheck_module' | awk  '{print "--add-dynamic-module=../ngx_mod/"$1}' | sed 's#njs#njs\/nginx#g' | sed 's#naxsi#naxsi/naxsi_src#g')
mod_ops=$(ls ../ngx_mod/ | tr ' ' '\n' | grep -v 'ngx_devel_kit' | grep -v 'ngx_healthcheck_module' | awk  '{print "--add-dynamic-module=../ngx_mod/"$1}' | sed 's#naxsi#naxsi/naxsi_src#g')
# LUAJIT_INC=$(find /usr/include/ -maxdepth 1 -name 'luajit*')
# echo $mod_ops;exit
# echo $LUAJIT_INC;exit
# LUAJIT_INC=${LUAJIT_INC}
    # --with-perl_modules_path=/usr/lib/perl5/vendor_perl \
    # --with-http_perl_module=dynamic \
    # --with-zlib=/usr
    # ${mod_ops}
    # --add-dynamic-module=../ngx_mod/ngx_devel_kit \
    # --add-module=../ngx_mod/ngx_healthcheck_module \
    # ${mod_ops%?}