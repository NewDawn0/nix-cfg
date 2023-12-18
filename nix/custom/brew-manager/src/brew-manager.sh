#!/usr/bin/env bash
if [ "$1" == "install" ]; then
    sudo echo "Escalating privileges"
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "Successfully installed Homebrew";
elif [ "$1" == "uninstall" ]; then
    prefix="$(brew --prefix)"
    /usr/bin/sudo echo "Escalating privileges"
    brew ls --casks | xargs brew uninstall
    brew ls --formula | xargs brew uninstall
    brew tap | xargs brew untap
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall.sh)"
    sudo rm -rf ${prefix}/Caskroom/ ${prefix}/Homebrew/ ${prefix}/Cellar
    echo "Successfully uninstalled Homebrew";
else
    echo "Usage: $0 [install|uninstall]"
fi
