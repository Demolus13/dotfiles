#!/bin/bash

# Check if .dotfiles directory exists, else clone it
if [ ! -d "$HOME/.dotfiles" ]; then
    git clone https://github.com/Demolus13/dotfiles.git ~/.dotfiles
fi

# Prerequisites
sudo apt update
sudo apt install git curl gpg make gawk
sudo add-apt-repository universe
sudo apt install gnome-tweaks
sudo apt install gnome-shell-extension-manager

# Install Evolve GTK Theme Manager
unzip ~/.dotfiles/Evolve-v1.6.1BLD163-PublicRelease.zip -d ~/.dotfiles
cd ~/.dotfiles/Evolve-v1.6.1BLD163-PublicRelease/
./install.sh
cd
rm -rf ~/.dotfiles/Evolve-v1.6.1BLD163-PublicRelease

# Install JetBrainsMono Nerd Font
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip \
    && cd ~/.local/share/fonts \
    && unzip JetBrainsMono.zip \
    && rm JetBrainsMono.zip \
    && fc-cache -fv
cd

# Install Ghostty Terminal
source /etc/os-release
GHOSTTY_DEB_URL=$(
curl -s https://api.github.com/repos/mkasberg/ghostty-ubuntu/releases/latest | \
grep -oP "https://github.com/mkasberg/ghostty-ubuntu/releases/download/[^\s/]+/ghostty_[^\s/_]+_amd64_${VERSION_ID}.deb"
)
GHOSTTY_DEB_FILE=$(basename "$GHOSTTY_DEB_URL")
curl -LO "$GHOSTTY_DEB_URL"
sudo dpkg -i "$GHOSTTY_DEB_FILE"
rm "$GHOSTTY_DEB_FILE"
mkdir -p ~/.config/ghostty
cp ~/.dotfiles/.config/ghostty/config ~/.config/ghostty/config

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
batcat cache --build

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

# Install Neovim
curl -LO https://github.com/neovim/neovim/releases/download/v0.10.0/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
cp ~/.dotfiles/.config/nvim -r ~/.config
rm -rf nvim-linux64.tar.gz

# Install Tokyonight Theme
mkdir -p ~/.themes
unzip ~/.dotfiles/Tokyonight-Dark-BL-MB.zip -d ~/.themes

# Install WhiteSur Icon Theme
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git ~/.dotfiles/Whitesur-icon-theme
~/.dotfiles/WhiteSur-icon-theme/install.sh
rm -rf ~/.dotfiles/WhiteSur-icon-theme

# Install Bibata Cursor Theme
mkdir -p ~/.icons
tar -xvf ~/.dotfiles/Bibata_Modern-Classic.tar.xz -C ~/.icons
