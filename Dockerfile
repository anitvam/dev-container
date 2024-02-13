FROM ubuntu:latest

RUN apt-get update && \
    apt-get upgrade -y

# Install nano, curl, zsh, git, openssh-server
RUN apt-get install -y nano curl zsh git openssh-server

# Install oh-my-zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

# Install Docker CLI
RUN curl -fsSL https://get.docker.com | sh

# Create dev user and root user
RUN useradd -rm -d /home/dev -s /usr/bin/zsh -G root,docker,sudo -u 1000 dev && \
    passwd -d dev && \
    passwd -d root

RUN newgrp - docker

# Set up configuration for SSH
RUN mkdir /var/run/sshd && \
    mkdir /home/dev/.ssh && \
    touch /home/dev/.ssh/authorized_keys && \
    echo $PUBLIC_KEY >> /home/dev/.ssh/authorized_keys && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config && \
    echo "export VISIBLE=now" >> /etc/profile

# Expose the SSH port
EXPOSE 22

# Copy configuration script
COPY config.sh ./

# Run configuration script
ENTRYPOINT bash /config.sh
