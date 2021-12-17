#

#killall -9 qbittorrent-nox
#killall -9 verysync 
#killall -9 filebrowser 
#service nginx restart 

mkdir /root/filebrowser &
wget -c -O /root/linux-amd64-filebrowser.tar.gz https://github.com/filebrowser/filebrowser/releases/download/v2.19.0/linux-amd64-filebrowser.tar.gz
cd /root/filebrowser && tar -zxvf /root/linux-amd64-filebrowser.tar.gz
chmod 755 /root/filebrowser/filebrowser
#cd /root/filebrowser && /root/filebrowser/filebrowser -p 8081 &

wget -c -O /root/frp_0.38.0_linux_amd64.tar.gz https://github.com/fatedier/frp/releases/download/v0.38.0/frp_0.38.0_linux_amd64.tar.gz
cd /root && tar -zxvf /root/frp_0.38.0_linux_amd64.tar.gz
mv /root/frp_0.38.0_linux_amd64 /root/frp
wget -c -O /root/frp/www.tcpfile.com.ini https://raw.githubusercontent.com/lhx11187/huochetou/main/www.tcpfile.com.ini
chmod 755 /root/frp/frpc
cd /root/frp && ./frpc -c ./www.tcpfile.com.ini >/dev/null 2>&1 &




