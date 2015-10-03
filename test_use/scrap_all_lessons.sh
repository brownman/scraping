set -u

scrap_all_lessons(){

    let 'i=1'
    let 'max=100'

    while :;do

        if [ "$i" -le "$max" ];then
            #scrap_url_str_realmode $to $from $i
            commander $dir_parent/start.sh $i 
        else
            break;
        fi

        let 'i+=1'
    done
}

commander scrap_all_lessons

