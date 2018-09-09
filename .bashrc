# .bashrc
#
# shell options and environment setup
#
# This is free and unencumbered software released into the public domain.

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# disable bash history for now, we won't need the bashrc clutter
set +o history

# Source global definitions
[ -f /etc/bashrc ] && . /etc/bashrc

# set our path to available commands
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
[ -d ~/.linuxbrew/bin ] && export PATH=~/.linuxbrew/bin:${PATH}
[ -d ~/bin ] && export PATH=~/bin:${PATH}

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# multiline commands saved in history as oneliners
shopt -s cmdhist

# enable extended globbing
#   Composite patterns may be formed using  one  or  more  of  the following sub-patterns:
#
#      ?(pattern-list)
#             Matches zero or one occurrence of the given patterns
#      *(pattern-list)
#             Matches zero or more occurrences of the given patterns
#      +(pattern-list)
#             Matches one or more occurrences of the given patterns
#      @(pattern-list)
#             Matches one of the given patterns
#      !(pattern-list)
#             Matches anything except one of the given patterns
#
#  * https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
#  * https://www.linuxjournal.com/content/bash-extended-globbing
#  * http://mywiki.wooledge.org/glob#extglob
shopt -s extglob

# Umask
#
# the default is usually 022, removing write perms to group + others.
# A more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077
[ -e ~/.paranoid ] && umask 077 || umask 027

# Disable core files
ulimit -S -c 0 > /dev/null 2>&1

# aliases, functions, environment, and prompt
[ -f ~/.bash_alias ] && . ~/.bash_alias
[ -f ~/.bash_func ] && . ~/.bash_func
[ -f ~/.bash_env ] && . ~/.bash_env
[ -f ~/.bash_prompt ] && . ~/.bash_prompt || PS1="[\u@\h:\w ] $ "

# enable programmable completion enhancements
[ -f /etc/bash_completion ] && . /etc/bash_completion

# tab autocomplete for sudo
complete -cf sudo

# tab autocomplete for kubectl
[ -f ~/.kube/completion.bash.inc ] && . ~/.kube/completion.bash.inc

# turn bash history back on
set -o history
