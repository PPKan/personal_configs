# VPS initialization script

To initialize a new VPS quickly, run:
```bash
curl -fsSL https://raw.githubusercontent.com/PPKan/personal_configs/main/docker/init.sh | bash
```

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

After the authorization, modify AWS EC2 Security Group to allow SSH from Tailscale (UDP 41641)

## 3. Install Docker

```bash
mkdir -p ~/workspace
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

## 4. Clone and Run Codex (or other docker compose projects)

```bash
tmpdir=$(mktemp -d)
git clone --depth 1 --filter=blob:none --sparse https://github.com/PPKan/personal_configs.git "$tmpdir"
cd "$tmpdir"
git sparse-checkout set docker/node-codex
cp -a docker/node-codex/. ~/workspace/
cd ~
rm -rf "$tmpdir"
```

```bash
cd ~/workspace
sudo docker compose up -d
sudo docker compose exec codex-agent bash
```
