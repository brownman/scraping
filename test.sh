trap_err(){
  echo "[$FUNCNAME]"
  exit 1
}

trap trap_err ERR
set -u

run(){
local file cmd
while read line;do
test -n "$line" || break

  file=BANK/$line
  test -f $file 
  cmd="casperjs $file"
  echo "[CMD] $cmd"
  eval "$cmd"
  
done < <( cat task.txt  )
}
run
