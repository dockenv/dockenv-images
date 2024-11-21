# Sshwifty Web SSH & Telnet Client

<span>Sshwifty is a SSH and Telnet client made for the Web, allow you to access SSH and Telnet services right from your web browser.</span>

## Usage
```bash
docker run -d \
  --restart always \
  --publish 8182:8182 \
  --name sshwifty \
  ghcr.io/dockenv/sshwifty:latest
```