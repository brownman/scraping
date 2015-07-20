
num1=${1-3}

file22=/home/someone1/OFER/SCRAP/scrapping/BANK/$num1/RU_EN.txt 
file33=/home/someone1/OFER/SCRAP/scrapping/BANK/$num1/AR_EN.txt 
file11=/home/someone1/OFER/SCRAP/scrapping/BANK/$num1/EN_RU.txt
test -f $file11 || { echo file not found: $file11; exit 0; }
$dir_root/start.sh random_line "$file11 $file22 $file33"



