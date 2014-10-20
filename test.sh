run(){
local file cmd
while read line;do
  file=BANK/$line
  test -f $file 
  cmd="casperjs $file"
  echo "[CMD] $cmd"
  eval "$cmd"
done < <( ls -1 BANK/ )
}
run
