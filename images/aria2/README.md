## Aria2

## Usage
```bash
# 暴漏端口
ufw allow 6800
ufw allow 6881:6999/tcp
ufw allow 6881:6999/udp

docker run -d \
    --name aria2 \
    --hostname aria2 \
    -v $(pwd):/data/downloads \
    -p 6800:6800 \
    -p 6881-6999:6881-6999 \
    swr.ap-southeast-3.myhuaweicloud.com/dockenv/aria2:latest
```