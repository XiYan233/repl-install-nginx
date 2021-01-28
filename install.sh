#!/bin/bash
read -p "请输入repl项目名：" name
echo -e "\033[32m repl项目名为：${name} \033[0m"
echo -e "\033[32m 正在下载解压pcre,zlib,openssl,nginx \033[0m"
#下载解压pcre
wget https://ftp.pcre.org/pub/pcre/pcre-8.43.tar.gz
tar zxvf pcre-8.43.tar.gz
#下载解压zlib
wget http://zlib.net/zlib-1.2.11.tar.gz
tar zxvf zlib-1.2.11.tar.gz
#下载解压openssl
wget https://www.openssl.org/source/openssl-1.0.2s.tar.gz
tar zxvf openssl-1.0.2s.tar.gz
#下载解压nginx
wget http://nginx.org/download/nginx-1.16.1.tar.gz
tar zxvf nginx-1.16.1.tar.gz
echo -e "\033[32m 完成 \033[0m"
echo -e "\033[32m 正在清理压缩包 \033[0m"
#删除压缩包
rm -rf pcre-8.43.tar.gz zlib-1.2.11.tar.gz openssl-1.0.2s.tar.gz nginx-1.16.1.tar.gz
echo -e "\033[32m 完成 \033[0m"
#编译安装pcre
cd pcre-8.43
./configure    --prefix=/home/runner/${name}/pcre
echo -e "\033[32m 正在编译pcre \033[0m"
make
echo -e "\033[32m 完成 \033[0m"
echo -e "\033[32m 休息3秒 \033[0m"
sleep 3s
echo -e "\033[32m 正在安装pcre \033[0m"
make install
echo -e "\033[32m 完成 \033[0m"
echo -e "\033[32m 休息3秒 \033[0m"
sleep 3s
#编译安装openssl
cd ../openssl-1.0.2s
./config    --prefix=/home/runner/${name}/openssl
echo -e "\033[32m 正在编译openssl \033[0m"
make
echo -e "\033[32m 完成 \033[0m"
echo -e "\033[32m 休息3秒 \033[0m"
sleep 3s
echo -e "\033[32m 正在安装openssl \033[0m"
make install
echo -e "\033[32m 完成 \033[0m"
echo -e "\033[32m 休息3秒 \033[0m"
sleep 3s
#编译安装zlib
cd ../zlib-1.2.11
./configure    --prefix=/home/runner/${name}/zlib
echo -e "\033[32m 正在编译zlib \033[0m"
make
echo -e "\033[32m 完成 \033[0m"
echo -e "\033[32m 休息3秒 \033[0m"
sleep 3s
echo -e "\033[32m 正在安装zlib \033[0m"
make install
echo -e "\033[32m 完成 \033[0m"
echo -e "\033[32m 休息3秒 \033[0m"
sleep 3s
#编译安装nginx
cd ../nginx-1.16.1
./configure  --with-http_stub_status_module  --with-http_ssl_module  --with-http_gzip_static_module  --prefix=/home/runner/${name}/nginx  --with-pcre=/home/runner/${name}/pcre-8.43  --with-openssl=/home/runner/${name}/openssl-1.0.2s  --with-zlib=/home/runner/${name}/zlib-1.2.11
echo -e "\033[32m 正在编译nginx \033[0m"
make
echo -e "\033[32m 完成 \033[0m"
echo -e "\033[32m 休息3秒 \033[0m"
sleep 3s
echo -e "\033[32m 正在安装nginx \033[0m"
make install
echo -e "\033[32m 完成 \033[0m"


echo -e "安装完成，请手动修改nginx/conf/nginx.conf里的listen 值大于1024"

cd ../nginx/sbin

echo -e "进入nginx/sbin目录执行./nginx后即可运行nginx"
