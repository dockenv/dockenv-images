#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2023-04-15 12:59:31
 # @LastEditTime: 2023-04-15 13:02:01
 # @LastEditors: Cloudflying
 # @Description:
###

TOKEN=$(curl -sL "https://auth.docker.io/token?service=registry.docker.io&scope=repository:ratelimitpreview/test:pull" | jq -r .token)
# curl --head -H "Authorization: Bearer $TOKEN" https://registry-1.docker.io/v2/ratelimitpreview/test/manifests/latest 2>&1 | grep RateLimit
# curl -sL --head -H "Authorization: Bearer ${TOKEN}" https://registry-1.docker.io/v2/ratelimitpreview/test/manifests/latest
jwt decode $TOKEN
