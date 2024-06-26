# Docker PHP Images

## Version Infomation

| 版本     | 数据源        |
| -------- | ------------- |
| 5.6.40   | 3.8           |
| 7.0.33   | 3.5           |
| 7.1.33   | 3.7           |
| 7.2.33   | 3.9           |
| 7.3.33   | 3.12          |
| 7.4.30   | 3.14          |
| 8.0.30   | 3.16          |
| 8.1.23   | 3.18          |
| 8.2.10   | 3.18          |
| 8.3.0RC2 | offcial image |

## Filter php and components

`apk list | grep '^php83' | sort | grep -Ev 'apache|doc|cgi|litespeed|gmagick' | awk -F '-[0-9]' '{print $1}' | tr '\n' '@' | sed "s#@# \\\ \\n#g"`

## php and extension version (outdated, never update)

| Version | Stability | Release Support       |
| ----------- | --------- | --------------------- |
| 5.3         | `Stable`  | `End of life`         |
| 5.4         | `Stable`  | `End of life`         |
| 5.5         | `Stable`  | `End of life`         |
| 5.6         | `Stable`  | `End of life`         |
| 7.0         | `Stable`  | `End of life`         |
| 7.1         | `Stable`  | `End of life`         |
| 7.2         | `Stable`  | `End of life`         |
| 7.3         | `Stable`  | `End of life`         |
| 7.4         | `Stable`  | `End of life`         |
| 8.0         | `Stable`  | `End of life`         |
| 8.1         | `Stable`  | `Security fixes only` |
| 8.2         | `Stable`  | `Active`              |
| 8.3         | `Stable`  | `Active`              |
| 8.4         | `Nightly` | `In development`      |

## 对应 PHP 版本支持的扩展
|扩展|5.6|7.0|7.1|7.2|7.3|7.4|8.0|8.1|8.2|8.3|备注|
|-|-|-|-|-|-|-|-|-|-|-|-|
|amqp|√|√|√|√|√|√|√|√|√|√||
|apc|√|√|√|√|√|√|√|√|√|√||
|apcu|√|√|√|√|√|√|√|√|√|√||
|ast|√|√|√|√|√|√|√|√|√|√||
|bcmath|√|√|√|√|√|√|√|√|√|√||
|bz2|√|√|√|√|√|√|√|√|√|√||
|calendar|√|√|√|√|√|√|√|√|√|√||
|event|√|√|√|√|√|√|√|√|√|√||
|exif|√|√|√|√|√|√|√|√|√|√||
|gd|√|√|√|√|√|√|√|√|√|√||
|gettext|√|√|√|√|√|√|√|√|√|√||
|grpc|√|√|√|√|√|√|√|√|√|√||
|gmagick|√|√|√|√|√|√|√|√|√|√|与 imagick 不兼容|
|iconv|√|√|√|√|√|√|√|√|√|√||
|igbinary|√|√|√|√|√|√|√|√|√|√||
|imagick|x|x|x|√|√|√|√|√|√|√||
|imap|√|√|√|√|√|√|√|√|√|√||
|intl|√|√|√|√|√|√|√|√|√|√||
|ionCube|x|x|√|√|√|√|x|√|√|√||
|ldap|√|√|√|√|√|√|√|√|√|√||
|mbstring|√|√|√|√|√|√|√|√|√|√||
|mcrypt|√|√|√|√|√|√|√|√|√|√|<7.1|
|memcache|√|√|√|√|√|√|√|√|√|√|弃用|
|memcached|√|√|√|√|√|√|√|√|√|√||
|mongodb|√|√|√|√|√|√|√|√|√|√||
|mysql|√|√|√|√|√|√|√|√|√|√||
|mysqli|√|√|√|√|√|√|√|√|√|√||
|pcov|√|√|√|√|√|√|√|√|√|√||
|pdo_dblib|√|√|√|√|√|√|√|√|√|√||
|pdo_mysql|√|√|√|√|√|√|√|√|√|√||
|PDO_ODBC|√|√|√|√|√|√|√|√|√|√||
|pdo_pgsql|√|√|√|√|√|√|√|√|√|√||
|pdo_sqlite|√|√|√|√|√|√|√|√|√|√||
|pdo_sqlsrv|x|x|√|√|√|√|√|√|√|√||
|pgsql|√|√|√|√|√|√|√|√|√|√||
|redis|√|√|√|√|√|√|√|√|√|√||
|soap|√|√|√|√|√|√|√|√|√|√||
|sockets|√|√|√|√|√|√|√|√|√|√||
|solr|√|√|√|√|√|√|√|√|√|√||
|Source Guarding|√|√|√|√|√|√|√|√|√|√||
|sqlsrv|x|x|√|√|√|√|√|√|√|√||
|ssh2|√|√|√|√|√|√|√|√|√|√||
|swoole|x|x|x|x|x|x|√|√|√|x||
|timezonedb|√|√|√|√|√|√|√|√|√|√||
|xdebug|√|√|√|√|√|√|√|√|√|√||
|xhprof|√|√|√|√|√|√|√|√|√|√||
|xsl|√|√|√|√|√|√|√|√|√|√||
|xxtea|√|√|√|√|√|√|√|√|√|√||
|yac|√|√|√|√|√|√|√|√|√|√||
|yaconf|√|√|√|√|√|√|√|√|√|√||
|yaf|√|√|√|√|√|√|√|√|√|√||
|yaml|√|√|√|√|√|√|√|√|√|√||
|Zend OPcache|√|√|√|√|√|√|√|√|√|√||
|zlib|√|√|√|√|√|√|√|√|√|√||
|zip|√|√|√|√|√|√|√|√|√|√||
|zstd|√|√|√|√|√|√|√|√|√|√||

## Extension 对应支持的版本

| 扩展            | 5.6 | 7.0 |7.1|7.2|7.3|7.4|8.0|8.1|8.2|8.3|
| --------------- | ---- | ------ |-|-|-|-|-|-|-|-|
| amqp     | x | x |x|x|x|x|x|x|x|x|
| apc     | x | x |x|x|x|x|x|x|x|x|
| apcu     | x | x |x|x|x|x|x|x|x|x|
| ImageMagick     |x | x |x|x|x|x|x|x|x|a|
| ionCube         | x | x ||x|x|x|x|x|x|x|
| OPcache         | x | x ||x|x|x|x|x|x|x|
| Phalcon         | x | x ||x|x|x|x|x|x|x|
| Source Guardian | x | x ||x|x|x|x|x|x|x|
| Xdebug          | x | x ||x|x|x|x|x|x|x|
| JIT             | x | x ||x|x|x|x|x|x|x|
| Swoole          | x | x ||x|x|x|x|x|x|x|
| Memcached       | x | x ||x|x|x|x|x|x|x|
| Xdebug          | x | x ||x|x|x|x|x|x|x|
| Redis           | x | x ||x|x|x|x|x|x|x|
| Mongo           | x | x ||x|x|x|x|x|x|x|
| sqlsrv | x | 5.3.0 |5.7.1|5.8.1|5.9.0|5.10.0|5.1.11|5.12|5.12|5.12|

### 从源代码编译

- https://github.com/php/php-src/raw/master/main/php_version.h

## Issue

- wddx removed in 7.4.0
- ionCube not avaiable in php 8.0
