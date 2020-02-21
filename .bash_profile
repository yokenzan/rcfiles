# .bash_profile

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# PATH config
 
PATH=$PATH:$HOME/bin:$HOME/usr/local/bin
# python-pip libraries
PATH=$PATH:$HOME/.local/bin

export PATH
