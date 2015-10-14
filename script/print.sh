#set -x
set -u


#lesson1=$1
test -v lesson1 || { trace err lesson1 not set; exit 0; }
# echo no such dir; exit 1; }

#files=( $1 $2 $3 )
#timeout=(3 10 10)

broadcast(){
    local file=$1
    local num=$2
    local timeout=$3
    local str=$( sed -n ${num}p $file );
    ( test -z "$str" || ( echo "$str" | egrep -h Version\|Binary\|Error\|error ) ) || (

    cat $file_dup | grep "$str" || (
    echo "$str" >> $file_dup
   # command xcowsay "$str" --time $timeout 2>/dev/null || { trace "$str"; }

    # command notify-send "$str" 2>/dev/null || { trace "$str"; }

command notify-send -t 15000 "$str" "_"   2>/dev/null || { trace "$str"; }


    sleep 2 #$timeout
    )
    )
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

    files_str="$( ls -1 $dir_lessons )"
    files=( $files_str )


}

#decide line number
steps(){
    local file
    timeout=10
    #pick_1 "$dir_lessons/${files[0]}"
    random 10
    num1=$?
    let 'num1 += 1'
    create_array
    echo $num1

    #print line x from both files #3: xcowsay-timeout


    i=0
    while [ $i -lt "${#files[@]}" ];do
        file=$dir_lessons/${files[i]}
        test -f $file || { echo 1>&2 no such file: $file; exit 0; }
        commander  broadcast $file $num1 $timeout
        let 'i+=1'
    done

}
set_env(){
file_dup=/tmp/dup
echo -n '' > $file_dup
}
set_env
steps
