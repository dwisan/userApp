apt update && apt upgrade -y
apt install nginx php7.2-fpm
cp nginx.conf /etc/nginx/nginx.conf
cp default /etc/nginx/sites-available/default
cp www.conf /etc/php/7.2/fpm/pool.d/www.conf
/etc/init.d/php7.2-fpm restart
/etc/init.d/nginx restart

echo "kernel.pid_max = 2000000" >> /etc/sysctl.conf
echo "kernel.threads-max = 63484" >> /etc/sysctl.conf
echo "net.ipv4.ip_local_port_range = 3000 65000" >> /etc/sysctl.conf
echo "net.ipv4.tcp_fin_timeout = 30" >> /etc/sysctl.conf
echo "net.core.somaxconn = 60000" >> /etc/sysctl.conf
echo "net.ipv4.tcp_syncookies = 0" >> /etc/sysctl.conf
echo "net.ipv4.tcp_max_syn_backlog = 60000" >> /etc/sysctl.conf
echo "net.ipv4.tcp_max_tw_buckets = 20480" >> /etc/sysctl.conf
echo "net.core.netdev_max_backlog = 60000" >> /etc/sysctl.conf
echo "net.ipv4.tcp_tw_recycle = 1" >> /etc/sysctl.conf
echo "net.ipv4.tcp_tw_reuse = 1" >> /etc/sysctl.conf

echo "net.core.rmem_max = 16777216" >> /etc/sysctl.conf
echo "net.core.wmem_max = 16777216" >> /etc/sysctl.conf
echo "net.core.rmem_default = 16777216" >> /etc/sysctl.conf
echo "net.core.wmem_default = 16777216" >> /etc/sysctl.conf
echo "net.core.optmem_max = 16777216" >> /etc/sysctl.conf

echo "net.ipv4.tcp_rmem = 4096 87380 16777216" >> /etc/sysctl.conf
echo "net.ipv4.tcp_wmem = 4096 16384 16777216" >> /etc/sysctl.conf

sysctl -p
