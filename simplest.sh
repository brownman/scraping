set -u
lesson1=${1:-1}
let 'lesson1 += 2' #offset
echo lesson1: $lesson1
#lesson1=3
export     lang_to1=${2:-IT} #$1 #3


set_env(){
export     lang_from1=EN
let "lesson_max=$lesson1 + 1"
export     dir_archive="$HOME/Downloads/LEARN_LANG/"
export dir_to=./BANK
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

local lang_to=$1
local lang_from=$2
local lesson1=$3
while [ $lesson1 -lt $lesson_max ];do
cmd="func1 $lang_to $lesson1"
echo cmd: $cmd
res=$( eval "$cmd")
cmd1="./phantom.sh test.js $res"
echo cmd1: $cmd1
file11=$dir_to/${lang_from}_${lang_to}_${lesson1}.txt
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

steps(){
set_env
start $lang_from1 $lang_to1 $lesson1
start $lang_to1 $lang_from1 $lesson1

}
steps
