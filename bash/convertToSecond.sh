expr "$(echo ${1} | xargs -I{} date --date={} +"%s")" - "$(date +'%s')"
