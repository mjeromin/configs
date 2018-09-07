# .bashrc

# Source global definitions
[ -f /etc/bashrc ] && . /etc/bashrc

# disable bash history for now, we won't need the clutter from bashrc
set +o history

export PATH=~/bin:~/.linuxbrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# multiline commands saved in history as oneliners
shopt -s cmdhist

# restrictive file permissions
umask 027

# aliases, functions, environment, and prompt
[ -f ~/.bash_alias ] && . ~/.bash_alias
[ -f ~/.bash_func ] && . ~/.bash_func
[ -f ~/.bash_env ] && . ~/.bash_env
[ -f ~/.bash_prompt ] && . ~/.bash_prompt || PS1="[\u@\h:\w ] $ "

# tab autocomplete for sudo
complete -cf sudo

# tab autocomplete for kubectl
[ -f ~/.kube/completion.bash.inc ] && . ~/.kube/completion.bash.inc

# turn bash history back on
set -o history
