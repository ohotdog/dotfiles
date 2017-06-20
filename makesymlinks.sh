#!/bin/bash
##Create symlinks from the home directory to dotfiles##
# Set variables
dir=~/dotfiles
olddir=~/.dotfiles_old
files="bg bash_profile bashrc gitconfig inputrc vimrc xinitrc config/i3/config"
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
