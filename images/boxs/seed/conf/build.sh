#!/usr/bin/env bash

USER='www'
VERSION=$(bin/aria2c -v | grep 'aria2 version' | awk -F ' ' '{print $3}')
CONF=$(pwd)/aria2c.conf

# 检查环境 不足则补充
env()
{
    BIT=$(getconf LONG_BIT)
    USER_EXIST=$(grep '^www:' /etc/passwd) # 为空则不存在
    if [[ -z ${USER_EXIST} ]]; then
        useradd ${USER}
    fi
}


clear_env()
{
    if [[ -z $(command -v sudo)  ]]; then
        echo ' command sudo not found'
    fi
    
    if [[ -z $(command -v curl)  ]]; then
        echo ' command curl not found'
    fi

    userdel ${USER}
}

do_start()
{
    CMD="sudo -Hu ${USER} bin/aria2c --conf-path=${CONF} -D >> aria2c.run.log"
    ${CMD}

    PID=$(ps -aux | grep -v grep | grep aria2c | awk -F ' ' '{print $2}')
    if [[ ! -z ${PID} ]]; then
        echo "==> Aria2c is start complete pid: ${PID}"
    fi
}

do_stop()
{
    echo "==> Aria2c is running Stop it now"
    PID=$(ps -aux | grep -v grep | grep aria2c | awk -F ' ' '{print $2}')

    if [[ -z ${PID} ]]; then
        echo "==> Aria2c is running, pid: ${PID} , Stop it Now"
    fi
    kill -9 ${PID}
}

do_reload()
{
    do_stop
    do_start
}

# 更新 aria2c 依赖的数据
do_update()
{
    TRACKERS=$(curl -sL https://cdn.jsdelivr.net/gh/XIU2/TrackersListCollection@master/all_aria2.txt)
    sed -i "/^bt-tracker=/d" ${CONF}
    echo "
bt-tracker=${TRACKERS}" >> ${CONF}
    echo "Update Tracker Complete"
}

usage(){
echo "Aria Command Line Helper
"
    
}

do_get_hash()
{
    CMD="bin/aria2c --bt-metadata-only=true --bt-save-metadata=true --bt-tracker=http://1337.abcvg.info:80/announce,http://157.7.202.64:8080/announce,http://158.69.146.212:7777/announce,http://173.254.204.71:1096/announce,http://178.175.143.27:80/announce,http://178.33.73.26:2710/announce,http://182.176.139.129:6969/announce,http://185.5.97.139:8089/announce,http://185.83.215.123:6969/announce,http://188.165.253.109:1337/announce,http://194.106.216.222:80/announce,http://195.123.209.37:1337/announce,http://210.244.71.25:6969/announce,http://210.244.71.26:6969/announce,http://213.163.67.56:1337/announce,http://37.19.5.139:6969/announce,http://37.19.5.155:6881/announce,http://46.4.109.148:6969/announce,http://5.79.249.77:6969/announce,http://5.79.83.193:2710/announce,http://51.254.244.161:6969/announce,http://59.36.96.77:6969/announce,http://5rt.tace.ru:60889/announce,http://62.210.202.61:80/announce,http://74.82.52.209:6969/announce,http://78.30.254.12:2710/announce,http://80.246.243.18:6969/announce,http://81.200.2.231:80/announce,http://85.17.19.180:80/announce,http://87.110.238.140:6969/announce,http://87.248.186.252:8080/announce,http://87.253.152.137:80/announce,http://91.216.110.47:80/announce,http://91.217.91.21:3218/announce,http://91.218.230.81:6969/announce,http://93.92.64.5:80/announce,http://95.211.168.204:2710/announce,http://[2001:1b10:1000:8101:0:242:ac11:2]:6969/announce,http://[2001:470:1:189:0:1:2:3]:6969/announce,http://[2a04:ac00:1:3dd8::1:2710]:2710/announce,http://aaa.army:8866/announce,http://agusiq-torrents.pl:6969/announce,http://asnet.pw:2710/announce,http://atrack.pow7.com:80/announce,http://bobbialbano.com:6969/announce,http://bt.3kb.xyz:80/announce,http://bt.okmp3.ru:2710/announce,http://bt.pusacg.org:8080/announce,http://explodie.org:6969/announce,http://fxtt.ru:80/announce,http://h4.trakx.nibba.trade:80/announce,http://mail2.zelenaya.net:80/announce,http://milanesitracker.tekcities.com:80/announce,http://ns349743.ip-91-121-106.eu:80/announce,http://open.acgnxtracker.com:80/announce,http://open.acgtracker.com:1096/announce,http://open.lolicon.eu:7777/announce,http://open.touki.ru:80/announce.php,http://opentracker.i2p.rocks:6969/announce,http://p4p.arenabg.ch:1337/announce,http://p4p.arenabg.com:1337/announce,http://pow7.com:80/announce,http://pt.lax.mx:80/announce,http://retracker.bashtel.ru:80/announce,http://retracker.gorcomnet.ru:80/announce,http://retracker.hotplug.ru:2710/announce,http://retracker.krs-ix.ru:80/announce,http://retracker.mgts.by:80/announce,http://retracker.sevstar.net:2710/announce,http://retracker.spark-rostov.ru:80/announce,http://retracker.telecom.by:80/announce,http://rt.tace.ru:80/announce,http://secure.pow7.com:80/announce,http://share.camoe.cn:8080/announce,http://siambit.org:80/announce.php,http://t.acg.rip:6699/announce,http://t.nyaatracker.com:80/announce,http://t.overflow.biz:6969/announce,http://t1.pow7.com:80/announce,http://t2.pow7.com:80/announce,http://thetracker.org:80/announce,http://torrentclub.online:54123/announce,http://torrentsmd.com:8080/announce,http://torrentsmd.eu:8080/announce,http://torrenttracker.nwc.acsalaska.net:6969/announce,http://tr.cili001.com:8070/announce,http://tr.kxmp.cf:80/announce,http://tracker-cdn.moeking.me:2095/announce,http://tracker.aletorrenty.pl:2710/announce,http://tracker.anonwebz.xyz:8080/announce,http://tracker.birkenwald.de:6969/announce,http://tracker.bittor.pw:1337/announce,http://tracker.bittorrent.am:80/announce,http://tracker.bt4g.com:2095/announce,http://tracker.bz:80/announce,http://tracker.city9x.com:2710/announce,http://tracker.devil-torrents.pl:80/announce,http://tracker.dler.org:6969/announce,http://tracker.dutchtracking.nl:80/announce,http://tracker.edoardocolombo.eu:6969/announce,http://tracker.electro-torrent.pl:80/announce,http://tracker.ex.ua:80/announce,http://tracker.files.fm:6969/announce,http://tracker.flashtorrents.org:6969/announce,http://tracker.gbitt.info:80/announce,http://tracker.grepler.com:6969/announce,http://tracker.ipv6tracker.ru:80/announce,http://tracker.kuroy.me:5944/announce,http://tracker.lelux.fi:80/announce,http://tracker.mg64.net:6881/announce,http://tracker.moeking.me:6969/announce,http://tracker.noobsubs.net:80/announce,http://tracker.opentrackr.org:1337/announce,http://tracker.sakurato.xyz:23333/announce,http://tracker.skyts.net:6969/announce,http://tracker.sloppyta.co:80/announce,http://tracker.tfile.co:80/announce,http://tracker.tfile.me:80/announce,http://tracker.tiny-vps.com:6969/announce,http://tracker.torrentyorg.pl:80/announce,http://tracker.trackerfix.com:80/announce,http://tracker.tvunderground.org.ru:3218/announce,http://tracker.uw0.xyz:6969/announce,http://tracker.vraphim.com:6969/announce,http://tracker.yoshi210.com:6969/announce,http://tracker.zerobytes.xyz:1337/announce,http://tracker.zum.bi:6969/announce,http://tracker01.loveapp.com:6789/announce,http://tracker1.bt.moack.co.kr:80/announce,http://tracker1.itzmx.com:8080/announce,http://tracker1.wasabii.com.tw:6969/announce,http://tracker2.dler.org:80/announce,http://tracker2.itzmx.com:6961/announce,http://tracker3.itzmx.com:6961/announce,http://tracker4.itzmx.com:2710/announce,http://vpn.flying-datacenter.de:6969/announce,http://vps02.net.orel.ru:80/announce,http://www.loushao.net:8080/announce,http://www.wareztorrent.com:80/announce,https://1337.abcvg.info:443/announce,https://2.tracker.eu.org:443/announce,https://3.tracker.eu.org:443/announce,https://aaa.army:8866/announce,https://open.kickasstracker.com:443/announce,https://opentracker.acgnx.se:443/announce,https://tp.m-team.cc:443/announce.php,https://tr.ready4.icu:443/announce,https://tr.steins-gate.moe:2096/announce,https://tracker.bt-hash.com:443/announce,https://tracker.cyber-hub.net:443/announce,https://tracker.foreverpirates.co:443/announce,https://tracker.gbitt.info:443/announce,https://tracker.imgoingto.icu:443/announce,https://tracker.lelux.fi:443/announce,https://tracker.lilithraws.cf:443/announce,https://tracker.nanoha.org:443/announce,https://tracker.nitrix.me:443/announce,https://tracker.parrotsec.org:443/announce,https://tracker.sloppyta.co:443/announce,https://tracker.tamersunion.org:443/announce,https://trakx.herokuapp.com:443/announce,https://w.wwwww.wtf:443/announce,https://www.wareztorrent.com:443/announce,udp://151.80.120.114:2710/announce,udp://168.235.67.63:6969/announce,udp://178.33.73.26:2710/announce,udp://182.176.139.129:6969/announce,udp://185.5.97.139:8089/announce,udp://185.83.215.123:6969/announce,udp://185.86.149.205:1337/announce,udp://188.165.253.109:1337/announce,udp://191.101.229.236:1337/announce,udp://194.106.216.222:80/announce,udp://195.123.209.37:1337/announce,udp://195.123.209.40:80/announce,udp://208.67.16.113:8000/announce,udp://212.1.226.176:2710/announce,udp://212.47.227.58:6969/announce,udp://213.163.67.56:1337/announce,udp://37.19.5.155:2710/announce,udp://3rt.tace.ru:60889/announce,udp://46.4.109.148:6969/announce,udp://47.ip-51-68-199.eu:6969/announce,udp://5.79.249.77:6969/announce,udp://5.79.83.193:6969/announce,udp://51.254.244.161:6969/announce,udp://52.58.128.163:6969/announce,udp://62.138.0.158:6969/announce,udp://62.212.85.66:2710/announce,udp://6ahddutb1ucc3cp.ru:6969/announce,udp://6rt.tace.ru:80/announce,udp://74.82.52.209:6969/announce,udp://78.30.254.12:2710/announce,udp://85.17.19.180:80/announce,udp://89.234.156.205:80/announce,udp://9.rarbg.com:2710/announce,udp://9.rarbg.me:2710/announce,udp://9.rarbg.me:2780/announce,udp://9.rarbg.to:2710/announce,udp://9.rarbg.to:2730/announce,udp://91.216.110.52:451/announce,udp://91.218.230.81:6969/announce,udp://94.23.183.33:6969/announce,udp://95.211.168.204:2710/announce,udp://[2001:1b10:1000:8101:0:242:ac11:2]:6969/announce,udp://[2001:470:1:189:0:1:2:3]:6969/announce,udp://[2a03:7220:8083:cd00::1]:451/announce,udp://[2a04:ac00:1:3dd8::1:2710]:2710/announce,udp://[2a04:c44:e00:32e0:4cf:6aff:fe00:aa1]:6969/announce,udp://aaa.army:8866/announce,udp://adm.category5.tv:6969/announce,udp://admin.videoenpoche.info:6969/announce,udp://adminion.n-blade.ru:6969/announce,udp://anidex.moe:6969/announce,udp://api.bitumconference.ru:6969/announce,udp://aruacfilmes.com.br:6969/announce,udp://bclearning.top:6969/announce,udp://benouworldtrip.fr:6969/announce,udp://bioquantum.co.za:6969/announce,udp://bitsparadise.info:6969/announce,udp://blokas.io:6969/announce,udp://bms-hosxp.com:6969/announce,udp://bt.firebit.org:2710/announce,udp://bt1.archive.org:6969/announce,udp://bt2.3kb.xyz:6969/announce,udp://bt2.54new.com:8080/announce,udp://bt2.archive.org:6969/announce,udp://bubu.mapfactor.com:6969/announce,udp://camera.lei001.com:6969/announce,udp://cdn-1.gamecoast.org:6969/announce,udp://cdn-2.gamecoast.org:6969/announce,udp://chihaya.toss.li:9696/announce,udp://code2chicken.nl:6969/announce,udp://concen.org:6969/announce,udp://cutiegirl.ru:6969/announce,udp://daveking.com:6969/announce,udp://denis.stalker.upeer.me:6969/announce,udp://discord.heihachi.pw:6969/announce,udp://dpiui.reedlan.com:6969/announce,udp://drumkitx.com:6969/announce,udp://eddie4.nl:6969/announce,udp://edu.uifr.ru:6969/announce,udp://engplus.ru:6969/announce,udp://exodus.desync.com:6969/announce,udp://fe.dealclub.de:6969/announce,udp://forever-tracker.zooki.xyz:6969/announce,udp://free-tracker.zooki.xyz:6969/announce,udp://inferno.demonoid.is:3391/announce,udp://ipv4.tracker.harry.lu:80/announce,udp://ipv6.tracker.harry.lu:80/announce,udp://ipv6.tracker.zerobytes.xyz:16661/announce,udp://johnrosen1.com:6969/announce,udp://kanal-4.de:6969/announce,udp://line-net.ru:6969/announce,udp://ln.mtahost.co:6969/announce,udp://mail.realliferpg.de:6969/announce,udp://mgtracker.org:2710/announce,udp://movies.zsw.ca:6969/announce,udp://mts.tvbit.co:6969/announce,udp://nagios.tks.sumy.ua:80/announce,udp://ns-1.x-fins.com:6969/announce,udp://ns389251.ovh.net:6969/announce,udp://open.demonii.com:1337/announce,udp://open.demonii.si:1337/announce,udp://open.lolicon.eu:7777/announce,udp://open.stealth.si:80/announce,udp://opentor.org:2710/announce,udp://opentracker.i2p.rocks:6969/announce,udp://p4p.arenabg.ch:1337/announce,udp://public-tracker.zooki.xyz:6969/announce,udp://public.popcorn-tracker.org:6969/announce,udp://public.publictracker.xyz:6969/announce,udp://retracker.hotplug.ru:2710/announce,udp://retracker.lanta-net.ru:2710/announce,udp://retracker.netbynet.ru:2710/announce,udp://retracker.nts.su:2710/announce,udp://retracker.sevstar.net:2710/announce,udp://sd-161673.dedibox.fr:6969/announce,udp://shadowshq.eddie4.nl:6969/announce,udp://shadowshq.yi.org:6969/announce,udp://storage.groupees.com:6969/announce,udp://t1.leech.ie:1337/announce,udp://t2.leech.ie:1337/announce,udp://t3.leech.ie:1337/announce,udp://teamspeak.value-wolf.org:6969/announce,udp://thetracker.org:80/announce,udp://torrent.tdjs.tech:6969/announce,udp://torrentclub.online:54123/announce,udp://tr.bangumi.moe:6969/announce,udp://tr.cili001.com:8070/announce,udp://tr2.ysagin.top:2710/announce,udp://tracker-udp.gbitt.info:80/announce,udp://tracker-v6.zooki.xyz:6969/announce,udp://tracker.0x.tf:6969/announce,udp://tracker.aletorrenty.pl:2710/announce,udp://tracker.altrosky.nl:6969/announce,udp://tracker.army:6969/announce,udp://tracker.beeimg.com:6969/announce,udp://tracker.birkenwald.de:6969/announce,udp://tracker.bittor.pw:1337/announce,udp://tracker.coppersurfer.tk:6969/announce,udp://tracker.cyberia.is:6969/announce,udp://tracker.dler.org:6969/announce,udp://tracker.ds.is:6969/announce,udp://tracker.e-utp.net:6969/announce,udp://tracker.eddie4.nl:6969/announce,udp://tracker.ex.ua:80/announce,udp://tracker.filemail.com:6969/announce,udp://tracker.flashtorrents.org:6969/announce,udp://tracker.fortu.io:6969/announce,udp://tracker.grepler.com:6969/announce,udp://tracker.kali.org:6969/announce,udp://tracker.kuroy.me:5944/announce,udp://tracker.leechers-paradise.org:6969/announce,udp://tracker.lelux.fi:6969/announce,udp://tracker.moeking.me:6969/announce,udp://tracker.open-internet.nl:6969/announce,udp://tracker.opentrackr.org:1337/announce,udp://tracker.piratepublic.com:1337/announce,udp://tracker.publictracker.xyz:6969/announce,udp://tracker.shkinev.me:6969/announce,udp://tracker.sigterm.xyz:6969/announce,udp://tracker.skyts.net:6969/announce,udp://tracker.swateam.org.uk:2710/announce,udp://tracker.tiny-vps.com:6969/announce,udp://tracker.torrent.eu.org:451/announce,udp://tracker.tvunderground.org.ru:3218/announce,udp://tracker.uw0.xyz:6969/announce,udp://tracker.v6speed.org:6969/announce,udp://tracker.yoshi210.com:6969/announce,udp://tracker.zemoj.com:6969/announce,udp://tracker.zerobytes.xyz:1337/announce,udp://tracker.zum.bi:6969/announce,udp://tracker0.ufibox.com:6969/announce,udp://tracker1.bt.moack.co.kr:80/announce,udp://tracker1.itzmx.com:8080/announce,udp://tracker2.christianbro.pw:6969/announce,udp://tracker2.dler.org:80/announce,udp://tracker2.indowebster.com:6969/announce,udp://tracker2.itzmx.com:6961/announce,udp://tracker3.itzmx.com:6961/announce,udp://tracker4.itzmx.com:2710/announce,udp://u.wwwww.wtf:1/announce,udp://udp-tracker.shittyurl.org:6969/announce,udp://us-tracker.publictracker.xyz:6969/announce,udp://valakas.rollo.dnsabr.com:2710/announce,udp://vibe.community:6969/announce,udp://wassermann.online:6969/announce,udp://www.loushao.net:8080/announce,udp://z.mercax.com:53/announce,udp://zephir.monocul.us:6969/announce,udp://zer0day.ch:1337/announce,udp://zer0day.to:1337/announce magnet:?xt=urn:btih:"$1
    $CMD 
}

case $1 in
    r|-r|run)
        do_start
        ;;
    reload)
        do_reload
        ;;
    stop)
        do_stop
        ;;
    u|-u|update)
        do_update
        ;;
    -d|get-hash)
        do_get_hash $2
        ;;
    *|help)
        usage
        ;;
esac