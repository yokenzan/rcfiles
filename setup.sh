#!/bin/bash

# install lacked dependencies

lacked=''

for package in curl git tig xsel vim tree; do
    if [[ $(which $package) = '' ]]; then
        lacked="$lacked $package"
    fi
done

if [[ ! $lacked = '' ]]; then
    sudo apt install -y $lacked
fi

# Bash

ln -sf $(pwd)/.bashrc             $HOME
ln -sf $(pwd)/.bash_profile       $HOME
ln -sf $(pwd)/.bash_aliases       $HOME
ln -sf $(pwd)/.bash_functions     $HOME

# Readline, Editline

ln -sf $(pwd)/.inputrc            $HOME
ln -sf $(pwd)/.editrc             $HOME

# Git

mkdir -p ~/.config/git/completion
cd ~/.config/git/completion

GIT_VERSION=v$(git --version | sed -e ' s/.* //')

curl -sS -O https://raw.githubusercontent.com/git/git/$GIT_VERSION/contrib/completion/git-completion.bash
curl -sS -O https://raw.githubusercontent.com/git/git/$GIT_VERSION/contrib/completion/git-prompt.sh

# Tig

ln -sf $(pwd)/.tigrc              $HOME
cp -f  $(pwd)/.gitconfig.example  $HOME/.gitconfig

# Vim

mkdir -p $HOME/.vim/{undo,backup,swap}

ln -sf $(pwd)/.vimrc              $HOME
ln -sf $(pwd)/.vimrc.colorscheme  $HOME
