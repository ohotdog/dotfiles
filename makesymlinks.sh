#!/bin/bash
####################
# .make.sh
# Create symlinks from the home directory to dotfiles
####################

dir=~/dotfiles
olddir=~/dotfiles_old
files="bash_profile bashrc gitconfig nanorc vimrc inputrc"
update=false

# check if files exist before continuing
for file in $files; do
    if [ ! -h ~/.$file ]; then
       update=true 
    fi
done

# if no file exists exit
if [ $update = false ]; then
    echo "Nothing to udpate"
    exit 1
fi

# create dotfiles_old in ~
if [ ! -d "$olddir" ]; then
    echo "Creating $olddir for backup of any existing dotfiles in ~"
    mkdir $olddir
    echo "...done"
fi

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in ~ to dotfiles_old dir, then create symlinks
for file in $files; do
    if [ ! -h ~/.$file ]; then
        echo "Moving $file from ~ to $olddir"
        mv ~/.$file ~/dotfiles_old/
        echo "Creating symlink to $file in home directory."
        ln -s $dir/$file ~/.$file
    fi
done
