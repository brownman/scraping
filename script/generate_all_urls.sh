
lesson=9
source cfg/config.cfg

string_change $lesson
from=RU

while read line;do
    url=$(    bake_url_str RU $line $lesson )
    node jquerygo/left.js $url

done < cfg/langs


