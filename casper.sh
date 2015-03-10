trap_err(){
  echo "[$FUNCNAME]"
  exit 1
}

trap trap_err ERR
set -u

run1(){
local file cmd
while read line;do
test -n "$line" || break

  file=BANK/$line
  test -f $file 
  cmd="casperjs $file"
  echo "[CMD] $cmd"
  eval "$cmd"
  
done < <( cat CFG/task.txt  )
}

test1(){
  local file cmd
while read line;do
test -n "$line" || break

  file=test/$line
  test -f $file 
  cmd="casperjs test $file"
  echo "[CMD] $cmd"
  eval "$cmd"

  
done < <( cat CFG/test.txt  )
}

test1
run1
