# 競技プログラミング(ICPC)向けのNeovim環境用Dockerfile
# ユーザーの環境(Ubuntu 24.04, Neovim 0.11.7, Node v24)を再現します

FROM ubuntu:24.04

# 対話的なプロンプトを無効化し、ロケールをUTF-8に固定
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# ホストユーザーとの権限同期のための設定 (UID: 1000, GID: 1000)
ARG USERNAME=sen469
ARG USER_UID=1000
ARG USER_GID=1000

# Layer 1: OS Base Tools & User Setup
RUN apt-get update && apt-get install -y \
    build-essential \
    gdb \
    g++ \
    gcc \
    clang \
    clangd \
    make \
    cmake \
    git \
    curl \
    wget \
    unzip \
    zip \
    tar \
    ripgrep \
    fd-find \
    xclip \
    xsel \
    wl-clipboard \
    zsh \
    ca-certificates \
    gnupg \
    locales \
    sudo \
    && locale-gen en_US.UTF-8 \
    # 既存の1000番ユーザー(ubuntu等)がいる場合は競合を避けるため削除
    && touch /var/mail/ubuntu && chown root:mail /var/mail/ubuntu \
    && if id -u $USER_UID >/dev/null 2>&1; then userdel -f $(id -un $USER_UID); fi \
    && if getent group $USER_GID >/dev/null 2>&1; then groupdel $(getent group $USER_GID | cut -d: -f1); fi \
    # ユーザーの作成
    && groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Layer 2: Language Runtimes (Node.js, Python)
RUN mkdir -p /etc/apt/keyrings \
    && curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
    && echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_24.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list \
    && apt-get update && apt-get install -y \
    nodejs \
    python3-pip \
    python3-venv \
    python3-full \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Layer 3: Neovim Binary
WORKDIR /tmp
RUN curl -LO https://github.com/neovim/neovim/releases/download/v0.11.7/nvim-linux-x86_64.tar.gz \
    && tar -xzf nvim-linux-x86_64.tar.gz -C /usr/local --strip-components=1 \
    && rm nvim-linux-x86_64.tar.gz

# ユーザー切り替え後の作業ディレクトリ設定
USER $USERNAME
WORKDIR /home/$USERNAME/workspace

# Layer 4: Configuration & LSPs
RUN mkdir -p /home/$USERNAME/.config \
    && git clone https://github.com/sen469/nvim.git /home/$USERNAME/.config/nvim \
    && git clone https://github.com/sen469/kyopro-library.git /home/$USERNAME/kyopro-library

# プラグインの復元 (lazy-lock.json に合わせる)
RUN nvim --headless --cmd "set clipboard=" "+Lazy! restore" +qa || true

# Mason経由でLSPサーバーをプリインストール
RUN nvim --headless --cmd "set clipboard=" "+MasonInstallSync clangd pyright rust-analyzer typescript-language-server html-lsp css-lsp" +qa || true

# カスタムエイリアスと関数の追加 (.zshrc)
# options.lua でシェルが zsh に設定されているため、.zshrc に追記します
RUN echo "\n\
alias v='nvim'\n\
alias clr='clear'\n\
alias sl='ls'\n\
alias g++='g++ -I./ -Ilib/ -I/home/$USERNAME/kyopro-library/include'\n\
\n\
com() {\n\
  command g++ -I./ -Ilib/ -I/home/$USERNAME/kyopro-library/include -DSEN469 -std=c++20 -Wall -Wextra -Wshadow \"\$@\" && ./a.out && rm -f a.out\
}\n\
alias cjj='com j.cpp'\n\
alias ckk='com k.cpp'\n\
\n\
alias vj='nvim j.cpp'\n\
alias jv='nvim j.cpp'\n\
alias vk='nvim k.cpp'\n\
\n\
alias clip='xsel --clipboard --input'\n\
\n\
export MYVIMRC=\"\$HOME/.config/nvim\"\n\
" >> /home/$USERNAME/.zshrc && \
cp /home/$USERNAME/.zshrc /home/$USERNAME/.bashrc

# 環境変数の設定
ENV EDITOR=nvim

# デフォルトのシェルをzshに変更
CMD ["zsh"]
