  


export     lang_to=$1 #3
export     lesson=$2 #RU   

set_env(){
export     lang_from=EN

export     dir_archive='$HOME/Downloads/LEARN_LANG/${lang_to}'
}


string_change(){
    local num=$1
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
    echo "$str_num"

}



func1(){
  local str_num=$( string_change $lesson )
  local filename_html="EN${lang_to}${str_num}.HTM"

  #expose_var filename_html

  local url="http://www.goethe-verlag.com/book2/EN/EN${lang_to}/${filename_html}"
  echo $url
}





start(){
local lang_to=$1
local lang_from=$2
while [ $lesson -lt 101 ];do
cmd="func1 $lang_to $num"
echo cmd: $cmd
res=$( eval "$cmd")
cmd1="./phantom.sh test.js $res"
echo cmd1: $cmd1
file11=/tmp/${lang_from}_${lang_to}_${lesson}.txt
cmd2="$cmd1 &> $file11; cat $file11"
echo cmd2 $cmd2
$cmd2
let "lesson += 1"
done
}

steps(){
set_env
start $lang_to $lang_from
start $lang_from $lang_to

}
steps
