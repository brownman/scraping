#!/bin/bash
#http://phantomjs.org/api/command-line.html
cmd='phantomjs --web-security=false phantom/test.js'
echo $cmd
$cmd
