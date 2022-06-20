#!/usr/bin/env bash

files=( "$PWD/wallpapers/"*.png )

PS3='Select file to upload, or 0 to exit: '
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
