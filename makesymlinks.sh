#!/bin/bash
####################
# .make.sh
# Create symlinks from the home directory to dotfiles
####################

dir=~/dotfiles
olddir=~/dotfiles_old
files="bash_profile bashrc gitconfig nanorc vimrc"

# create dotfiles_old in ~
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in ~ to dotfiles_old dir, then create symlinks
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
