num_lesson=${1:-1}

echo num_lesson: $num_lesson
#num_lesson=3




string_change(){
    let "num=$1"
    local str_num=0

    #  use print
    #    print func

    if [ $num -lt 10 ];then
        str_num="00$num"
    elif [ $num -lt 100 ] ;then
        str_num="0$num"
    else
        str_num="100"
    fi
    echo 1>&2 str_num is $str_num
    echo "$str_num"

}



func1(){
    local lang_from=$1
    local lang_to=$2
    local num_lesson=$3

    local str_num=$( string_change $num_lesson )
    local filename_html="${lang_from}${lang_to}${str_num}.HTM"

    #expose_var filename_html

    local url="http://www.goethe-verlag.com/book2/${lang_from}/${lang_from}${lang_to}/${filename_html}"
    echo $url
}





start(){

    local cmd1
    local cmd
    local res
    local filename 
    local dir11
    local file11

    local lang_to=$1
    local lang_from=$2
    local num_lesson=$3
    #    while [ $num_lesson -lt $lesson_max ];do
    cmd="func1 $lang_from $lang_to $num_lesson"
    echo cmd: $cmd
    res=$( eval "$cmd")
    cmd1="$dir_script/phantom.sh test.js $res"
    echo cmd1: $cmd1
    dir11=$dir_to/$num_lesson/
    test -d $dir11 || { mkdir -p $dir11; }
    filename=${lang_from}_${lang_to}.txt
    file11=$dir11/$filename
    eval "$cmd1" 1>/tmp/out 2>/tmp/err || { cat /tmp/err;exit 1; }


    test -s /tmp/out || { echo file $file11 is empty; exit 1; }

    touch $file11
    cat /tmp/out | grep -v ^$ | head -n -1 | tail -n +2 > $file11

    ls -l $file11
    echo num_lesson: $num_lesson
    cat $file11
    #       let "num_lesson += 1"
    #  done
}

run_2_dirs(){
    local lang_to_x=$1
    commander start $lang_base $lang_to_x $num_lesson
    commander start $lang_to_x $lang_base $num_lesson
}
steps(){
    #    set_env
    local arr_langs=( $langs )
    #let "lesson_max=$num_lesson + 1"
    echo ${arr_langs[@]}
    for t in "${arr_langs[@]}"
    do
        commander run_2_dirs $t $num_lesson
    done
}
steps

#echo "langs: ${langs[@]}"
