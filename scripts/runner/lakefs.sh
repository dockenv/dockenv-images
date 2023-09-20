#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2023-05-06 21:54:35
 # @LastEditTime: 2023-05-06 22:07:52
 # @LastEditors: Cloudflying
 # @Description:LakeFS
###

docker run -it --rm \
    --name=lakefs \
    --hostname=lakefs \
    -p 8000:8000 \
    -e LAKECTL_CREDENTIALS_ACCESS_KEY_ID=AKIA-EXAMPLE-KEY \
    -e LAKECTL_CREDENTIALS_SECRET_ACCESS_KEY=EXAMPLE-SECRET \
    -e LAKECTL_SERVER_ENDPOINT_URL=http://localhost:8000 \
    treeverse/lakefs:latest
