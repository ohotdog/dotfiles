#!/bin/sh
# quickly add jap sentences to file

file="$HOME/sentences"

touch "$file"

sel=$(xclip -selection c -o)

echo "$sel" >> "$file"

lines=$(cat "$file" | wc -l)
notify-send -t 3000 "追加（$lines文）" "$sel"

exit 0
