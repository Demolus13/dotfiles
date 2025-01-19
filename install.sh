#!/bin/bash

# Prerequisites
sudo apt update
sudo apt install git curl gpg make gawk
sudo add-apt-repository universe
sudo apt install gnome-tweaks
sudo apt install gnome-shell-extensions-manager

# Install JetBrainsMono Nerd Font
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip \
    && cd ~/.local/share/fonts \
    && unzip JetBrainsMono.zip \
    && rm JetBrainsMono.zip \
    && fc-cache -fv

# Install Evolve GTK Theme Manager
unzip ~/.dotfiles/Evolve-v1.6.1BLD163-PublicRelease.zip -d ~/.dotfiles
~/.dotfiles/Evolve-v1.6.1BLD163-PublicRelease/install.sh
rm -rf ~/.dotfiles/Evolve-v1.6.1BLD163-PublicRelease

# Install Oh-My-Bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
cp ~/.dotfiles/.bashrc ~/.bashrc

# Install Starship
sudo sh -c "$(curl -fsSL https://starship.rs/install.sh)"
echo 'eval "$(starship init bash)"' | sudo tee -a /root/.bashrc
cp ~/.dotfiles/.config/starship.toml ~/.config/starship.toml
sudo mkdir -p /root/.config/
sudo cp ~/.config/starship.toml /root/.config/

# Install Tmux
sudo apt install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp ~/.dotfiles/.tmux.conf ~/.tmux.conf

# Install FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Install Bat
sudo apt install bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
mkdir -p "$(batcat --config-dir)/themes"
echo '--theme="tokyonight_night"' >> "$(batcat --config-dir)/config"
cp ~/.dotfiles/.config/bat/themes/tokyonight_night.tmTheme ~/.config/bat/themes/tokyonight_night.tmTheme
bat cache --build

# Install Eza
sudo mkdir -p /etc/apt/keyrings/
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza
mkdir ~/.config/eza
sudo cp ~/.dotfiles/.config/eza/theme.yml ~/.config/eza/theme.yml

# Install Blesh
git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local
cp ~/.dotfiles/.blerc ~/.blerc

# Install Tokyonight Theme
mkdir -p ~/.themes
unzip ~/.dotfiles/Tokyonight-Dark-BL-MB.zip -d ~/.themes

# Install WhiteSur Icon Theme
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git ~/.dotfiles
~/.dotfiles/WhiteSur-icon-theme/install.sh
rm -rf ~/.dotfiles/WhiteSur-icon-theme

# Install Bibata Cursor Theme
mkdir -p ~/.icons
tar -xvf ~/.dotfiles/Bibata_Modern-Classic.tar.xz -C ~/.icons
