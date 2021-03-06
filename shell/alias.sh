
platform='unknown'
unamestr=$(uname)
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='osx'
fi

if [[ $platform == 'linux' ]]; then
   alias ls='ls -h --color=auto'
elif [[ $platform == 'osx' ]]; then
   alias ls='ls -hG'
fi

#Aliases
##ls, the common ones I use a lot shortened for rapid fire usage
alias la='ls -GA'   # no list, almost all
alias ll='ls -lA'   # list, almost all
alias lt='ls -lAt'   # list, almost all, sort by time
alias lr='ls -lAR'   # list, almost all, recursive

alias t='tree'

alias rmr='rm -rf'

alias rcp='rsync -ah --progress'
 
##cd, because typing the backslash is A LOT of work!!
alias pd='popd'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

alias sudo='sudo env PATH=$PATH'

v() {
   # which nvim > /dev/null 
   # if [ $? -eq 0 ]; then
      # nvm > /dev/null
      # rvm > /dev/null
      # nvim "$@"
   # else
      which vim > /dev/null 
      if [ $? -eq 0 ]; then
         vim "$@"
      else
         which vi > /dev/null 
         if [ $? -eq 0 ]; then
            vi "$@"
         fi
      fi
   # fi
}

# make main the default branch name
# https://andre.arko.net/2020/06/06/changing-git-and-githubs-default-branch-name/
# git() {
#   command git "$@"
#   if [[ "$1" == "init" && "$@" != *"--help"* ]]; then
#     git symbolic-ref HEAD refs/heads/main
#   fi
# }

