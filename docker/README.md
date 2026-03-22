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

## 4.a Clone and Run Codex

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

## 4.b Clone and Run OpenClaw

```bash
tmpdir=$(mktemp -d)
git clone --depth 1 --filter=blob:none --sparse https://github.com/PPKan/personal_configs.git "$tmpdir"
cd "$tmpdir"
git sparse-checkout set docker/node-openclaw
cp -a docker/node-openclaw/. ~/workspace/
cd ~
rm -rf "$tmpdir"
```

```bash
cd ~/workspace
sudo docker compose up -d
sudo docker compose exec openclaw-agent bash
```


## 5. Setup .ssh config file and import ssh key

```bash
mkdir -p ~/.ssh
vi ~/.ssh/id_ed25519
chmod 600 ~/.ssh/id_ed25519
vi ~/.ssh/config
```

```text
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_ed25519
  AddKeysToAgent yes
  IdentitiesOnly yes
```

```bash
git clone git@github.com:...
```


## 6. Run Codex
```bash
codex --config model_reasoning_effort="xhigh" --dangerously-bypass-approvals-and-sandbox
```
