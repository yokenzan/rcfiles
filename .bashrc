# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return


#
# History Options
#

# Don't put duplicate lines in the history.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}erasedups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls:ll:lla:e:v:vs:gs:r:git push:gp' # Ignore the ls command as well

function share_history {
    history -a
    history -c
    history -r
}
export PROMPT_COMMAND='share_history'
shopt -u histappend
export HISTSIZE=100000


#
# Functions
#

# Some people use a different file for functions
if [ -f "${HOME}/.bash_functions" ]; then
  source "${HOME}/.bash_functions"
fi


#
# Aliases
#

# Some people use a different file for aliases
if [ -f "${HOME}/.bash_aliases" ]; then
  source "${HOME}/.bash_aliases"
fi


#
# Setting prompt
#


# detect Git state in current directory

source $HOME/.config/git/completion/git-prompt.sh
source $HOME/.config/git/completion/git-completion.bash
GIT_PS1_SHOWUNTRACKEDFILES=1    # %
GIT_PS1_SHOWDIRTYSTATE=1        # * / +
GIT_PS1_SHOWSTASHSTATE=1        # $
GIT_PS1_SHOWUPSTREAM=1          # < / > / = / <>


# define basical prompt

PS1='\n\[\033[31;4m\]\D{%Y/%m/%d %H:%M:%S}\[\033[00m\] \[\033[31m\]\u@\h\[\033[00m\] '


# detect whether current process is whithin a Vim session

if [[ $VIMRUNTIME != "" ]] ; then
    PS1=$PS1' \[\033[5;1;34m\](vim)\[\033[00m\] '
fi

PS1=$PS1'\[\033[3;33;4m\]\w\[\033[00m\]\[\033[35m\]$(__git_ps1)\[\033[00m\]\n\[\033[36m\]$(whoami) Kizuna-VM'

# confirm prompt

export PS1=$PS1' \$\[\033[00m\] '

stty stop undef
export EDITOR=vim


export LANG=en_US.UTF-8
