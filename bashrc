#export statements
export EDITOR=vim
export TERM='xterm-256color'
export PATH="$PATH:/sbin"


### PS1 ###
nonzero_return() {
        RETVAL=$?
            if [ $RETVAL -ne 0 ]
                    then
                            echo "⏎$RETVAL"
                                fi
}
ISROOT=""
function isroot() {
        if id | cut -d' ' -f1 | grep -i 'root' 2>&1 >/dev/null; then
                    ISROOT=true
                        else
                                    ISROOT=false
                                        fi
}
isroot
function user_col() {
        if [ "$ISROOT" == "true" ]; then
                    echo -ne "\[\033[38;5;1;01m\]\u\[\e[m\]"
              else
                    echo -ne "\u"
        fi
}
export PS1="`user_col` \h \W \[\033[01;33m\]\`nonzero_return\`\[\033[01;32m\]\$\[\e[m\] "
###/PS1 ###

# vi mode for bash
set -o vi

# aliases for network things
alias pubip='dig myip.opendns.com @Resolver1.opendns.com +short'
alias locip='ifconfig | grep "inet" | head -n 1' #first inet line
alias bandwidth='wget -O /dev/null http://speedtest.qsc.de/10GB.qsc'
alias share='python -m SimpleHTTPServer 8081' #lists current directory 
# on [locip]:8081. Use localtunnel to make public

# connections
alias klab1='ssh klab1.biomaps.rutgers.edu'
alias klab2='ssh klab2.biomaps.rutgers.edu'
alias tyr='ssh tyr.rutgers.edu'
alias gyges='ssh gyges.rutgers.edu'

# various goodness

function ll() { /bin/echo $(date +%F\ %T) "- $@
" >> ~/lifelog ; /usr/bin/tail ~/lifelog ; }

[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"

[[ -s "$HOME/Desktop/PyRosetta.Ubuntu-12.04LTS-r53098.64Bit/SetPyRosettaEnvironment.sh" ]] && source "$HOME/Desktop/PyRosetta.Ubuntu-12.04LTS-r53098.64Bit/SetPyRosettaEnvironment.sh"


# histidine goodness
cat histidine
