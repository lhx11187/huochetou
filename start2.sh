#! /bin/bash


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
echo 'killall -9 filebrowser' >>/root/filebrowser/start.sh
echo 'cd /root/filebrowser && /root/filebrowser/filebrowser -p 8081 >/dev/null 2>&1 &' >>/root/filebrowser/start.sh
chmod 755 /root/filebrowser/start.sh
cd /root/filebrowser && ./start.sh >/dev/null 2>&1 &

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
wget -c -O /root/.aria2/aria2.conf https://raw.githubusercontent.com/lhx11187/huochetou/main/aria2.conf
aria2c --conf-path=/root/.aria2/aria2.conf -D

wget -c -O /root/AriaNg-1.2.3.zip https://github.com/mayswind/AriaNg/releases/download/1.2.3/AriaNg-1.2.3.zip
unzip /root/AriaNg-1.2.3.zip -d /var/www/html/AriaNg

rclone rcd --rc-web-gui --rc-user lhx11187 --rc-pass 7702843 >/dev/null 2>&1 &

service nginx restart
