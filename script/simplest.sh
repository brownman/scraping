lesson1=${2:-1}
let 'lesson1 += 2' #offset
echo lesson1: $lesson1
#lesson1=3


set_env(){
    export     lang_from1=EN
    export     lang_to1=RU #$1 #3
    export     lang_to2=AR #$1 #3
    export     lang_to3=IT #$1 #3
  
let "lesson_max=$lesson1 + 1"
}


string_change(){
    local num=$1
    local str_num=0

    #  use print
    #    print func

    if [ $num -lt 5 ];then
        str_num="00$num"
    elif [ $num -lt 100 ] ;then
        str_num="0$num"
    else
        str_num="100"
    fi
    echo "$str_num"

}



func1(){
    local str_num=$( string_change $lesson1 )
    local filename_html="${lang_from}${lang_to}${str_num}.HTM"

    #expose_var filename_html

    local url="http://www.goethe-verlag.com/book2/${lang_from}/${lang_from}${lang_to}/${filename_html}"
    echo $url
}





start(){

local cmd1
    local lang_to=$1
    local lang_from=$2
    local lesson1=$3
    while [ $lesson1 -lt $lesson_max ];do
        cmd="func1 $lang_to $lesson1"
        echo cmd: $cmd
        res=$( eval "$cmd")
        cmd1="$dir_script/phantom.sh test.js $res"
        echo cmd1: $cmd1
        dir11=$dir_to/$lesson1/
        test -d $dir11 || { mkdir -p $dir11; }
        filename=${lang_from}_${lang_to}.txt
        file11=$dir11/$filename
        eval "$cmd1" 1>/tmp/out 2>/tmp/err || { cat /tmp/err;exit 1; }


        test -s /tmp/out || { echo file $file11 is empty; exit 1; }

        touch $file11
        cat /tmp/out | grep -v ^$ | head -n -1 | tail -n +2 > $file11

        ls -l $file11
        echo lesson1: $lesson1
        cat $file11
        let "lesson1 += 1"
    done
}

run_2_dirs(){
    local lang_to_x=$1
    start $lang_from1 $lang_to_x $lesson1
    start $lang_to_x $lang_from1 $lesson1
}
steps(){
#    set_env

let "lesson_max=$lesson1 + 1"
echo ${langs[@]}
for t in "${langs[@]}"
do
    run_2_dirs $t
done
}
#steps

echo "langs: ${langs[@]}"
