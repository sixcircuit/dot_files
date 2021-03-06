
current_dir=`pwd`

cd ~/shell

source ./shell/common.sh

export IGNOREEOF=1000

alias src="source ~/.bash_profile"

shopt -s histappend

set -o vi

stty -ixon

if [ -f /.production ]; then
    export PS1="{bg_red}[\u@\h \w]$ "
else
    export PS1="[\u@\h \w]$ "
fi

cd "$current_dir"
