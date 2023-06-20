#!/bin/zsh

HOUR=$(date "+%I:%M %p")
INTERRUPT=0
while getopts ":I" opt; do
  case $opt in
    I)
      INTERRUPT=1
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done

shift $((OPTIND-1))
MESSAGE="Reminder to $1, it's $HOUR."

if [[ $INTERRUPT -eq 1 ]]
then 
    NOTIFICATION='display alert "PSST!" message "'"$MESSAGE"'"'
else
    NOTIFICATION='display notification "'"$MESSAGE"'" with title "PSST!" sound name "Pop"'
fi

osascript -e $NOTIFICATION
