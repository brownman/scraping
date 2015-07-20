
export dir_root=$(cd `dirname $0`;pwd)

file1="$1"
opts="${@:2}"




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
