

dir_tmp=tmp/$(date +%s)
mkdir  -p $dir_tmp
commander cd $dir_tmp && \
$dir_parent/test/generate_page_for_each_lesson.sh | xargs wget
