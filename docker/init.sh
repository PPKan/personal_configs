#!/bin/bash

# 1. Machine Initialization
echo "1. Machine Initialization"
sudo hostnamectl set-hostname pp-cloud

sudo apt-get update
sudo apt-get install -y curl vim tmux
curl -L https://github.com/PPKan/personal_configs/raw/refs/heads/main/.tmux.conf -o ~/.tmux.conf
curl -L https://github.com/PPKan/personal_configs/raw/refs/heads/main/.vimrc -o ~/.vimrc

# 2. Install Tailscale
echo "2. Install Tailscale"
curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up --ssh
echo "NOTE: After the authorization, modify AWS EC2 Security Group to allow SSH from Tailscale (UDP 41641)"

# 3. Install Docker
echo "3. Install Docker"
mkdir -p ~/workspace
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# 4. Clone and Run Codex
echo "4. Clone and Run Codex"
cd ~/workspace
git clone --depth 1 --filter=blob:none --sparse https://github.com/PPKan/personal_configs.git
cd personal_configs
git sparse-checkout set docker/node-codex
cd docker/node-codex

sudo docker compose up -d
