predicted=$(expr $(./convertToSecond.sh "${1}") + $(date +'%s'))
echo "${predicted}" | xargs -I{} date --date=@{}
