#!/bin/bash
set -o errexit
set -x
SCRIPT_DIR="$(dirname "${BASH_SOURCE:-$0}")"

if [ -f ~/.bashrc ]; then
	mv -i ~/.bashrc     ~/.bashrc.old   
fi
if [ -f ~/.vimrc ]; then
	mv -i ~/.vimrc      ~/.vimrc.old     
fi
if [ -d ~/.vim ]; then
	mv -i ~/.vim        ~/.vim.old       
fi
sleep 1
ln -s $SCRIPT_DIR/.bashrc     ~/.bashrc 
ln -s $SCRIPT_DIR/.vimrc      ~/.vimrc  
ln -s $SCRIPT_DIR/.vim        ~/.vim    

