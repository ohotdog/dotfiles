# .bashrc
# change default editor to vim
export EDITOR="vim"

# use vi style editing in bash
set -o vi

# show mode in prompt :^)
set show-mode-in-prompt on
set vi-ins-mode-string "+"
set vi-cmd-mode-string ":"
set vi-cmd-mode-string "\1\e[1;31m\2:\1\e[0m\2"

# source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# source custom functions
if [ -f ~/dotfiles/bash/functions ]; then
    . ~/dotfiles/bash/functions
fi

# source custom aliases
if [ -f ~/dotfiles/bash/aliases ]; then
    . ~/dotfiles/bash/aliases
fi

# source git completion
for i in ~/dotfiles/completion/*; do
    . $i
done

# color variables for prompt
C_DEF="\033[0m"
C_RED="\033[0;31m"
C_GRN="\033[0;32m"
C_YLW="\033[0;33m"
C_BLU="\033[0;36m"
C_WHT="\033[0;37m"

# get git status for color
function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ $git_status =~ "Changes not staged for commit" ]]; then
    echo -e $C_RED
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $C_YLW
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $C_GRN
  else
    echo -e $C_BLU
  fi
}

# get git branch
function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo " ($branch)"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "($commit)"
  fi
}

# set prompt style and include git branch name
PS1="\[$C_GRN\]\u\[$C_DEF\]:"
PS1+="\[$C_BLU\]\w"
PS1+="\[\$(git_color)\]\$(git_branch)\[$C_DEF\]\$ "
export PS1

# ls colors
eval `dircolors -b ~/dotfiles/bash/dir_colors`
