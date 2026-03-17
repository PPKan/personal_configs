# VPS initialization script

```bash
#!/bin/bash
mkdir ~/workspace

sudo apt-get update
sudo apt-get install -y curl vim tmux

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

curl -L https://github.com/PPKan/personal_configs/raw/refs/heads/main/.tmux.conf -o ~/.tmux.conf
```


```bash
cd workspace
docker compose up -d
```