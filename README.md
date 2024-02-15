# dev-container
Docker container for development purposes with pre-installed:
- Docker CLI
- oh-my-zsh
- git
- openssh-server

### Avoid password authentication for your SSH connections!

Read [this article](https://www.redhat.com/sysadmin/configure-ssh-keygen) if you never used key-based authentication methods.

## Quick-start

### Build from source

```bash
git clone git@github.com:anitvam/dev-container.git
cd dev-container
docker build . -t dev-container:latest
docker run -d -e PUBLIC_KEY="YOUR_PUB_KEY" -p 2222:22 -v /var/run/docker.sock:/var/run/docker.sock dev-container:latest
ssh dev@localhost:2222 -i ~/.ssh/<YOUR_PRI_KEY>
```

### Pull from Docker Hub

```bash
docker pull anitvam/dev-container:latest
docker run -d -e PUBLIC_KEY="YOUR_PUB_KEY" -p 2222:22 -v /var/run/docker.sock:/var/run/docker.sock dev-container:latest
ssh dev@localhost:2222 -i ~/.ssh/<YOUR_PRI_KEY>
```
