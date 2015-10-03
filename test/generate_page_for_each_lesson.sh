set -e
set -u

bake_all_lessons(){
from=$1
to=$2

let 'i=1'
let 'max=100'

while :;do

if [ "$i" -le "$max" ];then
    bake_url_str_realmode $from $to $i
    bake_url_str_realmode $to $from $i
else
    break;
fi

let 'i+=1'
done
}

commander bake_all_lessons EM IT

commander bake_all_lessons EM AR

