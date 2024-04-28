## Usage

```bash
docker run -d --name percona \
    -e MYSQL_ROOT_PASSWORD=dockenv \
    -e MYSQL_USER=dockenv \
    -e MYSQL_PASSWORD=dockenv \
    -v /path/to/conf:/etc/my.cnf.d \
    -v /path/to/data:/var/lib/mysql \
    ghcr.io/dockenv/percona:latest \
    --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci
```