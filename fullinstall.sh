#!/usr/bin/env bash

clear
echo "This is a a installer for nixos. Please mount and format your disks before proceding. DO NOT generate configuration file, that is done by the script.
      Once this script is finished running reboot and login with password 'nixos'"
sleep 5

clear
echo "Running nixos-generate-config --root /mnt"
sleep 1
nixos-generate-config --root /mnt

cp configuration.nix /etc/nixos/configuration.nix

clear
echo "Running nixos-install command. You will be asked to create a root password."
sleep 2
nixos-install

echo "Install completed. Please reboot, and git clone this repo again in your newly installed system and run the install.sh file."
