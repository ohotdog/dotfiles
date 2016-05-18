# .bashrc
export EDITOR="vim"

set -o vi

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
C_WHT="\033[0;37m"
C_ORG="\033[35;1m"
C_OCH="\033[38;5;95m"

# get git status for color
function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ ! $git_status =~ "working directory clean" ]]; then
    echo -e $C_RED
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $C_YLW
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $C_GRN
  else
    echo -e $C_OCH
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
PS1="\[$C_RED\]\u\[$C_DEF\]:"
PS1+="\[$C_ORG\]\w"
PS1+="\[\$(git_color)\]\$(git_branch)\[$C_DEF\]\$ "
export PS1

# ls colors
eval `gdircolors -b ~/dotfiles/bash/dir_colors`
