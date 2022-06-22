#!/usr/bin/env bash

echo "Make sure to update home.nix file before continuing"
sleep 5
clear

echo "Updating dependencies..."
sleep 1

./update-dependencies.sh
sleep 1

echo "Switching config..."
sleep 1
./switch.sh
sleep 1


echo "Starting wallpaper selection"
sleep 2
clear
files=( "$PWD/wallpapers/"* )

PS3='Select a wallpaper, or 0 to exit: '
select file in "${files[@]}"; do
    if [[ $REPLY == "0" ]]; then
        echo 'Bye!' >&2
        exit
    elif [[ -z $file ]]; then
        echo 'Invalid choice, try again' >&2
    else
        break
    fi
done

cp $file $HOME/.background-image

echo "Changing wallpaper... (this will fail on a non-gnome de)"
gsettings set org.gnome.desktop.background picture-uri file:///home/$USER/.background-image
gsettings set org.gnome.desktop.background picture-uri-dark file:///home/$USER/.background-image
