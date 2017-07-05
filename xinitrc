[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
xset r rate 250 30
exec i3
