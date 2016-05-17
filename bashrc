# .bashrc
export EDITOR="vim"

set -o vi

# source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# custom functions
if [ -f ~/dotfiles/bash/functions ]; then
    . ~/dotfiles/bash/functions
fi

# custom aliases
if [ -f ~/dotfiles/bash/aliases ]; then
    . ~/dotfiles/bash/aliases
fi

# git completion
for i in ~/dotfiles/completion/*; do
    . $i
done

export PS1="\[\033[31m\]\u\[\033[m\]:\[\033[35;1m\]\w\[\033[m\]\$ "
export LS_OPTIONS="--color=always --group-directories-first"

eval `gdircolors -b ~/dotfiles/bash/dir_colors`

# TERM=xterm-256color
