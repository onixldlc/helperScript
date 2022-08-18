current="$(date +'%s')"
predicted="$(echo ${1} | xargs -I{} date --date={} +"%s")"
echo $(expr $predicted - $current)
