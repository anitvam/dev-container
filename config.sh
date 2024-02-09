#!/bin/bash

# Configure Public Key for dev user
echo $PUBLIC_KEY >> /home/dev/.ssh/authorized_keys

# Run SSH server
/usr/sbin/sshd -D -e
