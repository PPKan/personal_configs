FROM node:22-bookworm

RUN apt-get update && apt-get install -y --no-install-recommends \
    vim \
    tmux \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN curl -L https://github.com/PPKan/personal_configs/raw/refs/heads/main/.tmux.conf.internal -o /root/.tmux.conf

RUN npm install -g openclaw@latest

RUN openclaw onboard --install-daemon

WORKDIR /workspace

CMD ["sleep", "infinity"]