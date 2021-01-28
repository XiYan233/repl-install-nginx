#!/bin/bash
read -p "请输入repl项目名：" name
echo -e "\033[32m repl项目名为：${name} \033[0m"

cd /home/runner/${name}/nginx/conf
#生成私钥
echo -e "\033[32m 正在生成私钥 \033[0m"
openssl genrsa > cert.key
echo -e "\033[32m 完成 \033[0m"
echo -e "\033[32m 休息3秒 \033[0m"
sleep 3s
#生成证书
echo -e "\033[32m 此步骤需按照提示输入相对应的信息 \033[0m"
echo -e "\033[32m 2秒后开始 \033[0m"
sleep 2s
echo -e "\033[32m 正在生成证书 \033[0m"
openssl req -new -x509 -key cert.key > cert.pem
echo -e "\033[32m 完成 \033[0m"
