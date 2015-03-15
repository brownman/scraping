#!/bin/bash
#http://phantomjs.org/api/command-line.html
clear
if [ $# -eq 0 ];then
    echo Options: 
    echo --------
    ls -1 phantom/
else

    file_name=${1:-test.js}
    args=${@:2}
    if [ $LOGNAME = travis ];then
        export phantomjs=phantomjs
    else
        export phantomjs='./node_modules/phantomjs/bin/phantomjs'
    fi

    cmd="$phantomjs --web-security=false phantom/$file_name $args" 
    echo cmd: $cmd
    $cmd

fi
