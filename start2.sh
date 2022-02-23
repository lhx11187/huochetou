#


apt install ssh curl wget npm nginx nano bash tmux qbittorrent-nox htop net-tools zip unzip rclone aria2 -y
wget -c -O /root/v2ray-linux-64.zip https://github.com/v2fly/v2ray-core/releases/download/v4.43.0/v2ray-linux-64.zip
unzip /root/v2ray-linux-64.zip -d /root/v2ray
wget https://raw.githubusercontent.com/lhx11187/huochetou/main/v2ray.json -O /root/v2ray/config.json
wget https://raw.githubusercontent.com/lhx11187/huochetou/main/v2ray.json -O /root/v2ray/config.json
echo 'cd /root/v2ray && ./start.sh >/dev/null 2>&1 &' >>/root/start.sh
echo 'killall -9 v2ray' >>/root/v2ray/start.sh
echo 'nohup ./v2ray &' >>/root/v2ray/start.sh
chmod 755 /root/v2ray/v2ray
chmod 755 /root/v2ray/start.sh

wget -c -O /root/verysync-linux-amd64-v2.13.2.tar.gz http://dl-cn.verysync.com/releases/v2.13.2/verysync-linux-amd64-v2.13.2.tar.gz
cd /root && tar -zxvf verysync-linux-amd64-v2.13.2.tar.gz
mv /root/verysync-linux-amd64-v2.13.2 /root/verysync
wget -c -O /root/linux-amd64-webdav.tar.gz https://github.com/hacdias/webdav/releases/download/v4.1.1/linux-amd64-webdav.tar.gz
cd /root && mkdir webdav && tar -zxvf linux-amd64-webdav.tar.gz -C /root/webdav/

echo 'cd /root/verysync' >>/root/verysync/start.sh
echo 'killall -9 verysync' >>/root/verysync/start.sh
echo './verysync -gui-address 0.0.0.0:8886 -no-browser -no-restart -logflags=0 >/dev/null 2>&1 &' >>/root/verysync/start.sh
echo 'killall -9 webdav' >>/root/webdav/start.sh
echo './webdav -c ./config.yaml &' >>/root/webdav/start.sh

chmod 755 /root/verysync/verysync
chmod 755 /root/webdav/webdav
chmod 755 /root/verysync/start.sh
chmod 755 /root/webdav/start.sh

#killall -9 qbittorrent-nox
#killall -9 verysync 
#killall -9 filebrowser 
#service nginx restart 

killall -9 v2ray
cd /root/v2ray && ./start.sh >/dev/null 2>&1 &

mkdir /root/filebrowser &
wget -c -O /root/linux-amd64-filebrowser.tar.gz https://github.com/filebrowser/filebrowser/releases/download/v2.19.0/linux-amd64-filebrowser.tar.gz
cd /root/filebrowser && tar -zxvf /root/linux-amd64-filebrowser.tar.gz
chmod 755 /root/filebrowser/filebrowser
#cd /root/filebrowser && /root/filebrowser/filebrowser -p 8081 &

wget -c -O /root/frp_0.38.0_linux_amd64.tar.gz https://github.com/fatedier/frp/releases/download/v0.38.0/frp_0.38.0_linux_amd64.tar.gz
cd /root && tar -zxvf /root/frp_0.38.0_linux_amd64.tar.gz
mv /root/frp_0.38.0_linux_amd64 /root/frp
wget -c -O /root/frp/www.haoren.eu.org.ini https://raw.githubusercontent.com/lhx11187/huochetou/main/www.haoren.eu.org.ini
chmod 755 /root/frp/frpc
cd /root/frp && ./frpc -c ./www.haoren.eu.org.ini >/dev/null 2>&1 &

#aria2

apt-get install aria2
mkdir ~/.aria2
mkdir ~/download
touch ~/.aria2/aria2.session
chmod 777 ~/.aria2/aria2.session
cat ~/.aria2/aria2.conf<<EOF
## 全局设置 ## ============================================================
# 日志
#log-level=warn
#log=/root/.aria2/aria2.log

# 后台运行
#daemon=true

# 下载位置, 默认: 当前启动位置(***)
dir=/root/Downloads/

# 从会话文件中读取下载任务(***) 都用绝对路径
input-file=/root/.aria2/aria2.session

# 在Aria2退出时保存`错误/未完成`的下载任务到会话文件(***)
save-session=/root/.aria2/aria2.session

# 定时保存会话, 0为退出时才保存, 需1.16.1以上版本, 默认:0
save-session-interval=30

# 断点续传
continue=true

# 启用磁盘缓存, 0为禁用缓存, 需1.16以上版本, 默认:16M
#disk-cache=32M

# 文件预分配方式, 能有效降低磁盘碎片, 默认:prealloc
# 预分配所需时间: none < falloc ? trunc < prealloc
# falloc和trunc则需要文件系统和内核支持
# NTFS建议使用falloc, EXT3/4建议trunc, MAC 下需要注释此项
file-allocation=none
# 客户端伪装
user-agent=netdisk;5.2.6;PC;PC-Windows;6.2.9200;WindowsBaiduYunGuanJia
referer=http://pan.baidu.com/disk/home

# 禁用IPv6, 默认:false
disable-ipv6=false

# 其他
always-resume=true
check-integrity=true

## 下载位置 ## ============================================================
# 最大同时下载任务数, 运行时可修改, 默认:5
max-concurrent-downloads=10

# 同一服务器连接数, 添加时可指定, 默认:1
max-connection-per-server=10

# 最小文件分片大小, 添加时可指定, 取值范围1M -1024M, 默认:20M
# 假定size=10M, 文件为20MiB 则使用两个来源下载; 文件为15MiB 则使用一个来源下载
min-split-size=10M

# 单个任务最大线程数, 添加时可指定, 默认:5
split=5

# 整体下载速度限制, 运行时可修改, 默认:0
#max-overall-download-limit=0

# 单个任务下载速度限制, 默认:0
#max-download-limit=0

# 整体上传速度限制, 运行时可修改, 默认:0
#max-overall-upload-limit=0

# 单个任务上传速度限制, 默认:0
#max-upload-limit=0

## RPC设置 ## ============================================================
# 启用RPC, 默认:false
enable-rpc=true

# 允许所有来源, 默认:false
rpc-allow-origin-all=true

# 允许非外部访问, 默认:false
rpc-listen-all=true

# 事件轮询方式, 取值:[epoll, kqueue, port, poll, select], 不同系统默认值不同
#event-poll=select

# RPC监听端口, 端口被占用时可以修改, 默认:6800
rpc-listen-port=6800

# 设置的RPC授权令牌, v1.18.4新增功能, 取代 --rpc-user 和 --rpc-passwd 选项
#rpc-secret=<TOKEN>

# 是否启用 RPC 服务的 SSL/TLS 加密,
# 启用加密后 RPC 服务需要使用 https 或者 wss 协议连接
#rpc-secure=true

# 在 RPC 服务中启用 SSL/TLS 加密时的证书文件,
# 使用 PEM 格式时，您必须通过 --rpc-private-key 指定私钥
#rpc-certificate=/path/to/certificate.pem

# 在 RPC 服务中启用 SSL/TLS 加密时的私钥文件
#rpc-private-key=/path/to/certificate.key

## BT/PT下载相关 ## ============================================================
# 当下载的是一个种子(以.torrent结尾)时, 自动开始BT任务, 默认:true
#follow-torrent=true

# BT监听端口, 当端口被屏蔽时使用, 默认:6881-6999
listen-port=51413

# 单个种子最大连接数, 默认:55
#bt-max-peers=55

# 打开DHT功能, PT需要禁用, 默认:true
enable-dht=true

# 打开IPv6 DHT功能, PT需要禁用
enable-dht6=true

# DHT网络监听端口, 默认:6881-6999
#dht-listen-port=6881-6999

dht-file-path=/opt/var/aria2/dht.dat
dht-file-path6=/opt/var/aria2/dht6.dat

# 本地节点查找, PT需要禁用, 默认:false
#bt-enable-lpd=false

# 种子交换, PT需要禁用, 默认:true
enable-peer-exchange=false

# 每个种子限速, 对少种的PT很有用, 默认:50K
#bt-request-peer-speed-limit=50K

# 设置 peer id 前缀
peer-id-prefix=-TR2770-

# 当种子的分享率达到这个数时, 自动停止做种, 0为一直做种, 默认:1.0
seed-ratio=0

# 强制保存会话, 即使任务已经完成, 默认:false
# 较新的版本开启后会在任务完成后依然保留.aria2文件
#force-save=false

# BT校验相关, 默认:true
#bt-hash-check-seed=true

# 继续之前的BT任务时, 无需再次校验, 默认:false
bt-seed-unverified=true

# 保存磁力链接元数据为种子文件(.torrent文件), 默认:false
bt-save-metadata=true

bt-max-open-files=16

# Http/FTP 相关
connect-timeout=120
EOF

aria2c --conf-path=/root/.aria2/aria2.conf -D


