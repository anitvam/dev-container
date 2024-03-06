#!/bin/bash
set -exo

# Configure Public Key for dev user
if [[ -z "$PUBLIC_KEY" ]]; then
    echo $PUBLIC_KEY >> /home/dev/.ssh/authorized_keys
fi

# Run SSH server
/usr/sbin/sshd -D -e
