#!/bin/bash
# Linux Mastery Bootcamp 2026 - Environment Setup

set -euo pipefail

echo "Linux Mastery Bootcamp 2026 - Setup"
echo "===================================="

if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$NAME
else
    echo "Cannot detect OS. Exiting."
    exit 1
fi

echo "Detected OS: $OS"

if [[ "$OS" == *"Ubuntu"* ]] || [[ "$OS" == *"Debian"* ]]; then
    sudo apt update
    INSTALL="sudo apt install -y"
elif [[ "$OS" == *"Fedora"* ]] || [[ "$OS" == *"Red Hat"* ]] || [[ "$OS" == *"CentOS"* ]] || [[ "$OS" == *"AlmaLinux"* ]]; then
    sudo dnf update -y
    INSTALL="sudo dnf install -y"
else
    echo "Unsupported OS. Install packages manually."
    exit 1
fi

echo "Installing essential tools..."
$INSTALL curl wget git vim nano tree htop net-tools     bash-completion man-db manpages     build-essential gcc make cmake     python3 python3-pip     jq unzip zip tar gzip

echo "Installing modern tools..."
if [[ "$OS" == *"Ubuntu"* ]] || [[ "$OS" == *"Debian"* ]]; then
    $INSTALL bat eza ripgrep fd-find fzf btop
    mkdir -p ~/.local/bin
    ln -sf /usr/bin/batcat ~/.local/bin/bat 2>/dev/null || true
    ln -sf /usr/bin/fdfind ~/.local/bin/fd 2>/dev/null || true
    pip3 install tldr
elif [[ "$OS" == *"Fedora"* ]] || [[ "$OS" == *"Red Hat"* ]] || [[ "$OS" == *"CentOS"* ]] || [[ "$OS" == *"AlmaLinux"* ]]; then
    $INSTALL bat eza ripgrep fd-find fzf btop
    pip3 install tldr
fi

cat >> ~/.bashrc << 'EOF'

# Linux Mastery Bootcamp Aliases
alias cat='bat --paging=never 2>/dev/null || cat'
alias ls='eza --group-directories-first 2>/dev/null || ls --color=auto'
alias ll='eza -lah --git --icons 2>/dev/null || ls -lah --color=auto'
alias grep='rg 2>/dev/null || grep --color=auto'
alias find='fd 2>/dev/null || find'
alias top='btop 2>/dev/null || htop 2>/dev/null || top'
alias ..='cd ..'
alias ...='cd ../..'
alias mkdirp='mkdir -p'
alias ports='ss -tlnp'
alias mem='free -h'
alias disk='df -h'
alias path='echo $PATH | tr ":" "\n"'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph'
EOF

mkdir -p ~/linux-labs/{phase1,phase2,phase3,phase4,projects}
mkdir -p ~/trash
mkdir -p ~/projects

if [ -z "$(git config --global user.name 2>/dev/null)" ]; then
    echo "Git user.name not set. Run: git config --global user.name 'Your Name'"
fi
if [ -z "$(git config --global user.email 2>/dev/null)" ]; then
    echo "Git user.email not set. Run: git config --global user.email 'your@email.com'"
fi

echo ""
echo "Setup complete."
echo "1. Restart terminal or run: source ~/.bashrc"
echo "2. Navigate to course: cd 01-foundations"
echo "3. Start: cat README.md"
