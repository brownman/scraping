num_lesson=${1:-1}

echo num_lesson: $num_lesson
#num_lesson=3

set_env(){
test -d $dir_to
dir_to11=$dir_to
arr_langs=( $langs )
}


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



bake_url_str(){
    local lang_from=$1
    local lang_to=$2
    local num_lesson=$3

    local str_num=$( string_change $num_lesson )
    local filename_html="${lang_from}${lang_to}${str_num}.HTM"

    #expose_var filename_html

    local url="http://www.goethe-verlag.com/book2/${lang_from}/${lang_from}${lang_to}/${filename_html}"
    echo $url
}





scrap_2_col(){
    local lang_to=$1
    local lang_from=$2
    local num_lesson=$3
    #let "lesson_max=$num_lesson + 1"
    #    while [ $num_lesson -lt $lesson_max ];do
    local cmd
    cmd="bake_url_str $lang_from $lang_to $num_lesson"
    echo cmd: $cmd
    baked_str=$( eval "$cmd")
    print_col 0 $baked_str
    print_col 1 $baked_str

    #       let "num_lesson += 1"
    #  done
}

bla(){
    local direction=$1
    local url=$2
    local filename
    local dirname=jquerygo

    if [ $direction -eq 0];then
        col_is=left
    else
        col_is=right
    fi
    local path_to=$dirname/${col_is}.js
    #    cmd2="$dir_script/phantom.sh test.js $res"

    local cmd1="node $path_to $url"
    trace "cmd1: $cmd1"

    filename=${lang_from}_${lang_to}_${col_is}.txt
    file11=$dir_to11/$filename
    eval "$cmd1" 1>/tmp/out 2>/tmp/err || { cat /tmp/err;exit 1; }
    test -s /tmp/out || { echo file $file11 is empty; exit 1; }
    #touch $file11
    cat /tmp/out | grep -v ^$ | head -n -1 | tail -n +2 > $file11

    test -s $file11 && ( cat $file11 ) || ( trace "file is empty: $file11" )
}

switch_urls(){
    local lang_to_x=$1
    commander scrap_2_col $lang_base $lang_to_x $num_lesson
    commander scrap_2_col $lang_to_x $lang_base $num_lesson
}
loop_langs(){
    echo ${arr_langs[@]}
    for t in "${arr_langs[@]}"
    do
        switch_urls $t $num_lesson
    done
}

steps(){
    set_env
    ensure_dir

    test -v num_lesson
    loop_langs
}
ensure_dir(){
    dir_to11=$dir_to/$num_lesson/
    test -d $dir_to11 || { mkdir -p $dir_to11; }
}

steps

#echo "langs: ${langs[@]}"
