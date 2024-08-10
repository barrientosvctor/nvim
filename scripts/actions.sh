#!/bin/bash

update="$1" || "0"

if [[ $update -eq "1" ]];
then
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    nvim --headless +PlugInstall +qa
elif [[ $update -eq "2" ]];
then
    git submodule update --remote
elif [[ $update -eq "3" ]];
then
    git submodule deinit --all
else
    echo "Wrong option."
    echo "1. Install modules"
    echo "2. Update modules"
    echo "3. Uninstall modules"
fi
