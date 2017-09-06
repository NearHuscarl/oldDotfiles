#!/bin/bash

# Copy these line in ~/.bashrc
# # run custom alias script in all session
# if [ -f ~/bin/aliases.sh ]; then
#     . ~/bin/aliases.sh
# fi

function findname {
   sudo find / -iname "$1" | less
}

function cdl {
   cd "$1" && ls -A
}

# Source this file
alias sa='. $HOME/bin/aliases.sh'
alias reboot='shutdown -r now'
alias shutoff='shutdown -h now'
alias cdl..='cdl ..'

# Quickly open this file to edit
e() {
   if [[ $@ == "alias" ]]; then
      command cd ~/bin && vim aliases.sh
   fi
}

# Quickly change directory
alias dkt='cd ~/Desktop/ && la'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Other
alias music="ncmpcpp"
alias todo="vim ~/misc/Todo"
alias pac="sudo pacman"
alias syctl="sudo systemctl"
