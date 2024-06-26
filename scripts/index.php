<?php
/**
 * TODO
 * 识别操作系统
 * 识别系统信息
 */

if (isset($GET['debug']) && $GET['debug'] == 'true') {
    error_reporting(-1); // 抑制所有错误信息
    ini_set('display_errors', 'On');
} else {
    error_reporting(0); // 抑制所有错误信息
    ini_set('display_errors', 'Off');
}

@header("content-Type: text/html; charset=utf-8"); //语言强制
ob_start();
date_default_timezone_set('Asia/Shanghai');//时区设置
$title = 'PHP 探针';
$version = "v0.4.7"; //版本
define('HTTP_HOST', preg_replace('~^www\.~i', '', $_SERVER['HTTP_HOST']));
$time_start = microtime_float();

function memory_usage()
{
    $memory = (!function_exists('memory_get_usage')) ? '0' : round(memory_get_usage() / 1024 / 1024, 2) . 'MB';
    return $memory;
}

function get_os()
{
    // support alpine Ubuntu
    if (file_exists('/etc/os-release') && is_readable('/etc/os-release')) {
        $info = parse_ini_file('/etc/os-release');
        $os_name = isset($info['PRETTY_NAME']) ? $info['PRETTY_NAME'] : $info['NAME'] . $info['VERSION_ID'];
    } else {
        $os_name = php_uname('s');
    }
    return $os_name;
}

/**
 * 检测拓展是否存在 存在则返回版本信息 若自定义函数或版本信息则返回自定义版本信息
 * @param string $func
 * @param string $ver
 * @return string
 */
function is_ext($ext, $ver = '')
{
    if ((phpversion($ext)) != false) {
        echo "<font color=green><i class=\"fa fa-check\"></i></font> ";
        if (function_exists($ver)) {
            echo $ver();
        } elseif ($ver != '') {
            echo $ver;
        } else {
            echo phpversion($ext);
        }
    } else {
        echo "<font color=red><i class=\"fa fa-times\"></i></font>";
    }
}

/**
 * 检测函数是否存在 存在则返回版本信息
 * @param string $func
 * @param string $ver
 * @return string
 */
function is_func($func, $ver = '')
{
    if (function_exists($func)) {
        echo "<font color=green><i class=\"fa fa-check\"></i></font>　Ver " . call_user_func($func);
    } else {
        echo "<font color=red><i class=\"fa fa-times\"></i></font>";
    }
}
/**
 * 对于手动确认或输入参数进行确认的扩展或参数
 */
function is_enable($conf)
{
    return ($conf == true) ? "<font color=green><i class=\"fa fa-check\"></i></font>" : "<font color=red><i class=\"fa fa-times\"></i></font>";
}

// 计时
function microtime_float()
{
    $mtime = microtime();
    $mtime = explode(' ', $mtime);
    return $mtime[1] + $mtime[0];
}

//单位转换
function formatsize($size)
{
    $danwei = array(' B ', ' K ', ' M ', ' G ', ' T ');
    $allsize = array();
    $i = 0;
    for ($i = 0; $i < 5; $i++) {
        if (floor($size / pow(1024, $i)) == 0) {
            break;
        }
    }

    for ($l = $i - 1; $l >= 0; $l--) {
        $allsize1[$l] = floor($size / pow(1024, $l));
        $allsize[$l] = $allsize1[$l] - $allsize1[$l + 1] * 1024;
    }

    $len = count($allsize);
    $fsize = '';
    for ($j = $len - 1; $j >= 0; $j--) {
        $fsize = $fsize . $allsize[$j] . $danwei[$j];
    }
    return $fsize;
}

function valid_email($str)
{
    return (!preg_match("/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix", $str)) ? FALSE : TRUE;
}

//检测PHP设置参数
function show($varName)
{
    switch ($result = get_cfg_var($varName)) {
        case 0:
            return '<font color="red"><i class="fa fa-times"></i></font>';
            break;
        case 1:
            return '<font color="green"><i class="fa fa-check"></i></font>';
            break;
        default:
            return $result;
            break;
    }
}

//保留服务器性能测试结果
$valInt = isset($_POST['pInt']) ? $_POST['pInt'] : "未测试";
$valFloat = isset($_POST['pFloat']) ? $_POST['pFloat'] : "未测试";
$valIo = isset($_POST['pIo']) ? $_POST['pIo'] : "未测试";

if (isset($_GET['act']) && $_GET['act'] == "phpinfo") {
    phpinfo();
    exit();
} elseif (isset($_POST['act']) && $_POST['act'] == "整型测试") {
    $valInt = test_int();
} elseif (isset($_POST['act']) && $_POST['act'] == "浮点测试") {
    $valFloat = test_float();
} elseif (isset($_POST['act']) && $_POST['act'] == "IO测试") {
    $valIo = test_io();
}
//网速测试-开始
elseif (isset($_POST['act']) && $_POST['act'] == "开始测试") {
    ?>
    <script language="javascript" type="text/javascript">
        var acd1;
        acd1 = new Date();
        acd1ok = acd1.getTime();
    </script>
    <?php
    for ($i = 1; $i <= 204800; $i++) {
        echo "<!--34567890#########0#########0#########0#########0#########0#########0#########0#########012345-->";
    }
    ?>
    <script language="javascript" type="text/javascript">
        var acd2;
        acd2 = new Date();
        acd2ok = acd2.getTime();
        window.location = '?speed=' + (acd2ok - acd1ok) + '#w_networkspeed';
    </script>
    <?php
} elseif (isset($_GET['act']) && $_GET['act'] == "Function") {
    $arr = get_defined_functions();
    function php()
    {
    }
    echo "<pre>";
    echo "这里显示系统所支持的所有函数,和自定义函数\n";
    print_r($arr);
    echo "</pre>";
    exit();
} elseif (isset($_GET['act']) && $_GET['act'] == "disable_functions") {
    $disFuns = get_cfg_var("disable_functions");
    if (empty($disFuns)) {
        $arr = '<font color=red><i class="fa fa-times"></i></font>';
    } else {
        $arr = $disFuns;
    }
    function php()
    {
    }
    echo "<pre>";
    echo "这里显示系统被禁用的函数\n";
    print_r($arr);
    echo "</pre>";
    exit();
}

//MySQL检测
if (isset($_POST['act']) && $_POST['act'] == 'MySQL检测') {
    $host = isset($_POST['host']) ? trim($_POST['host']) : '';
    $port = isset($_POST['port']) ? (int) $_POST['port'] : '';
    $login = isset($_POST['login']) ? trim($_POST['login']) : '';
    $password = isset($_POST['password']) ? trim($_POST['password']) : '';
    $host = preg_match('~[^a-z0-9\-\.]+~i', $host) ? '' : $host;
    $port = intval($port) ? intval($port) : '';
    $login = preg_match('~[^a-z0-9\_\-]+~i', $login) ? '' : htmlspecialchars($login);
    $password = is_string($password) ? htmlspecialchars($password) : '';
} elseif (isset($_POST['act']) && $_POST['act'] == '函数检测') {
    $funRe = "函数" . $_POST['funName'] . "支持状况检测结果：" . isfun1($_POST['funName']);
} elseif (isset($_POST['act']) && $_POST['act'] == '邮件检测') {
    $mailRe = "邮件发送检测结果：发送";
    if ($_SERVER['SERVER_PORT'] == 80) {
        $mailContent = "http://" . $_SERVER['SERVER_NAME'] . ($_SERVER['PHP_SELF'] ? $_SERVER['PHP_SELF'] : $_SERVER['SCRIPT_NAME']);
    } else {
        $mailContent = "http://" . $_SERVER['SERVER_NAME'] . ":" . $_SERVER['SERVER_PORT'] . ($_SERVER['PHP_SELF'] ? $_SERVER['PHP_SELF'] : $_SERVER['SCRIPT_NAME']);
    }
    $mailRe .= (false !== @mail($_POST["mailAdd"], $mailContent, "This is a test mail!")) ? "完成" : "失败";
}

// 检测函数支持
function isfun($funName = '')
{
    if (!$funName || trim($funName) == '' || preg_match('~[^a-z0-9\_]+~i', $funName, $tmp))
        return '错误';
    return (false !== function_exists($funName)) ? '<font color="green"><i class="fa fa-check"></i></font>' : '<font color="red"><i class="fa fa-times"></i></font>';
}
function isfun1($funName = '')
{
    if (!$funName || trim($funName) == '' || preg_match('~[^a-z0-9\_]+~i', $funName, $tmp))
        return '错误';
    return (false !== function_exists($funName)) ? '<i class="fa fa-check"></i>' : '<i class="fa fa-times"></i>';
}

//整数运算能力测试
function test_int()
{
    $timeStart = gettimeofday();
    for ($i = 0; $i < 3000000; $i++) {
        $t = 1 + 1;
    }
    $timeEnd = gettimeofday();
    $time = ($timeEnd["usec"] - $timeStart["usec"]) / 1000000 + $timeEnd["sec"] - $timeStart["sec"];
    $time = round($time, 3) . "秒";
    return $time;
}

//浮点运算能力测试
function test_float()
{
    //得到圆周率值
    $t = pi();
    $timeStart = gettimeofday();
    for ($i = 0; $i < 3000000; $i++) {
        //开平方
        sqrt($t);
    }

    $timeEnd = gettimeofday();
    $time = ($timeEnd["usec"] - $timeStart["usec"]) / 1000000 + $timeEnd["sec"] - $timeStart["sec"];
    $time = round($time, 3) . "秒";
    return $time;
}

//IO能力测试
function test_io()
{
    $fp = @fopen(__FILE__, "r");
    $timeStart = gettimeofday();
    for ($i = 0; $i < 10000; $i++) {
        @fread($fp, 10240);
        @rewind($fp);
    }
    $timeEnd = gettimeofday();
    @fclose($fp);
    $time = ($timeEnd["usec"] - $timeStart["usec"]) / 1000000 + $timeEnd["sec"] - $timeStart["sec"];
    $time = round($time, 3) . "秒";
    return ($time);
}

function GetCoreInformation()
{
    $data = file('/proc/stat');
    $cores = array();
    foreach ($data as $line) {
        if (preg_match('/^cpu[0-9]/', $line)) {
            $info = explode(' ', $line);
            $cores[] = array('user' => $info[1], 'nice' => $info[2], 'sys' => $info[3], 'idle' => $info[4], 'iowait' => $info[5], 'irq' => $info[6], 'softirq' => $info[7]);
        }
    }
    return $cores;
}
function GetCpuPercentages($stat1, $stat2)
{
    if (count($stat1) !== count($stat2)) {
        return;
    }
    $cpus = array();
    for ($i = 0, $l = count($stat1); $i < $l; $i++) {
        $dif = array();
        $dif['user'] = $stat2[$i]['user'] - $stat1[$i]['user'];
        $dif['nice'] = $stat2[$i]['nice'] - $stat1[$i]['nice'];
        $dif['sys'] = $stat2[$i]['sys'] - $stat1[$i]['sys'];
        $dif['idle'] = $stat2[$i]['idle'] - $stat1[$i]['idle'];
        $dif['iowait'] = $stat2[$i]['iowait'] - $stat1[$i]['iowait'];
        $dif['irq'] = $stat2[$i]['irq'] - $stat1[$i]['irq'];
        $dif['softirq'] = $stat2[$i]['softirq'] - $stat1[$i]['softirq'];
        $total = array_sum($dif);
        $cpu = array();
        foreach ($dif as $x => $y)
            $cpu[$x] = round($y / $total * 100, 2);
        $cpus['cpu' . $i] = $cpu;
    }
    return $cpus;
}
$stat1 = GetCoreInformation();
sleep(1);
$stat2 = GetCoreInformation();
$data = GetCpuPercentages($stat1, $stat2);
$cpu_show = $data['cpu0']['user'] . "%us,  " . $data['cpu0']['sys'] . "%sy,  " . $data['cpu0']['nice'] . "%ni, " . $data['cpu0']['idle'] . "%id,  " . $data['cpu0']['iowait'] . "%wa,  " . $data['cpu0']['irq'] . "%irq,  " . $data['cpu0']['softirq'] . "%softirq";

// 根据不同系统取得CPU相关信息
switch (PHP_OS) {
    case "Linux":
        $sysReShow = (false !== ($sysInfo = sys_linux())) ? "show" : "none";
        break;
    case "FreeBSD":
        $sysReShow = (false !== ($sysInfo = sys_freebsd())) ? "show" : "none";
        break;
    /*
        case "WINNT":
            $sysReShow = (false !== ($sysInfo = sys_windows()))?"show":"none";
        break;
    */
    default:
        break;
}

//linux系统探测
function sys_linux()
{
    // CPU
    if (false === ($str = @file("/proc/cpuinfo")))
        return false;
    $str = implode("", $str);
    @preg_match_all("/model\s+name\s{0,}\:+\s{0,}([\w\s\)\(\@.-]+)([\r\n]+)/s", $str, $model);
    @preg_match_all("/cpu\s+MHz\s{0,}\:+\s{0,}([\d\.]+)[\r\n]+/", $str, $mhz);
    @preg_match_all("/cache\s+size\s{0,}\:+\s{0,}([\d\.]+\s{0,}[A-Z]+[\r\n]+)/", $str, $cache);
    @preg_match_all("/bogomips\s{0,}\:+\s{0,}([\d\.]+)[\r\n]+/", $str, $bogomips);
    if (false !== is_array($model[1])) {
        $res['cpu']['num'] = sizeof($model[1]);
        /*
        for($i = 0; $i < $res['cpu']['num']; $i++)
        {
            $res['cpu']['model'][] = $model[1][$i].'&nbsp;('.$mhz[1][$i].')';
            $res['cpu']['mhz'][] = $mhz[1][$i];
            $res['cpu']['cache'][] = $cache[1][$i];
            $res['cpu']['bogomips'][] = $bogomips[1][$i];
        }*/
        if ($res['cpu']['num'] == 1)
            $x1 = '';
        else
            $x1 = ' ×' . $res['cpu']['num'];
        $mhz[1][0] = ' | 频率:' . $mhz[1][0];
        $cache[1][0] = ' | 二级缓存:' . $cache[1][0];
        $bogomips[1][0] = ' | Bogomips:' . $bogomips[1][0];
        $res['cpu']['model'][] = $model[1][0] . $mhz[1][0] . $cache[1][0] . $bogomips[1][0] . $x1;
        if (false !== is_array($res['cpu']['model']))
            $res['cpu']['model'] = implode("<br />", $res['cpu']['model']);
        if (false !== is_array($res['cpu']['mhz']))
            $res['cpu']['mhz'] = implode("<br />", $res['cpu']['mhz']);
        if (false !== is_array($res['cpu']['cache']))
            $res['cpu']['cache'] = implode("<br />", $res['cpu']['cache']);
        if (false !== is_array($res['cpu']['bogomips']))
            $res['cpu']['bogomips'] = implode("<br />", $res['cpu']['bogomips']);
    }

    // UPTIME
    if (false === ($str = @file("/proc/uptime")))
        return false;
    $str = explode(" ", implode("", $str));
    $str = trim($str[0]);
    $min = $str / 60;
    $hours = $min / 60;
    $days = floor($hours / 24);
    $hours = floor($hours - ($days * 24));
    $min = floor($min - ($days * 60 * 24) - ($hours * 60));
    if ($days !== 0)
        $res['uptime'] = $days . " 天 ";
    if ($hours !== 0)
        $res['uptime'] .= $hours . " 小时 ";
    $res['uptime'] .= $min . " 分钟 ";

    // MEMORY
    if (false === ($str = @file("/proc/meminfo")))
        return false;
    $str = implode("", $str);
    preg_match_all("/MemTotal\s{0,}\:+\s{0,}([\d\.]+).+?MemFree\s{0,}\:+\s{0,}([\d\.]+).+?Cached\s{0,}\:+\s{0,}([\d\.]+).+?SwapTotal\s{0,}\:+\s{0,}([\d\.]+).+?SwapFree\s{0,}\:+\s{0,}([\d\.]+)/s", $str, $buf);
    preg_match_all("/Buffers\s{0,}\:+\s{0,}([\d\.]+)/s", $str, $buffers);
    $res['memTotal'] = round($buf[1][0] / 1024, 2);
    $res['memFree'] = round($buf[2][0] / 1024, 2);
    $res['memBuffers'] = round($buffers[1][0] / 1024, 2);
    $res['memCached'] = round($buf[3][0] / 1024, 2);
    $res['memUsed'] = $res['memTotal'] - $res['memFree'];
    $res['memPercent'] = (floatval($res['memTotal']) != 0) ? round($res['memUsed'] / $res['memTotal'] * 100, 2) : 0;
    $res['memRealUsed'] = $res['memTotal'] - $res['memFree'] - $res['memCached'] - $res['memBuffers']; //真实内存使用
    $res['memRealFree'] = $res['memTotal'] - $res['memRealUsed']; //真实空闲
    $res['memRealPercent'] = (floatval($res['memTotal']) != 0) ? round($res['memRealUsed'] / $res['memTotal'] * 100, 2) : 0; //真实内存使用率
    $res['memCachedPercent'] = (floatval($res['memCached']) != 0) ? round($res['memCached'] / $res['memTotal'] * 100, 2) : 0; //Cached内存使用率
    $res['swapTotal'] = round($buf[4][0] / 1024, 2);
    $res['swapFree'] = round($buf[5][0] / 1024, 2);
    $res['swapUsed'] = round($res['swapTotal'] - $res['swapFree'], 2);
    $res['swapPercent'] = (floatval($res['swapTotal']) != 0) ? round($res['swapUsed'] / $res['swapTotal'] * 100, 2) : 0;

    // LOAD AVG
    if (false === ($str = @file("/proc/loadavg")))
        return false;
    $str = explode(" ", implode("", $str));
    $str = array_chunk($str, 4);
    $res['loadAvg'] = implode(" ", $str[0]);

    return $res;
}

//FreeBSD系统探测
function sys_freebsd()
{
    //CPU
    if (false === ($res['cpu']['num'] = get_key("hw.ncpu")))
        return false;
    $res['cpu']['model'] = get_key("hw.model");
    //LOAD AVG
    if (false === ($res['loadAvg'] = get_key("vm.loadavg")))
        return false;
    //UPTIME
    if (false === ($buf = get_key("kern.boottime")))
        return false;
    $buf = explode(' ', $buf);
    $sys_ticks = time() - intval($buf[3]);
    $min = $sys_ticks / 60;
    $hours = $min / 60;
    $days = floor($hours / 24);
    $hours = floor($hours - ($days * 24));
    $min = floor($min - ($days * 60 * 24) - ($hours * 60));
    if ($days !== 0)
        $res['uptime'] = $days . " 天 ";
    if ($hours !== 0)
        $res['uptime'] .= $hours . " 小时 ";
    $res['uptime'] .= $min . " 分钟 ";

    //MEMORY
    if (false === ($buf = get_key("hw.physmem")))
        return false;
    $res['memTotal'] = round($buf / 1024 / 1024, 2);
    $str = get_key("vm.vmtotal");
    preg_match_all("/\nVirtual Memory[\:\s]*\(Total[\:\s]*([\d]+)K[\,\s]*Active[\:\s]*([\d]+)K\)\n/i", $str, $buff, PREG_SET_ORDER);
    preg_match_all("/\nReal Memory[\:\s]*\(Total[\:\s]*([\d]+)K[\,\s]*Active[\:\s]*([\d]+)K\)\n/i", $str, $buf, PREG_SET_ORDER);
    $res['memRealUsed'] = round($buf[0][2] / 1024, 2);
    $res['memCached'] = round($buff[0][2] / 1024, 2);
    $res['memUsed'] = round($buf[0][1] / 1024, 2) + $res['memCached'];
    $res['memFree'] = $res['memTotal'] - $res['memUsed'];
    $res['memPercent'] = (floatval($res['memTotal']) != 0) ? round($res['memUsed'] / $res['memTotal'] * 100, 2) : 0;
    $res['memRealPercent'] = (floatval($res['memTotal']) != 0) ? round($res['memRealUsed'] / $res['memTotal'] * 100, 2) : 0;
    return $res;
}

//取得参数值 FreeBSD
function get_key($keyName)
{
    return do_command('sysctl', "-n $keyName");
}

//确定执行文件位置 FreeBSD
function find_command($commandName)
{
    $path = array('/bin', '/sbin', '/usr/bin', '/usr/sbin', '/usr/local/bin', '/usr/local/sbin');
    foreach ($path as $p) {
        if (@is_executable("$p/$commandName"))
            return "$p/$commandName";
    }
    return false;
}

//执行系统命令 FreeBSD
function do_command($commandName, $args)
{
    $buffer = "";
    if (false === ($command = find_command($commandName)))
        return false;
    if ($fp = @popen("$command $args", 'r')) {
        while (!@feof($fp)) {
            $buffer .= @fgets($fp, 4096);
        }
        return trim($buffer);
    }
    return false;
}

//windows系统探测
function sys_windows()
{
    if (PHP_VERSION >= 5) {
        $objLocator = new COM("WbemScripting.SWbemLocator");
        $wmi = $objLocator->ConnectServer();
        $prop = $wmi->get("Win32_PnPEntity");
    } else {
        return false;
    }

    //CPU
    $cpuinfo = GetWMI($wmi, "Win32_Processor", array("Name", "L2CacheSize", "NumberOfCores"));
    $res['cpu']['num'] = $cpuinfo[0]['NumberOfCores'];
    if (null == $res['cpu']['num']) {
        $res['cpu']['num'] = 1;
    }
    /*
    for ($i=0;$i<$res['cpu']['num'];$i++)
    {
        $res['cpu']['model'] .= $cpuinfo[0]['Name']."<br />";
        $res['cpu']['cache'] .= $cpuinfo[0]['L2CacheSize']."<br />";
    }*/
    $cpuinfo[0]['L2CacheSize'] = ' (' . $cpuinfo[0]['L2CacheSize'] . ')';
    if ($res['cpu']['num'] == 1)
        $x1 = '';
    else
        $x1 = ' ×' . $res['cpu']['num'];
    $res['cpu']['model'] = $cpuinfo[0]['Name'] . $cpuinfo[0]['L2CacheSize'] . $x1;

    // SYSINFO
    $sysinfo = GetWMI($wmi, "Win32_OperatingSystem", array('LastBootUpTime', 'TotalVisibleMemorySize', 'FreePhysicalMemory', 'Caption', 'CSDVersion', 'SerialNumber', 'InstallDate'));
    $sysinfo[0]['Caption'] = iconv('GBK', 'UTF-8', $sysinfo[0]['Caption']);
    $sysinfo[0]['CSDVersion'] = iconv('GBK', 'UTF-8', $sysinfo[0]['CSDVersion']);
    $res['win_n'] = $sysinfo[0]['Caption'] . " " . $sysinfo[0]['CSDVersion'] . " 序列号:{$sysinfo[0]['SerialNumber']} 于" . date('Y年m月d日H:i:s', strtotime(substr($sysinfo[0]['InstallDate'], 0, 14))) . "安装";

    //UPTIME
    $res['uptime'] = $sysinfo[0]['LastBootUpTime'];
    $sys_ticks = 3600 * 8 + time() - strtotime(substr($res['uptime'], 0, 14));
    $min = $sys_ticks / 60;
    $hours = $min / 60;
    $days = floor($hours / 24);
    $hours = floor($hours - ($days * 24));
    $min = floor($min - ($days * 60 * 24) - ($hours * 60));
    if ($days !== 0)
        $res['uptime'] = $days . "天";
    if ($hours !== 0)
        $res['uptime'] .= $hours . "小时";
    $res['uptime'] .= $min . "分钟";

    //MEMORY
    $res['memTotal'] = round($sysinfo[0]['TotalVisibleMemorySize'] / 1024, 2);
    $res['memFree'] = round($sysinfo[0]['FreePhysicalMemory'] / 1024, 2);
    $res['memUsed'] = $res['memTotal'] - $res['memFree'];    //上面两行已经除以1024,这行不用再除了
    $res['memPercent'] = round($res['memUsed'] / $res['memTotal'] * 100, 2);
    $swapinfo = GetWMI($wmi, "Win32_PageFileUsage", array('AllocatedBaseSize', 'CurrentUsage'));

    // LoadPercentage
    $loadinfo = GetWMI($wmi, "Win32_Processor", array("LoadPercentage"));
    $res['loadAvg'] = $loadinfo[0]['LoadPercentage'];

    return $res;
}

function GetWMI($wmi, $strClass, $strValue = array())
{
    $arrData = array();
    $objWEBM = $wmi->Get($strClass);
    $arrProp = $objWEBM->Properties_;
    $arrWEBMCol = $objWEBM->Instances_();
    foreach ($arrWEBMCol as $objItem) {
        @reset($arrProp);
        $arrInstance = array();
        foreach ($arrProp as $propItem) {
            eval ("\$value = \$objItem->" . $propItem->Name . ";");
            if (empty($strValue)) {
                $arrInstance[$propItem->Name] = trim($value);
            } else {
                if (in_array($propItem->Name, $strValue)) {
                    $arrInstance[$propItem->Name] = trim($value);
                }
            }
        }
        $arrData[] = $arrInstance;
    }

    return $arrData;
}

//比例条
function bar($percent)
{
    ?>
    <div class="bar">
        <div class="barli" style="width:<?php echo $percent ?>%">&nbsp;</div>
    </div>
    <?php
}

$uptime = $sysInfo['uptime']; //在线时间
$stime = date('Y-m-d H:i:s'); //系统当前时间

//硬盘
$dt = round(@disk_total_space(".") / (1024 * 1024 * 1024), 3); //总
$df = round(@disk_free_space(".") / (1024 * 1024 * 1024), 3); //可用
$du = $dt - $df; //已用
$hdPercent = (floatval($dt) != 0) ? round($du / $dt * 100, 2) : 0;
$load = $sysInfo['loadAvg'];    //系统负载

//判断内存如果小于1G，就显示M，否则显示G单位
if ($sysInfo['memTotal'] < 1024) {
    $memTotal = $sysInfo['memTotal'] . " M";
    $mt = $sysInfo['memTotal'] . " M";
    $mu = $sysInfo['memUsed'] . " M";
    $mf = $sysInfo['memFree'] . " M";
    $mc = $sysInfo['memCached'] . " M";    //cache化内存
    $mb = $sysInfo['memBuffers'] . " M";    //缓冲
    $st = $sysInfo['swapTotal'] . " M";
    $su = $sysInfo['swapUsed'] . " M";
    $sf = $sysInfo['swapFree'] . " M";
    $swapPercent = $sysInfo['swapPercent'];
    $memRealUsed = $sysInfo['memRealUsed'] . " M"; //真实内存使用
    $memRealFree = $sysInfo['memRealFree'] . " M"; //真实内存空闲
    $memRealPercent = $sysInfo['memRealPercent']; //真实内存使用比率
    $memPercent = $sysInfo['memPercent']; //内存总使用率
    $memCachedPercent = $sysInfo['memCachedPercent']; //cache内存使用率
} else {
    $memTotal = round($sysInfo['memTotal'] / 1024, 3) . " G";
    $mt = round($sysInfo['memTotal'] / 1024, 3) . " G";
    $mu = round($sysInfo['memUsed'] / 1024, 3) . " G";
    $mf = round($sysInfo['memFree'] / 1024, 3) . " G";
    $mc = round($sysInfo['memCached'] / 1024, 3) . " G";
    $mb = round($sysInfo['memBuffers'] / 1024, 3) . " G";
    $st = round($sysInfo['swapTotal'] / 1024, 3) . " G";
    $su = round($sysInfo['swapUsed'] / 1024, 3) . " G";
    $sf = round($sysInfo['swapFree'] / 1024, 3) . " G";
    $swapPercent = $sysInfo['swapPercent'];
    $memRealUsed = round($sysInfo['memRealUsed'] / 1024, 3) . " G"; //真实内存使用
    $memRealFree = round($sysInfo['memRealFree'] / 1024, 3) . " G"; //真实内存空闲
    $memRealPercent = $sysInfo['memRealPercent']; //真实内存使用比率
    $memPercent = $sysInfo['memPercent']; //内存总使用率
    $memCachedPercent = $sysInfo['memCachedPercent']; //cache内存使用率
}

//网卡流量
$strs = @file("/proc/net/dev");

for ($i = 2; $i < count($strs); $i++) {
    preg_match_all("/([^\s]+):[\s]{0,}(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)/", $strs[$i], $info);
    $NetOutSpeed[$i] = $info[10][0];
    $NetInputSpeed[$i] = $info[2][0];
    $NetInput[$i] = formatsize($info[2][0]);
    $NetOut[$i] = formatsize($info[10][0]);
}
?>

<!DOCTYPE html
    PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title><?php echo $title; ?></title>
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="//cdn.bootcss.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
    <link
        href="data:image/png;base64,Qk02AwAAAAAAADYAAAAoAAAAEAAAABAAAAABABgAAAAAAAADAADEDgAAxA4AAAAAAAAAAAAAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICA19fX19fX19fXwICAwICAwICAwICAwICAwICAwICA19fX19fX19fXwICAwICAwICA19fXAAAA19fXwICAwICAwICAwICAwICAwICAwICA19fXAAAA19fXwICAwICAwICA19fXAAAA19fX19fXwICAwICA19fXwICAwICA19fX19fXAAAA19fX19fXwICAwICA19fXAAAAAAAAAAAA19fX19fXAAAA19fX19fXAAAA19fXAAAAAAAAAAAA19fX19fX19fXAAAA19fX19fXAAAA19fXAAAA19fX19fXAAAA19fXAAAA19fX19fXAAAA19fX19fXAAAA19fX19fXAAAA19fXAAAA19fX19fXAAAA19fXAAAA19fX19fXAAAA19fX19fXAAAA19fX19fXAAAA19fXAAAA19fX19fXAAAA19fXAAAA19fX19fXAAAA19fX19fXAAAAAAAAAAAA19fX19fXAAAAAAAAAAAA19fX19fXAAAAAAAAAAAA19fX19fXwICA19fX19fX19fXwICA19fXAAAA19fX19fXwICAwICA19fX19fX19fXwICAwICAwICAwICAwICAwICAwICA19fXAAAA19fXwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICA19fX19fX19fXwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICAwICA"
        type="image/x-icon" rel="icon" />
    <style type="text/css">
        <!--
        body {
            margin: 0 auto;
            padding: 0;
            background-color: #eee;
            font-size: 14px;
            font-family: Noto Sans CJK SC, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif;
        }

        a,
        input,
        button {
            outline: none !important;
            -webkit-appearance: none;
            border-radius: 0;
        }

        button::-moz-focus-inner,
        input::-moz-focus-inner {
            border-color: transparent !important;
        }

        :focus {
            border: none;
            outline: 0;
        }

        h1 {
            font-size: 26px;
            padding: 0;
            margin: 0;
            color: #333333;
        }

        h1 small {
            font-size: 11px;
            font-family: Tahoma;
            font-weight: bold;
        }

        a {
            color: #666;
            text-decoration: none;
        }

        a.black {
            color: #000000;
            text-decoration: none;
        }

        table {
            width: 100%;
            clear: both;
            padding: 0;
            margin: 0 0 18px;
            border-collapse: collapse;
            border-spacing: 0;
            box-shadow: 1px 1px 4px #999;
        }

        th {
            padding: 6px 12px;
            font-weight: bold;
            background: #9191c4;
            color: #000;
            border: 1px solid #9191c4;
            text-align: left;
            font-size: 16px;
            border-bottom: 0px;
            font-weight: normal;
        }

        tr {
            padding: 0;
            background: #FFFFFF;
        }

        td {
            padding: 3px 6px;
            border: 1px solid #CCCCCC;
        }

        #nav {
            height: 48px;
            font-size: 15px;
            background-color: #447;
            color: #fff !important;
            position: fixed;
            top: 0px;
            width: 100%;
            cursor: default;
        }

        .w_logo {
            height: 29px;
            padding: 9px 24px;
            display: inline-block;
            font-size: 18px;
            float: left;
        }

        .w_top {
            height: 24px;
            color: #fff;
            font-size: 15px;
            display: inline-block;
            padding: 12px 24px;
            transition: background-color 0.2s;
            float: left;
            cursor: default;
        }

        .w_top:hover {
            background: #0C2136;
        }

        .w_foot {
            height: 25px;
            text-align: center;
            background: #dedede;
        }

        input {
            padding: 2px;
            background: #FFFFFF;
            border: 1px solid #888;
            font-size: 12px;
            color: #000;
        }

        input:focus {
            border: 1px solid #666;
        }

        input.btn {
            line-height: 20px;
            padding: 6px 15px;
            color: #fff;
            background: #447;
            font-size: 12px;
            border: 0;
            transition: background-color 0.2s;
            box-shadow: 0 0 1px #888888;
        }

        input.btn:hover {
            background: #558;
        }

        .bar {
            border: 0;
            background: #ddd;
            height: 15px;
            font-size: 2px;
            width: 89%;
            margin: 2px 0 5px 0;
            overflow: hidden;
        }

        .barli_red {
            background: #d9534f;
            height: 15px;
            margin: 0px;
            padding: 0;
        }

        .barli_blue {
            background: #337ab7;
            height: 15px;
            margin: 0px;
            padding: 0;
        }

        .barli_green {
            background: #5cb85c;
            height: 15px;
            margin: 0px;
            padding: 0;
        }

        .barli_orange {
            background: #f0ad4e;
            height: 15px;
            margin: 0px;
            padding: 0;
        }

        .barli_blue2 {
            background: #5bc0de;
            height: 15px;
            margin: 0px;
            padding: 0;
        }

        #page {
            max-width: 1080px;
            padding: 0 auto;
            margin: 80px auto 0;
            text-align: left;
        }

        #header {
            position: relative;
            padding: 5px;
        }

        .w_small {
            font-family: Courier New;
        }

        .w_number {
            color: #177BBE;
        }

        .sudu {
            padding: 0;
            background: #5dafd1;
        }

        .suduk {
            margin: 0px;
            padding: 0;
        }

        .resYes {}

        .resNo {
            color: #FF0000;
        }

        .word {
            word-break: break-all;
        }

        @media screen and (max-width: 1180px) {
            #page {
                margin: 80px 50px 0;
            }
        }

        </style><script language="JavaScript" type="text/javascript" src="https://cdn.staticfile.org/jquery/1.10.0/jquery.min.js"></script></head><body><a name="w_top"></a><div id="nav"><div style="display: inline-block"><div class="w_logo"><span>PHP探针</span></div></div><div style="display: inline-block"><a class="w_top" onclick="$('body,html').animate({ scrollTop: 0 }, 200);"><i class="fa fa-tasks"></i>服务器信息</a><a class="w_top" onclick="$('body,html').animate({ scrollTop: $('#w_php').offset().top }, 200);"><i class="fa fa-tags"></i>PHP参数</a><a class="w_top" onclick="$('body,html').animate({ scrollTop: $('#w_module').offset().top }, 200);"><i class="fa fa-cogs"></i>组件支持</a><a class="w_top" onclick="$('body,html').animate({ scrollTop: $('#w_module_other').offset().top }, 200);"><i class="fa fa-cubes"></i>第三方组件</a><a class="w_top" onclick="$('body,html').animate({ scrollTop: $('#w_db').offset().top }, 200);"><i class="fa fa-database"></i>数据库支持</a><a class="w_top" onclick="$('body,html').animate({ scrollTop: $('#w_performance').offset().top }, 200);"><i class="fa fa-tachometer"></i>性能检测</a></div></div><div id="page">< !--服务器相关参数
        -->
    <table>
        <tr>
            <th colspan="4"><i class="fa fa-tasks"></i> 服务器参数</th>
        </tr>
        <tr>
            <td>服务器域名/IP地址</td>
            <td colspan="3">
                <?php echo $_SERVER['SERVER_NAME']; ?>(<?php if ('/' == DIRECTORY_SEPARATOR) {
                      echo $_SERVER['SERVER_ADDR'];
                  } else {
                      echo @gethostbyname($_SERVER['SERVER_NAME']);
                  } ?>)&nbsp;&nbsp;你的
                IP 地址是：<?php echo @$_SERVER['REMOTE_ADDR']; ?></td>
        </tr>

        <tr>
            <td>服务器标识</td>
            <td colspan="3"><?php echo php_uname(); ?></td>
        </tr>

        <tr>
            <td width="13%">服务器操作系统</td>
            <td width="40%"><?php echo get_os(); ?> &nbsp;内核版本：<?php echo php_uname('r'); ?></td>
            <td width="13%">服务器解译引擎</td>
            <td width="34%"><?php echo $_SERVER['SERVER_SOFTWARE']; ?></td>
        </tr>

        <tr>
            <td>服务器主机名</td>
            <td><?php echo php_uname('n') ?></td>
            <td>绝对路径</td>
            <td><?php echo $_SERVER['DOCUMENT_ROOT'] ? str_replace('\\', '/', $_SERVER['DOCUMENT_ROOT']) : str_replace('\\', '/', dirname(__FILE__)); ?>
            </td>
        </tr>

        <tr>
            <td>服务器端口</td>
            <td><?php echo $_SERVER['SERVER_PORT']; ?></td>
            <td>探针路径</td>
            <td><?php echo str_replace('\\', '/', __FILE__) ? str_replace('\\', '/', __FILE__) : $_SERVER['SCRIPT_FILENAME']; ?>
            </td>
        </tr>
    </table>

    <? if ("show" == $sysReShow) { ?>
        <table>
            <tr>
                <th colspan="6"><i class="fa fa-area-chart"></i> 服务器实时数据</th>
            </tr>

            <tr>
                <td width="13%">服务器当前时间</td>
                <td width="40%"><span id="stime"><?php echo $stime; ?></span></td>
                </td>
                <td width="34%" colspan="3"><span id="uptime"><?php echo $uptime; ?></span></td>
            </tr>
            <tr>
                <td width="13%">CPU 型号 [<?php echo $sysInfo['cpu']['num']; ?>核]</td>
                <td width="87%" colspan="5"><?php echo $sysInfo['cpu']['model']; ?></td>
            </tr>
            <tr>
                <td>CPU使用状况</td>
                <td colspan="5">
                    <?php if ('/' == DIRECTORY_SEPARATOR) {
                        echo $cpu_show . " | <a href='" . $phpSelf . "?act=cpu_percentage' target='_blank' class='static'>";
                    } else {
                        echo "暂时只支持Linux系统";
                    } ?>
                </td>
            </tr>
            <tr>
                <td>硬盘使用状况</td>
                <td colspan="5">
                    总空间 <?php echo $dt; ?>&nbsp;G，
                    已用 <font color='#333333'><span id="useSpace"><?php echo $du; ?></span></font>&nbsp;G，
                    空闲 <font color='#333333'><span id="freeSpace"><?php echo $df; ?></span></font>&nbsp;G，
                    使用率 <span id="hdPercent"><?php echo $hdPercent; ?></span>%
                    <div class="bar">
                        <div id="barhdPercent" class="barli_orange" style="width:<?php echo $hdPercent; ?>%">&nbsp;</div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>内存使用状况</td>
                <td colspan="5">
                    <?php
                    $tmp = array(
                        'memTotal',
                        'memUsed',
                        'memFree',
                        'memPercent',
                        'memCached',
                        'memRealPercent',
                        'swapTotal',
                        'swapUsed',
                        'swapFree',
                        'swapPercent'
                    );
                    foreach ($tmp as $v) {
                        $sysInfo[$v] = $sysInfo[$v] ? $sysInfo[$v] : 0;
                    }
                    ?>
                    物理内存：共
                    <font color='#CC0000'><?php echo $memTotal; ?> </font>
                    , 已用
                    <font color='#CC0000'><span id="UsedMemory"><?php echo $mu; ?></span></font>
                    , 空闲
                    <font color='#CC0000'><span id="FreeMemory"><?php echo $mf; ?></span></font>
                    , 使用率
                    <span id="memPercent"><?php echo $memPercent; ?></span>
                    <div class="bar">
                        <div id="barmemPercent" class="barli_green" style="width:<?php echo $memPercent ?>%">&nbsp;</div>
                    </div>
                    <?php
                    //判断如果cache为0，不显示
                    if ($sysInfo['memCached'] > 0) {
                        ?>
                        Cache化内存为 <span id="CachedMemory"><?php echo $mc; ?></span>
                        , 使用率
                        <span id="memCachedPercent"><?php echo $memCachedPercent; ?></span>
                        % | Buffers缓冲为 <span id="Buffers"><?php echo $mb; ?></span>
                        <div class="bar">
                            <div id="barmemCachedPercent" class="barli_blue" style="width:<?php echo $memCachedPercent ?>%">
                                &nbsp;</div>
                        </div>
                        真实内存使用
                        <span id="memRealUsed"><?php echo $memRealUsed; ?></span>
                        , 真实内存空闲
                        <span id="memRealFree"><?php echo $memRealFree; ?></span>
                        , 使用率
                        <span id="memRealPercent"><?php echo $memRealPercent; ?></span>
                        %
                        <div class="bar">
                            <div id="barmemRealPercent" class="barli_blue2" style="width:<?php echo $memRealPercent ?>%">&nbsp;
                            </div>
                        </div>
                        <?php
                    }
                    //判断如果SWAP区为0，不显示
                    if ($sysInfo['swapTotal'] > 0) {
                        ?>
                        SWAP区：共
                        <?php echo $st; ?>
                        , 已使用
                        <span id="swapUsed"><?php echo $su; ?></span>
                        , 空闲
                        <span id="swapFree"><?php echo $sf; ?></span>
                        , 使用率
                        <span id="swapPercent"><?php echo $swapPercent; ?></span>
                        %
                        <div class="bar">
                            <div id="barswapPercent" class="barli_red" style="width:<?php echo $swapPercent ?>%">&nbsp;</div>
                        </div>

                        <?php
                    }
                    ?>
                </td>
            </tr>

            <tr>
                <td>系统平均负载</td>
                <td colspan="5" class="w_number"><span id="loadAvg"><?php echo $load; ?></span></td>
            </tr>
        </table>
    <? } ?>

    <?php if (false !== ($strs = @file("/proc/net/dev"))): ?>
        <table>
            <tr>
                <th colspan="5"><i class="fa fa-bar-chart"></i> 网络使用状况</th>
            </tr>
            <?php for ($i = 2; $i < count($strs); $i++): ?>
                <?php preg_match_all("/([^\s]+):[\s]{0,}(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)/", $strs[$i], $info); ?>
                <tr>
                    <td width="13%"><?php echo $info[1][0] ?> : </td>
                    <td width="29%">入网: <font color='#CC0000'><span
                                id="NetInput<?php echo $i ?>"><?php echo $NetInput[$i] ?></span></font>
                    </td>
                    <td width="14%">实时: <font color='#CC0000'><span id="NetInputSpeed<?php echo $i ?>">0B/s</span></font>
                    </td>
                    <td width="29%">出网: <font color='#CC0000'><span id="NetOut<?php echo $i ?>"><?php echo $NetOut[$i] ?></span>
                        </font>
                    </td>
                    <td width="14%">实时: <font color='#CC0000'><span id="NetOutSpeed<?php echo $i ?>">0B/s</span></font>
                    </td>
                </tr>

            <?php endfor; ?>
        </table>
    <?php endif; ?>

    <table width="100%" cellpadding="3" cellspacing="0" align="center">
        <tr>
            <th colspan="4"><i class="fa fa-download "></i> PHP 已编译模块检测</th>
        </tr>
        <tr>
            <td colspan="4"><span class="w_small">
                    <?php
                    $exts = get_loaded_extensions();
                    array_multisort($exts);
                    foreach ($exts as $key => $ext) {
                        if ($key != 0 && $key % 12 == 0) {
                            echo '<br />';
                        }
                        echo "$ext&nbsp;&nbsp;";
                    }
                    ?>
                </span>
            </td>
        </tr>
    </table>

    <a name="w_php" id="w_php" style="position:relative;top:-60px;"></a>
    <table>
        <tr>
            <th colspan="4"><i class="fa fa-tags"></i> PHP 参数</th>
        </tr>
        <tr>
            <td width="30%">PHP 信息(phpinfo)</td>
            <td width="20%">
                <?php
                $phpSelf = $_SERVER['PHP_SELF'] ? $_SERVER['PHP_SELF'] : $_SERVER['SCRIPT_NAME'];
                $disFuns = get_cfg_var("disable_functions");
                ?>
                <?php echo (false !== preg_match("phpinfo", $disFuns)) ? '<font color="red"><i class="fa fa-times"></i></font>' : "<a href='$phpSelf?act=phpinfo' target='_blank'>PHPINFO <i class=\"fa fa-external-link\"></i></a>"; ?>
            </td>
            <td width="30%">PHP 版本(php_version)</td>
            <td width="20%"><?php echo PHP_VERSION; ?></td>
        </tr>

        <tr>
            <td>PHP 运行方式</td>
            <td><?php echo strtoupper(php_sapi_name()); ?></td>
            <td>脚本占用最大内存(memory_limit)</td>
            <td><?php echo show("memory_limit"); ?></td>
        </tr>

        <tr>
            <td>PHP 安全模式(safe_mode)</td>
            <td><?php echo show("safe_mode"); ?></td>
            <td>POST 方法提交最大限制(post_max_size)</td>
            <td><?php echo show("post_max_size"); ?></td>
        </tr>

        <tr>
            <td>上传文件最大限制(upload_max_filesize)</td>
            <td><?php echo show("upload_max_filesize"); ?></td>
            <td>浮点型数据显示的有效位数(precision)</td>
            <td><?php echo show("precision"); ?></td>
        </tr>

        <tr>
            <td>脚本超时时间(max_execution_time)</td>
            <td><?php echo show("max_execution_time"); ?>秒</td>
            <td>socket 超时时间(default_socket_timeout)</td>
            <td><?php echo show("default_socket_timeout"); ?>秒</td>
        </tr>

        <tr>
            <td>PHP 页面根目录(doc_root)</td>
            <td><?php echo show("doc_root"); ?></td>
            <td>用户根目录(user_dir)</td>
            <td><?php echo show("user_dir"); ?></td>
        </tr>

        <tr>
            <td>dl() 函数(enable_dl)</td>
            <td><?php echo show("enable_dl"); ?></td>
            <td>指定包含文件目录(set_include_path)</td>
            <td><?php echo show("set_include_path"); ?></td>
        </tr>

        <tr>
            <td>显示错误信息(display_errors)</td>
            <td><?php echo show("display_errors"); ?></td>
            <td>自定义全局变量(register_globals)</td>
            <td><?php echo show("register_globals"); ?></td>
        </tr>

        <tr>
            <td>数据反斜杠转义(magic_quotes_gpc)</td>
            <td><?php echo show("magic_quotes_gpc"); ?></td>
            <td>"&lt;?...?&gt;"短标签(short_open_tag)</td>
            <td><?php echo show("short_open_tag"); ?></td>
        </tr>

        <tr>
            <td>"&lt;% %&gt;"ASP 风格标记(asp_tags)</td>
            <td><?php echo show("asp_tags"); ?></td>
            <td>忽略重复错误信息(ignore_repeated_errors)</td>
            <td><?php echo show("ignore_repeated_errors"); ?></td>
        </tr>

        <tr>
            <td>忽略重复的错误源(ignore_repeated_source)</td>
            <td><?php echo show("ignore_repeated_source"); ?></td>
            <td>报告内存泄漏(report_memleaks)</td>
            <td><?php echo show("report_memleaks"); ?></td>
        </tr>

        <tr>
            <td>自动字符串转义(magic_quotes_gpc)</td>
            <td><?php echo show("magic_quotes_gpc"); ?></td>
            <td>外部字符串自动转义(magic_quotes_runtime)</td>
            <td><?php echo show("magic_quotes_runtime"); ?></td>
        </tr>

        <tr>
            <td>打开远程文件(allow_url_fopen)</td>
            <td><?php echo show("allow_url_fopen"); ?></td>
            <td>声明 argv 和 argc 变量(register_argc_argv)</td>
            <td><?php echo show("register_argc_argv"); ?></td>
        </tr>

        <tr>
            <td>Cookie 支持</td>
            <td><?php echo isset($_COOKIE) ? '<font color="green"><i class="fa fa-check"></i></font>' : '<font color="red"><i class="fa fa-times"></i></font>'; ?>
            </td>
            <td>拼写检查(PSpell Check)</td>
            <td><?php echo isfun("pspell_check"); ?></td>
        </tr>

        <tr>
            <td>高精度数学运算(BCMath)</td>
            <td><?php echo isfun("bcadd"); ?></td>
            <td>PREL 相容语法(PCRE)</td>
            <td><?php echo isfun("preg_match"); ?></td>
        </tr>

        <tr>
            <td>PDF 文档支持</td>
            <td><?php echo isfun("pdf_close"); ?></td>
            <td>SNMP 网络管理协议</td>
            <td><?php echo isfun("snmpget"); ?></td>
        </tr>

        <tr>
            <td>VMailMgr 邮件处理</td>
            <td><?php echo isfun("vm_adduser"); ?></td>
            <td>Curl</td>
            <td><?php //echo is_ext("curl"); ?></td>
            <td><?php print_r(curl_version()); ?></td>
        </tr>

        <tr>
            <td>SMTP </td>
            <td><?php echo get_cfg_var("SMTP") ? '<font color="green"><i class="fa fa-check"></i></font>' : '<font color="red"><i class="fa fa-times"></i></font>'; ?>
            </td>
            <td>SMTP 地址</td>
            <td><?php echo get_cfg_var("SMTP") ? get_cfg_var("SMTP") : '<font color="red"><i class="fa fa-times"></i></font>'; ?>
            </td>
        </tr>

        <tr>
            <td>默认支持函数(enable_functions)</td>
            <td colspan="3"><a href='<?php echo $phpSelf; ?>?act=Function' target='_blank' class='static'>查看详细 <i
                        class="fa fa-external-link"></i></a></td>
        </tr>

        <tr>
            <td>被禁用的函数(disable_functions)</td>
            <td colspan="3" class="word">
                <?php
                $disFuns = get_cfg_var("disable_functions");
                if (empty($disFuns)) {
                    echo '<font color=red><i class="fa fa-times"></i></font>';
                } else {
                    //echo $disFuns;
                    $disFuns_array = explode(',', $disFuns);
                    foreach ($disFuns_array as $key => $value) {
                        if ($key != 0 && $key % 6 == 0) {
                            echo '<br />';
                        }
                        echo "$value&nbsp;&nbsp;";
                    }
                }
                ?>
            </td>
        </tr>
    </table>

    <a name="w_module" id="w_module" style="position:relative;top:-60px;"></a>
    <!--组件信息-->
    <table>
        <tr>
            <th colspan="4"><i class="fa fa-cogs"></i> 组件支持</th>
        </tr>
        <tr>
            <td width="30%">PHP JIT</td>
            <td width="20%">
                <?php if (isset(opcache_get_status()['jit']['enabled']) && opcache_get_status()['jit']['enabled'] == true) {
                    echo is_enable(true);
                } else {
                    echo is_enable(false);
                } ?>
            </td>
            <td width="30%">JSON 解析</td>
            <td width="20%"><?php echo is_ext("json"); ?></td>
        </tr>
        <tr>
            <td width="30%">FTP </td>
            <td width="20%"><?php echo isfun("ftp_login"); ?></td>
            <td width="30%">XML 解析</td>
            <td width="20%"><?php echo isfun("xml_set_object"); ?></td>
        </tr>

        <tr>
            <td>Session </td>
            <td><?php echo isfun("session_start"); ?></td>
            <td>Socket </td>
            <td><?php echo isfun("socket_accept"); ?></td>
        </tr>

        <tr>
            <td>Calendar </td>
            <td><?php echo isfun('cal_days_in_month'); ?></td>
            <td>允许 URL 打开文件</td>
            <td><?php echo show("allow_url_fopen"); ?></td>
        </tr>

        <tr>
            <td>GD 库</td>
            <td><?php echo is_ext('gd', gd_info()['GD Version']); ?></td>
            <td>压缩文件(Zlib)</td>
            <td><?php echo isfun("gzclose"); ?></td>
        </tr>

        <tr>
            <td>IMAP 电子邮件系统函数库</td>
            <td><?php echo isfun("imap_close"); ?></td>
            <td>历法运算函数库</td>
            <td><?php echo isfun("jdtogregorian"); ?></td>
        </tr>

        <tr>
            <td>正则表达式函数库</td>
            <td><?php echo isfun("preg_match"); ?></td>
            <td>WDDX</td>
            <td><?php echo isfun("wddx_add_vars"); ?></td>
        </tr>

        <tr>
            <td>iconv 编码转换</td>
            <td><?php echo isfun("iconv"); ?></td>
            <td>mbstring</td>
            <td><?php echo is_ext("mbstring"); ?></td>
        </tr>

        <tr>
            <td>BCMath 高精度数学运算</td>
            <td><?php echo isfun("bcadd"); ?></td>
            <td>LDAP 目录协议</td>
            <td><?php echo isfun("ldap_close"); ?></td>
        </tr>

        <tr>
            <td>OpenSSL 加密处理</td>
            <td><?php echo isfun("openssl_open"); ?></td>
            <td>Mhash 哈稀计算</td>
            <td><?php echo isfun("mhash_count"); ?></td>
        </tr>
    </table>

    <a name="w_module_other" id="w_module_other" style="position:relative;top:-60px;"></a>
    <table>
        <tr>
            <th colspan="4"><i class="fa fa-cubes"></i> 第三方组件</th>
        </tr>
        <tr>
            <td width="20%">Zend</td>
            <td width="30%"><?php is_func('zend_version', 'zend_version'); ?></td>
            <td width="20%">
                <?php
                $PHP_VERSION = PHP_VERSION;
                $PHP_VERSION = substr($PHP_VERSION, 0, 1);
                if ($PHP_VERSION > 2) {
                    echo "Zend Guard Loader";
                } else {
                    echo "Zend Optimizer";
                }
                ?>
            </td>
            <td width="30%">
                <?php if ($PHP_VERSION > 2) {
                    if (function_exists("zend_loader_version")) {
                        echo "<font color=green><i class=\"fa fa-check\"></i></font>　Ver ";
                        echo zend_loader_version();
                    } else {
                        echo "<font color=red><i class=\"fa fa-times\"></i></font>";
                    }
                } else {
                    if (function_exists('zend_optimizer_version')) {
                        echo "<font color=green><i class=\"fa fa-check\"></i></font>　Ver ";
                        echo zend_optimizer_version();
                    } else {
                        echo (get_cfg_var("zend_optimizer.optimization_level") || get_cfg_var("zend_extension_manager.optimizer_ts") || get_cfg_var("zend.ze1_compatibility_mode") || get_cfg_var("zend_extension_ts")) ? '<font color=green><i class="fa fa-check"></i></font>' : '<font color=red><i class="fa fa-times"></i></font>';
                    }
                } ?>
            </td>
        </tr>

        <tr>
            <td>eAccelerator</td>
            <td><?php echo is_ext('eAccelerator') ?></td>
            <td>ionCube Loader</td>
            <td><?php echo is_ext('ionCube Loader') ?></td>
        </tr>

        <tr>
            <td>Zend OPcache</td>
            <td><?php echo is_ext('Zend OPcache'); ?>
            <td>Redis</td>
            <td><?php echo is_ext('Redis') ?></td>
        </tr>
        <tr>
            <td>XCache</td>
            <td><?php echo is_ext('XCache') ?></td>
            <td>Swoole</td>
            <td><?php echo is_ext('swoole'); ?>
        </tr>
        <tr>
            <td>mongodb</td>
            <td><?php echo is_ext('mongodb') ?></td>
            <td>Memcached</td>
            <td><?php echo is_ext('memcached'); ?>
        </tr>
        <tr>
            <td>amqp</td>
            <td><?php echo is_ext('amqp') ?></td>
            <td>Kafaka</td>
            <td><?php echo is_ext('rdkafka'); ?>
        </tr>
        <tr>
            <td>FFI</td>
            <td><?php echo is_ext('FFI') ?></td>
            <td>xhprof</td>
            <td><?php echo is_ext('xhprof'); ?>
        </tr>
        <tr>
            <td>Yaf</td>
            <td><?php echo is_ext('yaf') ?></td>
            <td>Yac</td>
            <td><?php echo is_ext('yac'); ?>
        </tr>
        <tr>
            <td>XDebug</td>
            <td><?php echo is_ext('xdebug') ?></td>
            <td>Phalcon</td>
            <td><?php echo is_ext('phalcon'); ?>
        </tr>
        <tr>
            <td>Source Guardian</td>
            <td><?php echo is_ext('sourceguardian') ?></td>
            <td>APCu</td>
            <td><?php echo is_ext('apcu'); ?>
        </tr>
    </table>

    <a name="w_db" id="w_db" style="position:relative;top:-60px;"></a>
    <table>
        <tr>
            <th colspan="4"><i class="fa fa-database"></i> 数据库</th>
        </tr>

        <tr>
            <td width="30%">MYSQL PDO</td>
            <td width="20%"><?php echo is_ext("pdo_mysql"); ?></td>
            <td width="30%">MySQLND</td>
            <td width="20%"><?php echo is_ext('mysqlnd'); ?></td>
        </tr>
        <tr>
            <td width="30%">MySQLi</td>
            <td width="20%"><?php echo is_ext('mysqli'); ?></td>
            <td width="30%">ODBC PDO</td>
            <td width="20%"><?php echo is_ext("PDO_ODBC"); ?></td>
        </tr>

        <tr>
            <td>Oracle OCI8</td>
            <td><?php echo isfun("oci_close"); ?></td>
            <td>SQL Server</td>
            <td><?php echo isfun("mssql_close"); ?></td>
        </tr>

        <tr>
            <td>dBASE</td>
            <td><?php echo isfun("dbase_close"); ?></td>
            <td>mSQL</td>
            <td><?php echo isfun("msql_close"); ?></td>
        </tr>

        <tr>
            <td>SQLite3</td>
            <td><?php echo is_ext('sqlite3'); ?></td>
            <td>SQLite PDO</td>
            <td><?php echo is_ext('pdo_sqlite'); ?></td>
        </tr>
        <tr>
            <td>DBLib</td>
            <td><?php echo is_ext("pdo_dblib"); ?></td>
            <td>Hyperwave</td>
            <td><?php echo isfun("hw_close"); ?></td>
        </tr>

        <tr>
            <td>Postgre SQL</td>
            <td><?php echo is_ext("pdo_pgsql"); ?></td>
            <td>Postgre SQL PDO</td>
            <td><?php echo is_ext("pdo_pgsql"); ?></td>
        </tr>
        <tr>
            <td>Informix</td>
            <td><?php echo isfun("ifx_close"); ?></td>
            <td>Memcached</td>
            <td><?php echo is_ext("memcached"); ?></td>
        </tr>

        <tr>
            <td>DBA</td>
            <td><?php echo is_ext("dba"); ?></td>
            <td>DBM</td>
            <td><?php echo isfun("dbmclose"); ?></td>
        </tr>

        <tr>
            <td>FilePro</td>
            <td><?php echo isfun("filepro_fieldcount"); ?></td>
            <td>SyBase</td>
            <td><?php echo isfun("sybase_close"); ?></td>
        </tr>
    </table>

    <a name="w_MySQL" style="position:relative;top:-60px;"></a>

    <!--MySQL数据库连接检测-->
    <table>

        <tr>
            <th colspan="3"><i class="fa fa-link"></i> MySQL数据库连接检测</th>
        </tr>

        <tr>
            <td width="15%"></td>
            <td width="60%">
                地址：<input type="text" name="host" value="localhost" size="10" />
                端口：<input type="text" name="port" value="3306" size="10" />
                用户名：<input type="text" name="login" size="10" />
                密码：<input type="password" name="password" size="10" />
            </td>
            <td width="25%">
                <input class="btn" type="submit" name="act" value="MySQL检测" />
            </td>
        </tr>
    </table>
    <?php
    if (isset($_POST['act']) && $_POST['act'] == 'MySQL检测') {
        if (class_exists("mysqli")) {

            $link = new mysqli($host, $login, $password, 'information_schema', $port);
            if ($link) {
                echo "<script>alert('连接到MySql数据库正常')</script>";
            } else {
                echo "<script>alert('无法连接到MySql数据库！')</script>";
            }
        } else {
            echo "<script>alert('服务器不支持MySQL数据库！')</script>";
        }
    }
    ?>

    <a name="w_function" style="position:relative;top:-60px;"></a>
    <!--函数检测-->
    <table>

        <tr>
            <th colspan="3"><i class="fa fa-code"></i> 函数检测</th>
        </tr>

        <tr>
            <td width="15%"></td>
            <td width="60%">
                请输入您要检测的函数：
                <input type="text" name="funName" size="50" />
            </td>
            <td width="25%">
                <input class="btn" type="submit" name="act" align="right" value="函数检测" />
            </td>
        </tr>

        <?php
        if (isset($_POST['act']) && $_POST['act'] == '函数检测') {
            echo "<script>alert('$funRe')</script>";
        }
        ?>
    </table>

    <a name="w_mail" style="position:relative;top:-60px;"></a>
    <!--邮件发送检测-->
    <table>
        <tr>
            <th colspan="3"><i class="fa fa-envelope-o "></i> 邮件发送检测</th>
        </tr>
        <tr>
            <td width="15%"></td>
            <td width="60%">
                请输入您要检测的邮件地址：
                <input type="text" name="mailAdd" size="50" />
            </td>
            <td width="25%">
                <input class="btn" type="submit" name="act" value="邮件检测" />
            </td>
        </tr>
        <?php
        if (isset($_POST['act']) && $_POST['act'] == '邮件检测') {
            echo "<script>alert('$mailRe')</script>";
        }
        ?>
    </table>
    </form>
    <table>
        <tr>
            <td class="w_foot">Base YaHei</a></td>
            <td class="w_foot"><?php $run_time = sprintf('%0.4f', microtime_float() - $time_start); ?>Processed in
                <?php echo $run_time ?> seconds. <?php echo memory_usage(); ?> memory usage.</td>
            <td class="w_foot"><a href="#w_top">返回顶部</a></td>
        </tr>
    </table>
    </div>
    </body>

</html>