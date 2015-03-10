#!/bin/bash
#http://phantomjs.org/api/command-line.html

file_name=${1:-test.js}
if [ $LOGNAME = travis ];then
export phantomjs=phantomjs
else
export phantomjs='./node_modules/phantomjs/bin/phantomjs'
fi

cmd="$phantomjs --web-security=false phantom/$file_name" 
echo cmd: $cmd
$cmd
