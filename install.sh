#!/bin/bash

# Variables #######################################################################

dir=~/repos/dotfiles            #dotfiles directory
olddir=$HOME/dotfiles.old           #old dotfiles backup directory
files="vimrc spacemacs zshrc tmux.conf xmobarrc Xmodmap xmonad"
                                # list of files/folders to symlink in homedir

###################################################################################

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir dirctory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfilesOld directory, then create
# symlinks
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfilesOld/
    echo "Creating symlinks to $file in home dirctory"
    ln -s $dir/$file ~/.$file
done
