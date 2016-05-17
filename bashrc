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

# set prompt style and include git branch name
export PS1="\[\033[31m\]\u\[\033[m\]:\[\033[35;1m\]\w\[\033[m\]\\[\033[32m\]\$(parse_git_branch)\[\033[m\]\$ "

# ls colors
eval `gdircolors -b ~/dotfiles/bash/dir_colors`
