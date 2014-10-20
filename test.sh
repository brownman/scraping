run(){
while read line;do
  cmd='casperjs BANK/$line'
  echo "[CMD] $cmd"
  eval "$cmd"
done < <( ls -1 BANK/ )
}
run
