## Percona
- Percona Server is a fork of the MySQL relational database management system created by Percona.

## Usage

```bash
docker run -d \
    --name percona \
    -e MYSQL_ROOT_PASSWORD=dockenv \
    -e MYSQL_USER=dockenv \
    -e MYSQL_PASSWORD=dockpass \
    -v /path/to/conf:/etc/my.cnf.d \
    -v /path/to/data:/var/lib/mysql \
    ghcr.io/dockenv/percona:latest \
    --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci
```