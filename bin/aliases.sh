#!/bin/bash

# Copy these line in $HOME/.bashrc
# # run custom alias script in all session
# if [ -f $HOME/bin/aliases.sh ]; then
#     . $HOME/bin/aliases.sh
# fi

# variable
completionPath="/usr/share/bash-completion/completions"
bin="$HOME/bin"
editor=vim

function findname {
   sudo find / -iname "$1" | less
}

function cdl {
   cd "$1" && ls -A
}

# Source this file
alias sa='source $HOME/bin/aliases.sh'
alias reboot='shutdown -r now'
alias shutoff='shutdown -h now'
alias cdl..='cdl ..'

# Quickly change directory
alias dkt='cd $HOME/Desktop/ && la'
alias dotfiles='cd $HOME/dotfiles/'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# list
alias  ls="ls --color=auto"
alias  la="ls --color=auto -A"
alias  ll="ls --color=auto -oh"
alias lla="ls --color=auto -ohA"
alias  lr="ls --color=auto -R"
alias lss="ls -A    | grep --color=auto -i"
alias lls="ls -Aoh  | grep --color=auto -i"
alias lrs="ls -ARoh | grep --color=auto -i"

tree() {
   pwd=$(pwd)
   find $pwd -print | sed -e "s;$pwd;\.;g;s;[^/]*\/;|__;g;s;__|; |;g"
}

# vim
if [[ -x /usr/bin/vim ]]; then
   alias view="vim -R"
   alias vimrc="vim $HOME/.vim/plugin/00_config.vim"
   if [[ -x $HOME/bin/viman ]]; then
      alias man="viman"
   fi
fi

# pacman
if [[ -x /usr/bin/pacman ]]; then
   function pac-install() {
      sudo pacman -S "$@"
      [[ -x $HOME/bin/pacMerge ]] && pacMerge
   }

   function pac-update() {
      sudo pacman -Syu
      [[ -x $HOME/bin/pacMerge ]] && pacMerge
   }

   alias pac-remove="sudo pacman -Rs"
   alias pac-search="pacman -Qsq"
   alias pac-Search="pacman -Ssq"
   # alias pac-export="pacman -Qqe >"
   # alias pac-import="sudo pacman -S - <"

   # remove unused packages (orphans)
   alias pac-orphan="sudo pacman -Rns $(pacman -Qtdq)"

   alias pac-info="pacman -Si"

   # show description of package(s)
   alias pac-desc="expac -S '%d'"

   # show download size of package(s)
   alias pac-size="expac -S -HM '%k\t%n'"

   # show nth largest download size of package(s)
   alias pac-size-l="expac -S -HM '%k\t%n' | sort -n | tail -n"

   # list nth last installed packages
   alias pac-latest="expac -HM --timefmt='%Y-%m-%d %T' '%l\t%-20n\t%m' | sort | tail -n"

   # list nth last explicitly installed packages which is not in base/base-devel group 
   pac-latest-e() {
      explicitPkgs=$(comm -23 <(pacman -Qqe | sort) <(pacman -Qqg base base-devel | sort))
      expac -HM --timefmt='%Y-%m-%d %T' '%l\t%-20n\t%m' $explicitPkgs  | sort | tail -n ${1:-10}
   }

   # print package's dependencies
   pac-dep() {
      if [[ $# == 0 ]]; then
         printf "Please enter a package name\n"
      else
         pacman -Si $1 | awk -F'[:<=>]' '/^Depends/ {print $2}' | xargs -n1 | sort -u
      fi
   }

   # AUR
   if [[ -x /usr/bin/pacaur ]]; then
      alias aur-install="pacaur -Sa"
      alias aur-update="pacaur -Syua"
      alias aur-remove="pacaur -Rsa"
      alias aur-search="pacaur -Qsqa"
      alias aur-Search="pacaur -Ssqa"
      alias aur-info="pacaur -Sia"
      aur-desc() {
         pacaur -Si $@ | grep Description | sed -e "s/^Description.*://"
      }
      aur-size() {
         pacaur -Qi $@ | grep "Installed Size" | sed -e "s/^Installed Size.*://"
      }
      aur-dep() {
         if [[ $# == 0 ]]; then
            printf "Please enter a package name\n"
         else
            pacman -Qi $1 | awk -F'[:<=>]' '/^Depends/ {print $2}' | xargs -n1 | sort -u
         fi
      }
   fi
fi

# systemd
if [[ -x /usr/bin/systemctl ]]; then
   alias sd-start="sudo systemctl start"
   alias sd-stop="sudo systemctl stop"
   alias sd-enable="sudo systemctl enable"
   alias sd-status="sudo systemctl status"
fi

if [[ -x /usr/bin/journalctl ]]; then
   alias sd-log="journalctl -b"
   alias sd-search="journalctl -b | grep"
   alias sd-clean="journalctl --vacuum-size=100M"
fi

# git
if [[ -x /usr/bin/git ]]; then
   alias gstat='git status'
   alias gadd='git add'
   alias gcommit='git commit'
   alias gCommit='git commit -a'
   alias gclone='git clone'
   alias glog='git log \
      --color \
      --graph \
      --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" \
      --abbrev-commit'
   alias glogstat='glog --stat'
   alias glogdiff='glog --stat -p'
   alias gschange='git log --patch -S'
   alias gscommit='git log --grep'
   alias gpull='git pull'
   alias gpush='git push'
   # fix commit msg without altering its snapshot
   alias gfixcommit='git commit --amend'
   # fix commit (staging other files)
   alias gfixstage='git commit --amend --reuse-message=HEAD'
   alias gunstage='git reset HEAD'
   alias gswitch='git checkout'
   alias gnewbranch='git checkout -b'
   alias gdelbranch='git branch -d'
   alias gdelremote='git push origin :'
   alias gmerge='git merge'

   # gdiff [num] where num is commit [num]nth
   function gdiff() {
      if [[ $# == 0 ]]; then
         git diff
      else
         git diff HEAD~$1
      fi
   }
fi

# Shortcuts to edit config file
alias compton-conf="$editor $HOME/.config/compton.conf"
alias dunst-conf="$editor $HOME/.config/dunst/dunstrc"
alias i3-conf="$editor $HOME/.config/i3/config"
alias git-conf="$editor $HOME/.config/git/config"
alias neofetch-conf="$editor $HOME/.config/neofetch/config"
alias polybar-conf="$editor $HOME/.config/polybar/config"

# xprop
alias xprop-class="xprop WM_CLASS"
alias xprop-role="xprop WM_WINDOW_ROLE"
alias xprop-title="xprop _NET_WM_NAME WM_NAME"

function size() {
   du -h --max-depth=${1:-0}
}

function size-l() {
   du -h --max-depth=${1:-0} --block-size=M | sort -n
}

# Other
alias alias-e="$editor $HOME/bin/aliases.sh"
alias alsa-fix="sudo /usr/local/bin/alsa-fix.sh"
alias bashrc="$editor $HOME/.bashrc"
alias inputrc="$editor $HOME/.inputrc"
alias music="ncmpcpp"
alias todo="$editor $HOME/misc/Todo"
alias plan="$editor $HOME/misc/plan"
alias arch="$editor $HOME/misc/Arch.txt"
alias symlink="ln -s"

toggle-tray() {
   local configPath="$HOME/.config/polybar/config"
   if grep "^tray-position" "$configPath" 1> /dev/null; then
      sed -i 's/^tray-position/#tray-position/' $HOME/.config/polybar/config
   else
      sed -i 's/^#tray-position/tray-position/' $HOME/.config/polybar/config
   fi
}

# Apply completion to aliases
# complete -p <command> -> show completion function of that command
# note: if not work. try to source the completion script first by typing the original
# command, then <tab> to trigger to script, and try again
if [ -d /usr/share/bash-completion/completions ]; then
   completionPath="/usr/share/bash-completion/completions"
   bin="$HOME/bin"

   # source $completionPath/pacman (_completion_loader pacman works too)
   # _completion_loader pacman
   source $completionPath/pacman
   source $completionPath/journalctl
   source $completionPath/git
   # source $completionPath/systemctl
   source $bin/completion-utils.sh
   source $bin/completion-wrapper.sh

   # Pacman
   complete -o default -F _pacman_S pac-install
   complete -o default -F _pacman_Q pac-remove
   complete -o default -F _pacman_Q pac-search
   complete -o default -F _pacman_S pac-Search
   complete -o default -F _pacman_S pac-info
   complete -o default -F _pacman_S pac-desc
   complete -o default -F _pacman_S pac-size
   complete -o default -F _pacman_S pac-dep

   complete -o default -F _pacman_S aur-install
   complete -o default -F _pacman_Q aur-remove
   complete -o default -F _pacman_Q aur-search
   complete -o default -F _pacman_Q aur-info
   complete -o default -F _pacman_Q aur-desc
   complete -o default -F _pacman_Q aur-size
   complete -o default -F _pacman_Q aur-dep

   # systemctl
   completion-wrapper _systemctl _sd-start  systemctl start  1> /dev/null
   completion-wrapper _systemctl _sd-stop   systemctl stop   1> /dev/null
   completion-wrapper _systemctl _sd-enable systemctl enable 1> /dev/null
   completion-wrapper _systemctl _sd-status systemctl status 1> /dev/null

   complete -o default -F _sd-start  sd-start
   complete -o default -F _sd-stop   sd-stop
   complete -o default -F _sd-enable sd-enable
   complete -o default -F _sd-status sd-status

   complete -o default -F _journalctl sd-log

   # git
   # git completion script already have its own function to set up completion
   # for functions or commands, so no need to use complete-wrapper function
   # see https://gist.github.com/JuggoPop/10706934
   __git_complete gstat      _git_status
   __git_complete gadd       _git_add
   __git_complete gcommit    _git_commit
   __git_complete glog       _git_log
   __git_complete glogstat   _git_log
   __git_complete glogdiff   _git_log
   __git_complete gpull      _git_pull
   __git_complete gpush      _git_push
   __git_complete gfixcommit _git_commit
   __git_complete gfixstage  _git_commit
   __git_complete gunstage   _git_reset
   __git_complete gswitch    _git_checkout
   __git_complete gnewbranch _git_branch
   __git_complete gmerge     _git_merge
   __git_complete gdiff      _git_diff

   # __git_complete gdelbranch __gitcomp
   complete -o default -F _git_branch_d gdelbranch
   complete -o default -F _git_log_S gscommit
fi

