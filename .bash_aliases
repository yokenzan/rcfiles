shopt -s expand_aliases

# rm
alias rm='rm -i'

# less
alias l='less'

# ls
alias ls='ls -hFG'
alias ll='ls -lA'
alias lla='ls -la'

# ls with less
alias lll='ll --color=always | l -RNSJFX'
alias llal='lla --color=always | l -RNSJFX'

# iconv
alias j2u='iconv -f cp932 -t utf-8'
alias u2j='iconv -t cp932 -f utf-8'

# cd
alias ..='cd ..'
alias ...='cd ../..'
alias -- -='cd -'

# pushd / popd
alias pd='pushd'
alias ppd='popd'

# Vim

alias v='vim'
alias vo='vim -O'
alias vs='vim -S Session.vim'
alias vu='vim -u NONE -N'
alias vq='vim -c :q'
alias v-='vim -'

# PHP

alias art='php artisan'
alias comp='composer'

# Git

# add
alias ga='git add'
alias gaa='git add -A'
# commit
alias gc='git commit'
alias gca='git commit -a'
# config
alias gcg='git config --global'
alias gcgl='git config --global -l'
alias gcl='git config --local'
alias gcll='git config --local -l'
# diff
alias gd='git diff'
alias gdc='gd --cached'
alias gdw='gd --word-diff'
# log
alias gl='git log'
alias glo='git log --oneline'
alias glp='git log -p'
alias gls='git log --stat'
alias glw='git log --word-diff'
# others
alias gb='git branch'
alias gp='git pull'
alias gs='git status'
alias gc-='git checkout -'
alias gm-='git merge -'
