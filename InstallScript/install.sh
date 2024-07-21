#!/usr/bin/env bash
# Script by UntitledHam

DOTFILES_DIR=$HOME/dotfiles

read -p "Are you sure you want to continue? [y/N] " prompt
if [[ $prompt == "y" && $prompt == "Y" && $prompt == "yes" && $prompt == "Yes" ]] ; then
  echo "Alright, exiting..."
  exit 0
fi

echo "Starting Installation..." 

# Backup .zshrc if it exists and then replace it with the new .zshrc
if test -f $HOME/.zshrc; then
  echo ".zshrc found, backing up..."
  mv $HOME/.zshrc $HOME/.zshrc-backup
fi
echo "Copying over new .zshrc..."
cp $DOTFILES_DIR/.zshrc $HOME/.

# Loop through contents of ~/dotfiles/.config/ 
# If match exists in ~/.config 
#   move dirname {direname}-backup 
# Copy over contents of ~/dotfiles/.config/. to ~/.config/. 
for dir in $DOTFILES_DIR/.config/* ; do
  current_dir=$(basename $dir)

  if [ -d "$dir" ] && test -d $HOME/.config/$current_dir ; then 
    echo "$current_dir is a directory and exists in .config, backing up..."
    mv $HOME/.config/$current_dir $HOME/.config/"$current_dir-backup"
    

  elif [ -f "$dir" ] && test -f $HOME/.config/$current_dir ; then 
    echo "$current_dir is a file and exists in .config, backing up..."
  fi
  
done

echo "Copying over .config contents..."
cp -r $DOTFILES_DIR/.config/. $HOME/.config/.

echo "Installing fonts..."

mkdir -p /usr/share/fonts/TTF 
cp -r $DOTFILES_DIR/Fonts/. /usr/share/fonts/TTF/.

# If wallpaper folder is found copy new wallpapers into it instead
if test -d $HOME/Pictures/wallpapers; then
  echo "Wallpapers folder found."
  
  read -p "Would you like to copy over the included wallpapers into you wallpapers folder? [Y/n] " prompt
  if [[ $prompt == "n" || $prompt == "N" || $prompt == "no" || $prompt == "No" ]] then
    echo "Alright, skipping..."
  else
    cp -r $DOTFILES_DIR/Pictures/wallpapers/. $HOME/Pictures/wallpapers/. 
    echo "Wallpapers copied over."
  fi
# Wallpaper folder is not found, just copy over the whole folder.
else 
  cp -r $DOTFILES_DIR/Pictures/wallpapers $HOME/Pictures/. 
fi

# Install the packages from pkglist.txt
read -p "Would you like to install the required packages [Y/n] " prompt 
if [[ $prompt == "n" || $prompt == "N" || $prompt == "no" || $prompt == "No" ]] then 
  echo "Alright, skipping package installation..."
else
  if ! command -v yay &> /dev/null
  then
    echo "yay not detected, installing yay..."
    pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
  fi

  echo "Installing pacman packages..." 
  installable_packages=$(comm -12 <(pacman -Slq | sort) <(sort $DOTFILES_DIR/InstallScript/pkglist.txt))
  pacman -S --needed $installable_packages




  sudo pacman -S - < $DOTFILES_DIR/InstallScript/pkglist.txt

fi

echo "Switching default shell to ZSH..."
csh -s /usr/bin/zsh 

# Reboot to apply changes
read -p "Installation Completed, would you like to restart? [Y/n] " prompt 
if [[ $prompt == "n" || $prompt == "N" || $prompt == "no" || $prompt == "No" ]] ; then 
  echo "Just a warning: Not all changes will be applied until you reboot."
  exit 0
else 
  reboot
fi
