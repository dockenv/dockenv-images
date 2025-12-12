#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2023-12-01 17:41:39
 # @LastEditTime: 2025-12-12 14:36:08
 # @LastEditors: Cloudflying
# @Description: Update Elastic Kibana Logstash Version
###

ROOT_PATH=$(dirname $(dirname $(dirname $(realpath $0))))

# logstash elestic kibana
_logstash()
{
    api="https://hub.docker.com/v2/repositories/library/logstash/tags/?page_size=25&page=1"
    info=$(curl -sL ${api})
    ver_latest=$(echo ${info} | jq | grep "\"name" | tr '"' ' '| awk -F ' ' '{print $3}' | sort -rh | head -n 1)
    ver_8=$(echo ${info} | jq | grep "\"name" | tr '"' ' '| awk -F ' ' '{print $3}' | sort -rh | grep '^8' | head -n 1)
    ver_7=$(echo ${info} | jq | grep "\"name" | tr '"' ' '| awk -F ' ' '{print $3}' | sort -rh | grep '^7' | head -n 1)
    ver_6=$(echo ${info} | jq | grep "\"name" | tr '"' ' '| awk -F ' ' '{print $3}' | sort -rh | grep '^6' | head -n 1)
}

VER_LATEST="8.16.0"
VER_7="7.17.25"

sed -i "s@FROM elasticsearch:.*@FROM elasticsearch:${VER_LATEST}@g" ${ROOT_PATH}/images/elastic/latest/Dockerfile
sed -i "s@FROM elasticsearch:.*@FROM elasticsearch:${VER_LATEST}@g" ${ROOT_PATH}/images/elastic/8/Dockerfile
sed -i "s@FROM elasticsearch:.*@FROM elasticsearch:${VER_7}@g" ${ROOT_PATH}/images/elastic/7/Dockerfile

sed -i "s@FROM logstash:.*@FROM logstash:${VER_LATEST}@g" ${ROOT_PATH}/images/logstash/latest/Dockerfile
sed -i "s@FROM logstash:.*@FROM logstash:${VER_LATEST}@g" ${ROOT_PATH}/images/logstash/8/Dockerfile
sed -i "s@FROM logstash:.*@FROM logstash:${VER_7}@g" ${ROOT_PATH}/images/logstash/7/Dockerfile

sed -i "s@FROM kibana:.*@FROM kibana:${VER_LATEST}@g" ${ROOT_PATH}/images/kibana/latest/Dockerfile
sed -i "s@FROM kibana:.*@FROM kibana:${VER_LATEST}@g" ${ROOT_PATH}/images/kibana/8/Dockerfile
sed -i "s@FROM kibana:.*@FROM kibana:${VER_7}@g" ${ROOT_PATH}/images/kibana/7/Dockerfile
