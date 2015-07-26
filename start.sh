export dir_parent=$(cd `dirname $0`;pwd)
#set -e

if [ "$1" -eq 1 ];then
    file1='simplest'
else
    file1='random_line'
fi

lesson1="$2"
let 'lesson1 += 2' #offset




set_env(){
    source $dir_parent/cfg/config.cfg
}

intro(){
    ls $dir_parent/script
}

steps(){
    set_env
    intro
    local cmd="$dir_script/${file1}.sh $lesson1"
    echo cmd: $cmd
    eval "$cmd"
}

steps
