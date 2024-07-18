#!/usr/bin/env bash
# Script by UntitledHam

DOTFILES_DIR=$HOME/dotfiles

read -p "Are you sure you want to continue? [y/N] " prompt
if [[ $prompt == "y" && $prompt == "Y" && $prompt == "yes" && $prompt == "Yes" ]] ; then
  echo "Alright, exiting..."
  exit 0
fi

echo "Starting Installation..." 

# Backup .zshrc if it exists
if test -f $HOME/.zshrc; then
  echo ".zshrc found, backing up..."
  mv $HOME/.zshrc $HOME/.zshrc-backup
  echo "Copying over new .zshrc..."
  cp $DOTFILES_DIR/.zshrc $HOME/.
fi

for dir in $DOTFILES_DIR/.config/* ; do
  current_dir=$(basename $dir)

  if [ -d "$dir" ] && test -d $HOME/.config/$current_dir ; then 
    echo "$current_dir is a directory and exists in .config, backing up..."
    mv $HOME/.config/$current_dir $HOME/.config/"$current_dir-backup"
    echo "Copying over new $current_dir to .config..."
    cp -r $DOTFILES_DIR/.config/$current_dir $HOME/.config/.
    

  elif [ -f "$dir" ] && test -f $HOME/.config/$current_dir ; then 
    echo "$current_dir is a file and exists in .config, backing up..."
    mv $HOME/.config/$current_dir $HOME/.config/"$current_dir-backup"
    cp $DOTFILES_DIR/.config/$current_dir $HOME/.config/.
  fi
  
done

echo "Installing fonts..."
cp -r $DOTFILES_DIR/Fonts/. /usr/share/fonts/TTF/.

if test -d $HOME/Pictures/wallpapers; then
  echo "Wallpapers folder found."
  
  read -p "Would you like to copy over the included wallpapers into you wallpapers folder? [Y/n] " prompt
  if [[ $prompt == "n" || $prompt == "N" || $prompt == "no" || $prompt == "No" ]] then
    echo "Alright, skipping..."
  else
    cp -r $DOTFILES_DIR/Pictures/wallpapers/. $HOME/Pictures/wallpapers/. 
    echo "Wallpapers copied over."
  fi
fi

read -p "Would you like to install the required packages [Y/n] " prompt 
if [[ $prompt == "n" || $prompt == "N" || $prompt == "no" || $prompt == "No" ]] then 
  echo "Alright, skipping package installation..."
else
  sudo pacman -S - < pkglist.txt
fi


read -p "Installation Completed, would you like to restart? [Y/n] " prompt 
if [[ $prompt == "n" || $prompt == "N" || $prompt "no" | $prompt == "No" ]] then 
  echo "Just a warning: Not all changes will be applied until you reboot."
  exit 0
else 
  reboot
fi



# Copy new .zshrc over

# Loop through contents of ~/dotfiles/.config/ 
# If match exists in ~/.config 
#   mv dirname {direname}-backup 
# Copy over contents of ~/dotfiles/.config/. to ~/.config/. 

# Repeat for Pictures/wallpapers folder
# If wallpaper folder is found copy new wallpapees into it instead

# Install packages from pkglist.txt
# pacman -S - < pkglist.txt
