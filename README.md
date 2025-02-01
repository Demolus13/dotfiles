# Ubuntu-24.04

### Prerequisites

1. Ensure you have `git`, `curl`, `gpg`, `make` and `gawk` installed:

    ```sh
    sudo apt update
    sudo apt install git curl gpg make gawk
    sudo add-apt-repository universe
    sudo apt install gnome-tweaks
    sudo apt install gnome-shell-extensions-manager
    ```

2. Install Evolve GTK Theme Manager:

    ```sh
    unzip ~/.dotfiles/Evolve-v1.6.1BLD163-PublicRelease.zip -d ~/.dotfiles
    cd ~/.dotfiles/Evolve-v1.6.1BLD163-PublicRelease/
    ./install.sh
    cd
    rm -rf ~/.dotfiles/Evolve-v1.6.1BLD163-PublicRelease
    ```

3.  Install JetBrainsMono Nerd Font:

    ```sh
    wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip \
    && cd ~/.local/share/fonts \
    && unzip JetBrainsMono.zip \
    && rm JetBrainsMono.zip \
    && fc-cache -fv
    cd
    ```

### Install Ghostty Terminal:

1. Run the installation script:

    ```sh
    source /etc/os-release
    GHOSTTY_DEB_URL=$(
    curl -s https://api.github.com/repos/mkasberg/ghostty-ubuntu/releases/latest | \
    grep -oP "https://github.com/mkasberg/ghostty-ubuntu/releases/download/[^\s/]+/ghostty_[^\s/_]+_amd64_${VERSION_ID}.deb"
    )
    GHOSTTY_DEB_FILE=$(basename "$GHOSTTY_DEB_URL")
    curl -LO "$GHOSTTY_DEB_URL"
    sudo dpkg -i "$GHOSTTY_DEB_FILE"
    rm "$GHOSTTY_DEB_FILE"
    ```

2. Copy the ghostty config:

    ```sh
    mkdir -p ~/.config/ghostty
    cp ~/.dotfiles/.config/ghostty/config ~/.config/ghostty/config
    ```

### Install Oh-My-Bash

1. Run the installation script:

    ```sh
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
    ```

2. Copy the template `.bashrc` to your home directory:

    ```sh
    cp ~/.dotfiles/.bashrc ~/.bashrc
    ```

### Install Starship

1. Run the installation script:

    ```sh
    sudo sh -c "$(curl -fsSL https://starship.rs/install.sh)"
    echo 'eval "$(starship init bash)"' | sudo tee -a /root/.bashrc
    ```

2. Copy the template `starship.toml` to your home directory:

    ```sh
    cp ~/.dotfiles/.config/starship.toml ~/.config/starship.toml
    sudo mkdir -p /root/.config/
    sudo cp ~/.config/starship.toml /root/.config/
    ```

### Install Tmux

1. Run the installation script:

    ```sh
    sudo apt install tmux
    ```

2. Clone the Tmux Plugin Manager:

    ```sh
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    ```

3. Copy the template `.tmux.conf` to your home directory:

    ```sh
    cp ~/.dotfiles/.tmux.conf ~/.tmux.conf
    ```

### Install FZF

1. Run the installation script:

    ```sh
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
    ```

### Install Bat

1. Run the installation script:

    ```sh
    sudo apt install bat
    ```

2. Create a symbolic link to `batcat`:

    ```sh
    mkdir -p ~/.local/bin
    ln -s /usr/bin/batcat ~/.local/bin/bat
    ```

3. Configure Tokyo Night theme:

    ```sh
    mkdir -p "$(batcat --config-dir)/themes"
    echo '--theme="tokyonight_night"' >> "$(batcat --config-dir)/config"
    cp ~/.dotfiles/.config/bat/themes/tokyonight_night.tmTheme ~/.config/bat/themes/tokyonight_night.tmTheme
    ```

4. Build the bat cache:

    ```sh
    bat cache --build
    ```

### Install Eza

1. Run the installation script:

    ```sh
    sudo mkdir -p /etc/apt/keyrings/
    wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
    echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
    sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
    sudo apt update
    sudo apt install -y eza
    ```

2. Copy the Tokyo Night theme:

    ```sh
    mkdir ~/.config/eza
    sudo cp ~/.dotfiles/.config/eza/theme.yml ~/.config/eza/theme.yml
    ```

### Install Blesh

1. Run the installation script:

    ```sh
    git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
    make -C ble.sh install PREFIX=~/.local
    ```

2. Copy `.blerc` to your home directory:

    ```sh
    cp ~/.dotfiles/.blerc ~/.blerc
    ```

### Install Neovim

1. Run the installation script:

    ```sh
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
    sudo rm -rf /opt/nvim
    sudo tar -C /opt -xzf nvim-linux64.tar.gz
    ```

2. Copy `nvim` to your home directory:

    ```sh
    cp ~/.dotfiles/.config/nvim -r ~/.config
    ```

### Install Tokyonight Theme

1. Extract the theme:

    ```sh
    mkdir -p ~/.themes
    unzip ~/.dotfiles/Tokyonight-Dark-BL-MB.zip -d ~/.themes
    ```

### Install WhiteSur Icon Theme

1. Extract the theme:

    ```sh
    git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git ~/.dotfiles
    ~/.dotfiles/WhiteSur-icon-theme/install.sh
    rm -rf ~/.dotfiles/WhiteSur-icon-theme
    ```

### Install Bibata Cursor Theme

1. Extract the theme:

    ```sh
    mkdir -p ~/.icons
    tar -xvf ~/.dotfiles/Bibata_Modern-Classic.tar.xz -C ~/.icons
    ```
