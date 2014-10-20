while read line;do
casperjs BANK/$line
done < <( ls -1l BANK/ )

