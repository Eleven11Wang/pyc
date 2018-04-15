#Author:elevenwang 


if [  -e "$1" ]; then
        echo "Pls Input A New Filename!"
        exit 1
fi
if [ -f "$1" ]; then
        vim "$1"
        exit 2
fi
touch "$1"
echo "#!/usr/bin/python" >> "$1"
echo "#!coding:utf-8"
echo "#Author:jujume" >> "$1"
echo "#Version:1.0" >> "$1"
echo "#CreateTime:`date +%F` " >> "$1"
echo "import sys" >>"$1"
vim "$1"
