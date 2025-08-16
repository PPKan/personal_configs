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

## For Developing Machines

### Neovim Installation

1. Visit [PPKan/kickstart.nvim][https://github.com/PPKan/kickstart.nvim]

2. Install Nvim requirements
```
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip neovim
```

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
