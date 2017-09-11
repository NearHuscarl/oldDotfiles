#!/bin/bash

# ============================================================================
# File:        completion-utils.sh
# Description: Extra completion functions for specific cases (command + flag)
# Author:      Near Huscarl <near.huscarl@gmail.com>
# Last Change: Mon Sep 11 13:45:32 +07 2017
# Licence:     BSD 3-Clause license
# Note:        N/A
# ============================================================================

completionPath="/usr/share/bash-completion/completions"

# /usr/share/bash-completion/completions/pacman
if [[ -f $completionPath/pacman ]]; then
   # pacman -S completion function
   _pacman_S() {
      local cur prev
      _get_comp_words_by_ref cur prev
      _pacman_pkg Slq
   }

   _pacman_Q() {
      local cur prev
      _get_comp_words_by_ref cur prev
      _pacman_pkg Qq
   }

   # _pacman_S() {
   #    local common core cur prev o
   #    COMPREPLY=()
   #    _get_comp_words_by_ref cur prev

   #    if [[ $? != 0 ]]; then
   #       _arch_ptr2comp core
   #    elif [[ ! $prev =~ ^-\w*[Vbhr] &&
   #       ! $prev = --@(cachedir|color|config|dbpath|help|hookdir|gpgdir|logfile|root|version) ]]
   #    then
   #       [[ $cur = -* ]] && _arch_ptr2comp ${o#* } common ||
   #          { _arch_incomp 'g groups' && _pacman_pkg Sg; }      ||
   #          { _arch_incomp 'l list'   && _pacman_pkg Sl sort; } ||
   #            _pacman_pkg Slq
   #    fi
   # }
fi

if [[ -f $completionPath/journalctl ]]; then
   _journalctl_u() {
        local field_vals= cur=${COMP_WORDS[COMP_CWORD]} prev=${COMP_WORDS[COMP_CWORD-1]}
        local -A OPTS=(
                [STANDALONE]='-a --all --full --system --user
                              --disk-usage -f --follow --header
                              -h --help -l --local --new-id128 -m --merge --no-pager
                              --no-tail -q --quiet --setup-keys --this-boot --verify
                              --version --list-catalog --update-catalog --list-boots
                              --show-cursor --dmesg -k --pager-end -e -r --reverse
                              --utc -x --catalog --no-full --force --dump-catalog
                              --flush --rotate --sync --no-hostname'
                       [ARG]='-b --boot --this-boot -D --directory --file -F --field
                              -M --machine -o --output -u --unit --user-unit -p --priority
                              --vacuum-size --vacuum-time --vacuum-files'
                [ARGUNKNOWN]='-c --cursor --interval -n --lines -S --since -U --until
                              --after-cursor --verify-key -t --identifier
                              --root'
        )

        if __contains_word "$prev" ${OPTS[ARG]} ${OPTS[ARGUNKNOWN]}; then
                case $prev in
                        --boot|--this-boot|-b)
                                comps=$(journalctl -F '_BOOT_ID' 2>/dev/null)
                        ;;
                        --directory|-D)
                                comps=$(compgen -d -- "$cur")
                                compopt -o filenames
                        ;;
                        --file)
                                comps=$(compgen -f -- "$cur")
                                compopt -o filenames
                        ;;
                        --output|-o)
                                comps='short short-full short-iso short-precise short-monotonic short-unix verbose export json json-pretty json-sse cat'
                        ;;
                        --field|-F)
                                comps=$(journalctl --fields | sort 2>/dev/null)
			;;
                        --machine|-M)
                                comps=$( __get_machines )
                        ;;
                        --priority|-p)
                                comps=${__syslog_priorities[*]}
                        ;;
                        --unit|-u)
                                comps=$(journalctl -F '_SYSTEMD_UNIT' 2>/dev/null)
                        ;;
                        --user-unit)
                                comps=$(journalctl -F '_SYSTEMD_USER_UNIT' 2>/dev/null)
                        ;;
                        --identifier|-t)
                                comps=$(journalctl -F 'SYSLOG_IDENTIFIER' 2>/dev/null)
                        ;;
                        *)
                                return 0
                        ;;
                esac
                COMPREPLY=( $(compgen -W '$comps' -- "$cur") )
                return 0
        fi

        if [[ $cur = -* ]]; then
                COMPREPLY=( $(compgen -W '${OPTS[*]}' -- "$cur") )
                return 0
        elif [[ $cur = *=* ]]; then
                mapfile -t field_vals < <(journalctl -F "${prev%=}" 2>/dev/null)
                COMPREPLY=( $(compgen -W '${field_vals[*]}' -- "${cur#=}") )
        elif [[ $cur = /dev* ]]; then
                compopt -o filenames
                COMPREPLY=( $(compgen -f -- "${cur}") )
        elif [[ $cur = /* ]]; then
                # Append /dev/ to the list of completions, so that
                # after typing /<TAB><TAB> the user sees /dev/ as one
                # of the alternatives. Later on the rule above will
                # take care of showing device files in /dev/.
                mapfile -t field_vals < <(journalctl -F "_EXE" 2>/dev/null; echo '/dev/')
                COMPREPLY=( $(compgen -W '${field_vals[*]}' -- "${cur}") )
                if [[ "${COMPREPLY[@]}" = '/dev/' ]]; then
                    compopt -o filenames
                    COMPREPLY=( $(compgen -f -- "${cur}") )
                fi
        elif [[ $prev = '=' ]]; then
                mapfile -t field_vals < <(journalctl -F "${COMP_WORDS[COMP_CWORD-2]}" 2>/dev/null)
                COMPREPLY=( $(compgen -W '${field_vals[*]}' -- "$cur") )
        else
                mapfile -t field_vals < <(journalctl --fields 2>/dev/null)
                compopt -o nospace
                COMPREPLY=( $(compgen -W '${field_vals[*]}' -S= -- "$cur") )
        fi
   }
fi
