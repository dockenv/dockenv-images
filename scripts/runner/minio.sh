#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2023-05-06 21:54:24
 # @LastEditTime: 2023-05-06 22:38:59
 # @LastEditors: Cloudflying
 # @Description:minio
###

docker run -it --rm \
    -p 9000:9000 \
    -p 9001:9001 \
    quay.io/minio/minio server /data --console-address ":9001"
