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

pushd dotfiles/ > /dev/null

f=`pwd`
if [ -z "$f" ] ; then
  # error; for some reason, the path is not accessible
  # to the script (e.g. permissions re-evaled after suid)
  exit 1  # fail
fi

if [ "$1" == "" ]
then
	echo 'Linking bashrc'
	ln -s $f/bashrc ~/.bashrc
else
	if [ -f $f/bashrc_$1 ]
	then
		echo "Linking bashrc_$1"
		ln -s $f/bashrc_$1 ~/.bashrc
	else
		echo "bashrc_$1 does not exist"
		exit 2
	fi
fi
ln -s ~/.bashrc ~/.bash_profile
ln -s $f/vimrc ~/.vimrc
ln -s $f/gitconfig ~/.gitconfig
ln -s $f/tmux_config ~/.tmux.conf
echo "Installing vim inkpot theme"
mkdir -p ~/.vim/colors
ln -s $f/inkpot.vim ~/.vim/colors/inkpot.vim

popd > /dev/null
popd > /dev/null

exit 0
