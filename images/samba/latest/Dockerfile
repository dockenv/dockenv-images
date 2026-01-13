FROM ghcr.io/dockenv/alpine:latest

LABEL org.opencontainers.image.title="Samba" \
      org.opencontainers.image.authors="Cloudflying <oss@live.hk>" \
      org.opencontainers.image.source="https://github.com/dockenv/dockenv-images" \
      org.opencontainers.image.url="https://dockenv.github.io" \
      org.opencontainers.image.description='Samba is the most feature-rich Open Source implementation of the SMB and Active Directory protocols for Linux and UNIX-like systems.'

RUN apk add --no-cache samba-server

# 137 NetBIOS (nmbd)
# 138 NetBIOS Message
# 139 NetBIOS over TCP/IP（NBT） For File And Printer
# 389 LDAP (Active Directory Mode)
# 445 Samba Server (smbd)
EXPOSE 137 138 139 389 445