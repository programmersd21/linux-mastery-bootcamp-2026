FROM ubuntu:24.04

LABEL maintainer="Linux Mastery Bootcamp 2026"
LABEL description="Complete Linux learning environment"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl wget git vim nano tree htop net-tools \
    bash-completion man-db manpages \
    build-essential gcc make cmake \
    python3 python3-pip \
    jq unzip zip tar gzip \
    sudo ssh openssh-client \
    iputils-ping traceroute dnsutils \
    lvm2 xfsprogs e2fsprogs \
    systemd systemd-sysv \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    bat eza ripgrep fd-find fzf btop \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash -G sudo student \
    && echo "student:student" | chpasswd \
    && echo "student ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN echo '
alias cat="bat --paging=never 2>/dev/null || cat"
alias ls="eza --group-directories-first 2>/dev/null || ls --color=auto"
alias ll="eza -lah --git --icons 2>/dev/null || ls -lah --color=auto"
alias grep="rg 2>/dev/null || grep --color=auto"
alias find="fd 2>/dev/null || find"
alias top="btop 2>/dev/null || htop 2>/dev/null || top"
' >> /home/student/.bashrc

RUN chown -R student:student /home/student

WORKDIR /course
VOLUME /course

USER student
CMD ["/bin/bash"]
