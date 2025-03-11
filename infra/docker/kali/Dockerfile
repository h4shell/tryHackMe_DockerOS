FROM kalilinux/kali-rolling:latest

RUN apt-get update && \
    apt-get install -y \
    openvpn \
    nmap \
    curl \
    openssh-server \
    nano \
    tmux \
    iputils-ping \
    git \
    iptables \
    wget \
    net-tools \
    iproute2 \
    python3 \
    python3-pip \
    python3-venv \
    metasploit-framework \
    whatweb \
    nikto \
    hydra \
    ffuf \
    wordlists \
    tcpdump \
    netcat-openbsd
RUN wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -O /usr/local/bin/cloudflared && chmod +x /usr/local/bin/cloudflared
RUN echo "alias 'myip=curl api.ipify.org'" >> /root/.bashrc
RUN echo "set -g mouse on" >> /root/.tmux.conf
COPY tunnel /usr/bin/
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
RUN echo 'root:password' | chpasswd
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
RUN touch /root/.hushlogin
WORKDIR /root
ENTRYPOINT ["/entrypoint.sh"]
