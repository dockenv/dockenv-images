## shadowsocks


- **shadowsocks-libev 版本: 3.0.3**
- **kcptun 版本: 20170308**

### 打开姿势

``` sh
docker run -dt --name ss -p 6443:6443 mritd/shadowsocks -s "-s 0.0.0.0 -p 6443 -m aes-256-cfb -k test123 --fast-open"
```

### 支持选项

- `-s` : shadowsocks-libev 参数字符串
- `-k` : kcptun 参数字符串
- `-x` : 开启 kcptun 支持

### 选项描述

`-s` 参数后指定一个 shadowsocks-libev 的参数字符串，所有参数将被拼接到 `ss-server` 后；
`-k` 参数后指定一个 kcptun 的参数字符串，所有参数将被拼接到 `kcptun` 后
`-x` 指定该参数后才会开启 kcptun 支持，否则将默认禁用 kcptun

### 命令示例

``` sh
docker run -dt --name ss -p 6443:6443 -p 6500:6500/udp mritd/shadowsocks -s "-s 0.0.0.0 -p 6443 -m aes-256-cfb -k test123 --fast-open" -k "-t 127.0.0.1:6443 -l :6500 -mode fast2" -x
```

**以上命令相当于执行了**

``` sh
ss-server -s 0.0.0.0 -p 6443 -m aes-256-cfb -k test123 --fast-open
kcptun -t 127.0.0.1:6443 -l :6500 -mode fast2
```

**关于 shadowsocks-libev 和 kcptun 都支持哪些参数请自行查阅官方文档，本镜像只做一个拼接**

**注意：kcptun 映射端口为 udp 模式(`6500:6500/udp`)，不写默认 tcp；shadowsocks 请监听 0.0.0.0**


### 环境变量支持


|环境变量|作用|取值|
|-------|---|---|
|SS_CONFIG|shadowsocks-libev 参数字符串|所有字符串内内容应当为 shadowsocks-libev 支持的选项参数|
|KCP_CONFIG|kcptun 参数字符串|所有字符串内内容应当为 kcptun 支持的选项参数|
|KCP_FLAG|是否开启 kcptun 支持|可选参数为 true 和 false，默认为 fasle 禁用 kcptun|


使用时可指定环境变量，如下

``` sh
docker run -dt --name ss -p 6443:6443 -p 6500:6500/udp -e SS_CONFIG="-s 0.0.0.0 -p 6443 -m aes-256-cfb -k test123 --fast-open" -e KCP_CONFIG="-t 127.0.0.1:6443 -l :6500 -mode fast2" -e KCP_FLAG="true" mritd/shadowsocks
```

### 樱花用户说明

本镜像 3.0.3 版本之后，原来的 `/root/entrypoint.sh` 被移动到了 `/entrypoint.sh`
其他选项参数更新为只有两个参数 `-s`(shadowsocks) 和 `-k`(kcptun)，具体使用同上
以下为在樱花上测试过的同时开启 shadowsocks 和 kcptun 的命令

``` sh
/entrypoint.sh -s "-s 0.0.0.0 -p 6443 -m aes-256-cfb -k test123 --fast-open" -k "-t 127.0.0.1:6443 -l :6500 -mode fast2" -x
```

如果仅使用 shadowsocks 那么请去除 `-k` 和 `-x` 参数即可

### 更新日志

- 2016-10-12 基于 shadowsocks 2.9.0 版本

基于 shadowsocks 2.9.0 版本打包 docker image

- 2016-10-13 增加 kcptun 支持

增加 kcptun 的支持，使用 `-x` 可关闭

- 2016-10-14 增加 环境变量支持

增加 默认读取环境变量策略，可通过环境变量指定 shadowsocks 相关设置

- 2016-11-01 升级 kcptun，增加 kcptun 自定义配置选项(-c 或 环境变量)

增加了 `-c` 参数和环境变量 `KCPTUN_CONFIG`，用于在不挂载文件的情况下重写 kcptun 的配置

- 2016-11-07 chacha20 加密支持

增加了 libsodium 库,用于支持 chacha20 加密算法(感谢 Lihang Chen 提出),删除了 wget 进一步精简镜像体积

- 2016-11-30 更新 kcptun 版本

更新 kcptun 版本到 20161118，修正样例命令中 kcptun 端口号使用 tcp 问题(应使用 udp)，感谢 Zheart 提出

- 2016-12-19 更新 kcptun 到 20161202

更新 kcptun 版本到 20161202，完善 README 中 kcptun 说明

- 2016-12-30 更新 kcptun 到 20161222

更新 kcptun 版本到 20161222，更新基础镜像 alpine 到 3.5

- 2017-01-20 升级 kcptun 到 20170117

更新 kcptun 到 20170117，kcptun 新版本 ack 结构中更准确的RTT估算，锁优化，更平滑的rtt计算jitter，
建议更新；同时 20170120 处于 Pre-release 暂不更新；**最近比较忙，可能 kcptun 配置已经有更新，具体
请参考 kcptun 官网及 [Github](https://github.com/xtaci/kcptun)**

- 2017-01-25 升级 kcptun 到 20171222

更新 kcptun 到 2017...... 别的我忘了......

- 2017-02-08 升级 kcptun 到 20170120

更新 kcptun 到 20170120，**下个版本准备切换到 shadowsocks-libev 3.0，目前 3.0 还未正式发布，观望中!**

- 2017-02-25 切换到 shadowsocks-libev

切换到 shadowsocks-libev 3.0 版本，同时更新 kcptun 和参数设定

- 2017-03-07 升级 kcptun 到 20170303

更新 kcptun 到 20170303

- 2017-03-09 升级 kcptun 到 20170308

更新 kcptun 到 20170308
