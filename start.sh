
set_args(){
#https://wiki.ubuntu.com/DashAsBinSh
#commander "assert left_bigger $# 1"
local arg0=$1
local opts="${@:1}"
print color 34 "arg0: $arg0"
print color 34 "opts: $opts"
}

set_args_print(){
#https://wiki.ubuntu.com/DashAsBinSh
#commander "assert left_bigger $# 1"
local arg0=$1
local opts="${@:1}"
echo "[ $arg0 ] $opts"
}


file1="$1"
opts="${@:2}"


export dir_root=$(cd `dirname $0`;pwd)

set_env(){
source $dir_root/cfg/config.cfg
}

intro(){
ls $dir_root/script
}

steps(){
set_env
intro
commander $dir_script/${file1}.sh $opts
}

steps
