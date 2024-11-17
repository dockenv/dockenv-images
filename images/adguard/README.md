# AdGuard Home

> Network-wide ads & trackers blocking DNS server.

## Usage
### AdGuardHome
```bash
docker run -d --name adguardhome \
    -p 53:53/udp \
    -p 53:53/tcp \
    -p 80:3000/tcp \
    -p 443:443/tcp \
    -p 853:853/udp \
    -p 853:853/tcp \
    -v /path/to/config:/opt/adguardhome/conf \ # include AdGuardHome.yaml file
    -v /path/to/data:/opt/adguardhome/work \
    ghcr.io/dockenv/adguard:adgh
```

### DNS Proxy
```bash
docker run -d \
    --name dnsproxy \
    -p 53:53/tcp \
    -p 53:53/udp \
    ghcr.io/dockenv/adguard:dnsproxy

```