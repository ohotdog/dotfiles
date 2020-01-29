#!/bin/bash
##Create symlinks from the home directory to dotfiles##
# Set variables
dir=~/dotfiles
olddir=~/.dotfiles_old
files="bash_profile bashrc gitconfig inputrc vimrc xinitrc Xresources config/compton.conf config/i3/config config/dunst/dunstrc config/dunst/play-sound.sh config/dunst/GotItem.WAV config/polybar/config config/polybar/launch.sh config/ranger/rc.conf config/user-dirs.dirs vim/bundle/Vundle.vim urxvt/ext/font-size config/mpv/mpv.conf zshrc zprofile"
update=false

# Check if files exist before continuing
for file in $files; do
    if [ ! -h ~/.$file ]; then
       update=true 
    fi
done

# If no file exists exit
if [ $update = false ]; then
    echo "Nothing to udpate"
    exit 1
fi

# Create dotfiles_old in ~
if [ ! -d "$olddir" ]; then
    echo "Creating $olddir for backup of any existing dotfiles in ~"
    mkdir $olddir
    echo "...done"
fi

# Change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# Move any existing dotfiles in ~ to dotfiles_old dir, then create symlinks
for file in $files; do
    if [ ! -h ~/.$file ]; then
        echo "Moving $file from ~ to $olddir"
        mv ~/.$file ~/dotfiles_old/
        echo "Creating symlink to $file in home directory."
        ln -s $dir/$file ~/.$file
    fi
done
