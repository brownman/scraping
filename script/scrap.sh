num_lesson=${1:-1}

echo num_lesson: $num_lesson
#num_lesson=3

set_env(){
    let 'counter1 = 1'
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
    #echo 1>&2 str_num is $str_num
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
    trace $cmd
    baked_str=$( eval "$cmd")
    print_1_col 0 $baked_str
    print_1_col 1 $baked_str

    #       let "num_lesson += 1"
    #  done
}

print_1_col(){
    let 'counter1 += 1'
    local direction=$1
    local url=$2
    local filename
    local dirname=jquerygo
    local col_is
    local file11
    if [ $direction -eq 0 ];then
        col_is=left
        filename=${lang_from}_${counter1}
    else
        col_is=right
        filename=${lang_to}_${counter1}
    fi
    local path_to=$dirname/${col_is}.js
    #    cmd2="$dir_script/phantom.sh test.js $res"

    local cmd1="node $path_to $url"
    trace "cmd1: $cmd1"

    # filename=${lang_from}_${lang_to}_${col_is}
    file11=$dir_lessons/$filename
    eval "$cmd1" 1>/tmp/out 2>/tmp/err || { cat /tmp/err;exit 1; }
    test -s /tmp/out || { echo file $file11 is empty; exit 1; }
    #touch $file11
    local file_tmp=/tmp/tmp.txt
    cat /tmp/out | grep -v ^$ | grep -v jsbin | grep -v 'phantom stdout:' > $file_tmp
    #| head -n -1 | tail -n +2 > $file11



    if [ $direction -eq 0 ];then
        cp $file_tmp  $file11
        #  test -s $file11 && ( cat $file11 ) || ( trace "file is empty: $file11" )
    else
        cp $file_tmp  $file11
        if [ "$lang_to" = AR ];then
            split_it_AR $file11
        elif [ "$lang_to" = RU ];then
            split_it_RU $file11
        else 
            true
        fi
        mv $file11 /tmp
    fi

    }

    split_it_AR(){
        local path_file=$1
        let 'counter2 = 0'
        local    file1=${path_file}_r #/tmp/221
        local    file2=${path_file}_r_phon #/tmp/220

        echo -n '' > $file1
        echo -n '' > $file2

        while read line;do
            let "mod1 = $counter2 % 2"
            #echo $mod1
            if [ "$mod1" -eq 0 ];then
                echo $line >> $file1
            else 
                echo $line >> $file2
            fi
            let 'counter2 += 1'  
        done < $path_file
        echo check out $file1
        echo check out  $file2
    }

    split_it_RU(){
        local path_file=$1
        let 'counter2 = 0'
        local    file1=${path_file}_r1 #/tmp/221
        local    file2=${path_file}_r2 #_phon #/tmp/220
        local    file3=${path_file}_r3 #_empty #/tmp/220

        echo -n '' > $file1
        echo -n '' > $file2
        echo -n '' > $file3

        while read line;do
            let "mod1 = $counter2 % 3"
            #echo $mod1
            if [ "$mod1" -eq 0 ];then
                echo $line >> $file1
            elif [ "$mod1" -eq 1 ];then
                echo $line >> $file2
            else
                echo $line >> $file3
            fi
            let 'counter2 += 1'  
        done < $path_file
        echo check out $file1
        echo check out  $file2
        echo check out  $file3
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
        test -d $dir_lessons || { commander "mkdir -p $dir_lessons" ; }
        #    dir_lessons=$dir_bank/$num_lesson/
        #    test -d $dir_lessons || { mkdir -p $dir_lessons; }
    }

    steps

    #echo "langs: ${langs[@]}"
