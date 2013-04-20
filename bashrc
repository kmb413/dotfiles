#export statements
export EDITOR=vim
export TERM='xterm-256color'
export PATH="$PATH:$HOME/local:$HOME/local/bin:/sbin"
export LD_LIBRARY_PATH=/home/svensken/local/lib


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

[[ -s "$HOME/Desktop/PyRosetta/SetPyRosettaEnvironment.sh" ]] && source "$HOME/Desktop/PyRosetta/SetPyRosettaEnvironment.sh"
[[ -s "$HOME/PyRosetta.Ubuntu-12.04LTS-r54625.64Bit/SetPyRosettaEnvironment.sh" ]] && source "$HOME/PyRosetta.Ubuntu-12.04LTS-r54625.64Bit/SetPyRosettaEnvironment.sh"


if shopt -q login_shell; then
    # histidine goodness
    echo "
                                           
      .i                                       
     .;fL          :t                          
     lfLL         :lL                          
      C;t         tLf                          
       CLCG      :LL                           
       LCG@C   CCGL                            
       CGGCCCLCCG@@                            
       G@@G@GGCGG@@                            
       CG@    GG@G@         svensken           
       CG      @@@                             
      CGG       @@                             
     CC@@       @@                             
  ; CCG@@       @@                             
 ;tiCGG@@       CG                             
  LL @@GG      CCG@                            
      @GG@     CGG@@                           
        GC   CCGG@CG        ,l                 
        GLCGLGG@@@GCG      .;tL                
         LCGG@@    GCCG    ;tLL                
         CG@@       GGCCGClLLL                 
         G@GG        CCGG@L                    
          @@         GCG@@                     
                      :f@@   :L                
                     ,lL@G@ .lL                
                    ,ifL @GCGLL                
                    lffL @@@GL                 
                     LL  CCG@@                 
                .l      CGG@GG         ffLC    
               ,ifl    CCG@@GCCG       ffCGG   
               fLfiGCCLC@@   GCCG    ffLCCGG   
                  tLLCG@@     GCCCCGCGCGGGG    
                   CCG@        @CLGGG@G  G     
                   GG@G@        CGG@@          
                    l@@f        GG@G           
                   :f;tL        CC@            
                  ,lL LL        fC@            
                  lLf           fC@            
                   L           fLC G           
                              ffLCG            
                              LLCGG            
                              CCGGG            
                               GGG

    "
fi
