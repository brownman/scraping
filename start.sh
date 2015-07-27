
#set -e
lesson_input=${1:-}
#method1=$1
export dir_parent=$(cd `dirname $0`;pwd)

pushd  $dir_parent >/dev/null

ensure_dir(){
    local dir_num=$1
    local dir_to=$dir_bank/$dir_num
    test -d $dir_to && { trace dir exist: $dir_to; } || { trace 'lesson not exist - scrapping method1'; let 'method1 = 1' ; }
    if [ "$method1" -eq 1 ];then
        file1='scrap'
    else
        file1='print'
    fi


}

set_env(){
    source $dir_parent/cfg/config.cfg
    random 100
    local res=$?

    export lesson1=${lesson_input:-$res}
    let 'method1 = 0'
    let 'lesson1 += 2' #offset
    export dir_lessons=$dir_bank/$lesson1
}

intro(){
    ls $dir_parent/script
}

run(){
    local file1
    if [ "$method1" -eq 1 ];then
        file1='scrap'
        local cmd="$dir_script/${file1}.sh $lesson1"
        commander "$cmd"
    else

        file1='print'
        local cmd="$dir_script/${file1}.sh $lesson1"
        commander "$cmd"

    fi
}

steps(){



    set_env


    intro
    ensure_dir $lesson1 
    run
}

steps
popd >/dev/null
