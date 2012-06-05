#export statements
export EDITOR=vim
export PS1="[\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]]\$ \[\033[01;31m\]❤ \[\e[m\]"

#sync rcFiles
(
    cd ~/rcFiles
	git pull -q
	 exit
)& disown


#program shortcuts
alias bashmod="vim ~/.bashrc"
alias bashsave="source ~/.bashrc"
alias vmod="vim ~/.vimrc"
alias xmod="vim ~/.xinitrc"
alias lock="xscreensaver-command -lock"

#aliases for ls
alias ls="ls --color=auto"
alias lsa="ls -a"
alias lsd="ls --color=always -alh | grep ^d"
alias lf="ls --color=always -lh | grep ^d"
alias l="ls"
alias s="l"
alias sl="ls"
alias la="ls -Alh"
alias ll="ls -lh"

#aliases for random ops
alias cc="clear"
alias sudo="sudo -E"

#aliases for directory navigation
alias ..="cd .."
alias vi="vim"
alias v="vim"
alias me="cd ~;ls"

#ssh aliases
alias facade="ssh facade.rutgers.edu"
alias ziti="ssh ziti.rutgers.edu"
alias ravioli="ssh ravioli.rutgers.edu"
alias sauron="ssh sauron.rutgers.edu"
