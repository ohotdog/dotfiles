# source from bashrc in dotfiles
# test
. ~/dotfiles/bashrc

export BROWSER=firefox

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
	exec startx
fi
