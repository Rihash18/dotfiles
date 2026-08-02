#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

create_backup() {
    local name="$1"
    if [[ -d "$HOME/.config/${name}/" ]]; then
        echo "Existing $name config found."
        echo "Creating backup folder...."

        [[ -d "$HOME/.config/${name}.bak" ]] || mv "$HOME/.config/${name}" "$HOME/.config/${name}.bak"

        printf "\nBackup created: %s\n" "$HOME/.config/${name}.bak"
    fi
}

install_config() {
    local name="$1"
    create_backup "$name"

    SCRIPT_DIR=$( cd -- "$(dirname "${BASH_SOURCE[0]}")" && pwd )

    cp -r "SCRIPT_DIR/${name}/" "$HOME/.config/"
    printf "\n${name} Installed successfully ....\n\n"
}

while true; do

    printf "\nWhat do you want to install?\n"
    echo "1.Nvim"
    echo "2.Fastfetch"
    echo "3.Kitty"
    echo "4.All"
    echo "5.Exit"

    read -p "\nEnter Your Choice : " choice

    case $choice in
    1)
        install_config "nvim"
        exit 0
        ;;
    2)
        install_config "fastfetch"
        exit 0
        ;;
    3)
        install_config "kitty"
        exit 0
        ;;
    4)
        install_config "nvim"
        install_config "fastfetch"
        install_config "kitty"
        exit 0
        ;;
    5)
        echo "Exit"
        exit 0
        ;;
    *)
        #wrong choice
        echo "Enter correct choice...."
        ;;
    esac

done
