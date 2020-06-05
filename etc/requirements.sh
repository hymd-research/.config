#!/usr/local/bin/zsh

if [ ! -d "${HOME}"/.cache/dein ]; then
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ./installer.sh
    sh ./installer.sh "${HOME}/.cache/dein"
    rm ./installer.sh
fi

