
set -u
use random
lesson1=$1
#files=( $1 $2 $3 )
#timeout=(3 10 10)

func1(){
local file=$1
local num=$2
local timeout=$3
local str=$( sed -n ${num}p $file );
xcowsay "$str" --time $timeout 
sleep 1 #$timeout 
}

pick_1(){
local file=$1
local num=$( cat $file | wc -l );
set +e;
( random $num );
local res=$?;
return $res
}

create_array(){
dir_lessons=/home/someone1/OFER/SCRAP/scrapping/BANK/$lesson1
files_str="$( ls -1 $dir_lessons )"
files=( $files_str )


}

#decide line number
steps(){

timeout=10
#pick_1 "$dir_lessons/${files[0]}"
random 10
num1=$?
let 'num1 += 1'
create_array
echo $num1

#print line x from both files #3: xcowsay-timeout
#func1 $file1 $num1 3
#func1 $file2 $num1 10
#func1 $file3 $num1 10


i=0
while [ $i -lt "${#files[@]}" ];do
    file=$dir_lessons/${files[i]}
test -f $file || { echo 1>&2 no such file: $file; exit 0; }
            commander  func1 $file $num1 $timeout
            let 'i+=1'
        done

    }
    steps
