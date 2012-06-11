#!/bin/bash
pushd ~/ > /dev/null

if [ -f .bashrc ] || [ -h .bashrc ]
then
	rm .bashrc
fi
if [ -f .bash_profile ] || [ -h .bash_profile ]
then
	rm .bash_profile
fi
if [ -f .gitconfig ] || [ -h .gitconfig ]
then
	rm .gitconfig
fi
if [ -f .vimrc ] || [ -h .vimrc ]
then
	rm .vimrc
fi
if [ -f .tmux.conf ] || [ -h .tmux.conf ]
then
	rm .tmux.conf
fi

popd > /dev/null

f="`dirname \"$0\"`"              # relative
f="`( cd \"$f\" && pwd )`"  # absolutized and normalized
if [ -z "$f" ] ; then
  # error; for some reason, the path is not accessible
  # to the script (e.g. permissions re-evaled after suid)
  exit 1  # fail
fi
echo "$f"

if [ "$1" == "" ]
then
	echo 'Linking bashrc'
	ln -s $f/bashrc ~/.bashrc
else
	ln -s bashrc_$1 ~/.bashrc
fi
ln -s ~/.bashrc ~/.bash_profile
ln -s $f/vimrc ~/.vimrc
ln -s $f/gitconfig ~/.gitconfig
ln -s $f/tmux.conf ~/.tmux.conf
echo "Installing vim inkpot theme"
mkdir -p ~/.vim/colors
ln -s $f/inkpot.vim ~/.vim/colors/inkpot.vim
exit 0
