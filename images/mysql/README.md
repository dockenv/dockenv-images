## Usage

```bash
docker run -d --name percona \
    -e MYSQL_ROOT_PASSWORD=dockenv \
    -e MYSQL_USER=dockenv \
    -e MYSQL_PASSWORD=dockenv \
    -v /path/to/conf:/etc/my.cnf.d \
    -v /path/to/data:/var/lib/mysql \
    swr.ap-southeast-3.myhuaweicloud.com/dockenv/mysql:5.7 \
    --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci
```

## Stopped Tags
- 5.6
- 5.7
- 8.1
- 8.2
- 8.3
- 9.0