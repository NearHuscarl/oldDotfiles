#!/bin/bash

# ============================================================================
# File:        install.sh
# Description: This script create symlinks from the ~/.config/ dir which 
#              point to the config locations in this repo
# Author:      Near Huscarl <near.huscarl@gmail.com>
# Last Change: Tue Sep 05 12:24:32 +07 2017
# Licence:     BSD 3-Clause license
# Note:        N/A
# ============================================================================

################# 
# misc function #
################# 

# copy from 
# https://github.com/paulirish/dotfiles/blob/master/symlink-setup.sh

# print output in red
print_error() {
   printf "\e[0;31m  [ ✖ ] $1 $2\e[0m\n"
}

# print output in blue
print_info() {
   printf "\n\e[0;34m  [ i ] $1\e[0m\n"
}

# print output in yellow
print_question() {
   printf "\e[0;33m  [ ? ] $1\e[0m"
}

# print output in green
print_success() {
   printf "\e[0;32m  [ ✔ ] $1\e[0m\n"
}

# arg 1: command to execute as normal but in format text
# arg 2: optional string for extra information
execute() {
   $1 &> /dev/null

   if [[ $? -eq 0 ]]; then
      print_success "$1"
      if [[ $# -eq 2 ]]; then
         print_success "$2"
      fi
      return 1
   else
      print_error "$1"
      if [[ $# -eq 2 ]]; then
         print_error "$2"
      fi
      return 0
   fi
}

print_choices_exist_symlink() {
   "path '$1' already exists\n \
      1 - backup and replace\n \
      2 - overwrite\n \
      3 - skip\n \
   Your choice. Your life: "
}

#############
# Variables #
#############

# config directory
config=$HOME/.config

# old dotfiles backup directory
dotfilesOld=$HOME/dotfilesOld

# list of files/folders to symlink
linkNames="compton.conf i3 ncmpcpp polybar rofi ../bin"

# store a list of strings to be execute as commands
declare -a result=()
# result=""

#############################
# symlink script start here #
#############################

# create dotfilesOld in $HOME
if [[ ! -d "$dotfilesOld" ]]; then
   print_info "Creating folder $dotfilesOld to store existing config files/folders"
   execute "mkdir -p $dotfilesOld"
fi

# loop through all files/folders to symlink to proper location, if files/folders
# already exists ask whether to overwrite, backup, or skip to the next files/folders

option=""

for file in $linkNames; do

   source="$(pwd)/$file"
   echo $result
   target="$config/$file"

   if [[ -e "$target" ]]; then 

      # find existed $file in $config, ask for confirmation:
      #  -overwrite
      #  -backup
      #  -cancel

      # repeat the question if detect wrong input
      while [ "$option" != "1" ] && [ "$option" != "2" ] && [ "$option" != "3" ]; do
         print_choices_exist_symlink $target
         read -n 1 option

         if [[ "$option" == "1" ]]; then
            execute "mv $target $dotfilesOld"
            execute "ln -fs $source $target"
            [[ $? -eq 1 ]] \
               && result+=("print_success '$target → $source'") \
               || result+=("print_error '$target → $source'")
         elif [[ "$option" == "2" ]]; then

            print_question "Are you sure? (y/n)"
            read -n 1

            if [[ $REPLY =~ ^[yY]$ ]]; then
               execute "rm -rf $target"
               execute "ln -fs $source $target"
               [[ $? -eq 1 ]] \
                  && result+=("print_success '$target → $source'") \
                  || result+=("print_error '$target → $source'")
            else
               print_info "Canceled overwrite operation"
               continue
            fi

         elif [[ "$option" == "3" ]]; then
            print_info "Skip making symlink from "$source" to "$target""
            result+=("print_error '$target → $source'")
            break
         else
            print_error "$option is an invalid option"
         fi
      done
      option=0

   else
      execute "ln -fs $source $target"
      [[ $? -eq 1 ]] \
         && result+=("print_success '$target → $source'") \
         || result+=("print_error '$target → $source'")
   fi

done

# print result about symlink operation
if [[ ! -z "$result" ]]; then
   print_info "--RESULT--"
   for cmd in "${result[@]}"; do
      eval $cmd
   done
fi

# install_zsh () {
# # Test to see if zshell is installed.  If it is:
# if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
#     # Clone my oh-my-zsh repository from GitHub only if it isn't already present
#     if [[ ! -d $dotfiles/oh-my-zsh/ ]]; then
#         git clone http://github.com/robbyrussell/oh-my-zsh.git
#     fi
#     # Set the default shell to zsh if it isn't currently set to zsh
#     if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
#         chsh -s $(which zsh)
#     fi
# else
#     # If zsh isn't installed, get the platform of the current machine
#     platform=$(uname);
#     # If the platform is Linux, try an apt-get to install zsh and then recurse
#     if [[ $platform == 'Linux' ]]; then
#         if [[ -f /etc/redhat-release ]]; then
#             sudo yum install zsh
#             install_zsh
#         fi
#         if [[ -f /etc/debian_version ]]; then
#             sudo apt-get install zsh
#             install_zsh
#         fi
#     # If the platform is OS X, tell the user to install zsh :)
#     elif [[ $platform == 'Darwin' ]]; then
#         echo "Please install zsh, then re-run this script!"
#         exit
#     fi
# fi
# }

# install_zsh
