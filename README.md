# PP's Personal Configurations

## For any general Virtual Machines

### Requirements

None

### Installation

1. Clone the repo the move `.tmux.conf` and `.vimrc` to HOME
2. Add script to `.zshrc` or `.bashrc` to start tmux on default
```
if [ -z "$TMUX" ]; then
  tmux attach -t default || tmux new -s default
fi
```
3. Done

## For Developing Machines (Debian)

### Neovim Installation

1. Install Nvim requirements

```
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip neovim
```

2. Visit [PPKan/kickstart.nvim][https://github.com/PPKan/kickstart.nvim]
3. Clone Nvim repo

```
git clone https://github.com/PPKan/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

### Tmux installation

1. Clone the repo and move `.tmux.conf.plug` to HOME
2. Run the command to download theme
```
mkdir -p ~/.config/tmux/plugins/catppuccin
git clone -b v2.1.3 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
```
3. Change `~/.config/tmux/plugins/catppuccin/tmux/catppuccin_options_tmux.conf` `window_text` and `current_text` to `#W` in order to display window

## For Developing Machines (Windows)

### Neovim Installation

1. Open a elevated PowerShell
2. Install choco and nvim dependencies

```powershell
winget install --accept-source-agreements chocolatey.chocolatey
choco install -y neovim git ripgrep wget fd unzip gzip mingw make
```

3. Visit [PPKan/kickstart.nvim][https://github.com/PPKan/kickstart.nvim]
4. Clone Nvim repo

```
git clone https://github.com/PPKan/kickstart.nvim.git $env:LocalAppData\nvim
```

### Tmux Installation

https://cheatography.com/martinthogersen/cheat-sheets/windows-terminal/
