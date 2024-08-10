#!/bin/bash

set -e

# Update and upgrade system
echo "Updating and upgrading the system..."
sudo apt update
sudo apt upgrade -y

# Install Docker CE
echo "Installing Docker CE..."
curl -fsSL https://get.docker.com | sh

# Add current user to docker group
echo "Adding current user to the docker group..."
sudo usermod -aG docker $USER

# Install Docker Compose
echo "Installing Docker Compose..."
DOCKER_COMPOSE_VERSION="1.29.2"
sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install Portainer CE and Nginx Proxy Manager
echo "Creating Docker Compose file for Portainer and Nginx Proxy Manager..."
mkdir -p ~/docker
cat <<EOF > ~/docker/docker-compose.yml
version: '3'
services:
  portainer:
    image: portainer/portainer-ce
    container_name: portainer
    restart: always
    ports:
      - "9000:9000"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - portainer_data:/data

  nginx-proxy-manager:
    image: jc21/nginx-proxy-manager
    container_name: nginx-proxy-manager
    restart: always
    ports:
      - "81:81"
      - "443:443"
      - "80:80"
    volumes:
      - ./data:/data
      - ./letsencrypt:/etc/letsencrypt

volumes:
  portainer_data:
EOF

# Change directory and start services
cd ~/docker
echo "Starting Portainer and Nginx Proxy Manager..."
docker-compose up -d

# Inform the user
echo "Docker, Docker Compose, Portainer, and Nginx Proxy Manager have been installed and started."
echo "You can access Portainer at http://<your-ip>:9000 and Nginx Proxy Manager at http://<your-ip>:81."

# Reminder to log out and log back in
echo "Please log out and log back in to apply the Docker group changes."

# End of script

