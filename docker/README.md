# VPS initialization script

## 1. Machine Initialization
```bash
sudo hostnamectl set-hostname pp-cloud

sudo apt-get update
sudo apt-get install -y curl vim tmux
curl -L https://github.com/PPKan/personal_configs/raw/refs/heads/main/.tmux.conf -o ~/.tmux.conf
curl -L https://github.com/PPKan/personal_configs/raw/refs/heads/main/.vimrc -o ~/.vimrc
```

## 2. Install Tailscale

```bash
curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up --ssh
```

then modify AWS EC2 Security Group to allow SSH from Tailscale (UDP 41641)

## 3. Install Docker

```bash
#!/bin/bash
mkdir ~/workspace
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

## 4. Clone and Run Codex (or other docker compose projects)

```bash
#!/bin/bash
cd workspace
git clone --depth 1 --filter=blob:none --sparse https://github.com/PPKan/personal_configs.git
cd personal_configs
git sparse-checkout set docker/node-codex
cd docker/node-codex
```

```bash
sudo docker compose up -d
```
