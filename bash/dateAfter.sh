echo "$(expr $(./convertToSecond.sh "${1}") + $(date +'%s'))" | xargs -I{} date --date=@{}
