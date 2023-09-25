# Docker PHP Images

## Version Infomation

|版本|数据源|
|-|-|
|5.6.40|3.8|
|7.0.33|3.5|
|7.1.33|3.7|
|7.2.33|3.9|
|7.3.33|3.12|
|7.4.30|3.14|
|8.0.30|3.16|
|8.1.23|3.18|
|8.2.10|3.18|
|8.3.0RC2|offcial image|

## Filter php and components
`apk list | grep '^php7' | sort | grep -Ev 'apache|doc|cgi|litespeed|gmagick' | awk -F '-[0-9]' '{print $1}' | tr '\n' '@' | sed "s#@# \\\ \\n#g"`

## php and extension version

| PHP | php                 | Nginx     | Redis     | Memcached |  Swoole   | ioncube  |
| ------ | ------------------- | --------- | --------- | --------- | --- | --- |
| 5.6.40    | 5.6.38,7.0.33       | 1.10.3-r1 | 3.2.12-r0 | 1.4.33-r2 | todo |√|
| 7.0.33 | 5.6.40,7.1.17       | 1.12.2-r2 | 3.2.12-r0 | 1.4.36-r2 |   todo |√|
| 7.1.33  | 5.6.40,7.1.33       | 1.12.2-r4 | 4.0.14-r0 | 1.5.6-r0  |  todo  |√|
| 7.2.33 | 5.6.40,7.2.26       | 1.14.2-r2 | 4.0.14-r0 | 1.5.8-r0  |   todo  |√|
| 7.3.33 | 7.2.33              | 1.14.2-r5 | 4.0.14-r0 | 1.5.12-r0 |   todo  |√|
| 7.4.30 | 7.3.14              | 1.16.1    | 5.0.11-r0 | 1.5.16-r0 |   4.8.10  |√|
| 8.0.12   | 7.3.2               | 1.16.1    | 5.0.14-r0 | 1.5.20-r0 | 4.8.10 |x|
| 8.1.7 | 7.3.33              | 1.18.0    | 5.0.14-r0 | 1.6.6-r0  | 4.8.10 |x|
| 8.2.0  | 7.4.24，8.0.12       | 1.18.0    | 6.0.16-r0 | 1.6.9-r0  | x |x|

>PS: `x` is  Unsupported

## extensions

|扩展|版本|已安装|
|-|-|-|
|ImageMagick||
|ionCube||
|OPcache||
|Phalcon||
|Source Guardian||
|Xdebug||
|JIT||
|Swoole||
|Memcached||
|Xdebug||
|Redis||
|Mongo||
|||
|||


## Issue
- wddx removed in 7.4.0
- ionCube not avaiable in php 8.0
