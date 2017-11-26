[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
xset r rate 250 30
export GTK_IM_MODULE='uim'
export QT_IM_MODULE='uim'
uim-xim &
export XMODIFIERS='@im=uim'
exec i3
