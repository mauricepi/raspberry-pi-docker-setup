# Raspberry Pi Docker Setup

This repository contains a script to automate the installation of Docker, Docker Compose, Portainer CE, and Nginx Proxy Manager on a Raspberry Pi.

## Features

- **Docker CE**: The core platform for running containers.
- **Docker Compose**: Tool for defining and running multi-container Docker applications.
- **Portainer CE**: Web-based Docker management interface.
- **Nginx Proxy Manager**: A reverse proxy management interface.

## Requirements

- A Raspberry Pi running Raspberry Pi OS (or another compatible Linux distribution).
- An internet connection.

## Installation

To install Docker, Docker Compose, Portainer, and Nginx Proxy Manager on your Raspberry Pi, follow these steps:

1. Clone the repository to your Raspberry Pi:

    ```bash
    git clone https://github.com/mauricepi/raspberry-pi-docker-setup.git
    cd raspberry-pi-docker-setup
    ```

2. Download the installation script:

    ```bash
    wget https://raw.githubusercontent.com/mauricepi/raspberry-pi-docker-setup/main/install_docker.sh -O install_docker.sh
    ```

3. Make the script executable:

    ```bash
    chmod +x install_docker.sh
    ```

4. Run the script:

    ```bash
    ./install_docker.sh
    ```

5. After the installation, you can access the web interfaces:

    - **Portainer**: `http://<your-raspberry-pi-ip>:9000`
    - **Nginx Proxy Manager**: `http://<your-raspberry-pi-ip>:81`

## Post-Installation

- Log out and log back in to apply Docker group changes.
- Verify that Docker services are running:

    ```bash
    docker ps
    ```

## Troubleshooting

If you encounter any issues during the installation or setup, please refer to the [GitHub Issues](https://github.com/mauricepi/raspberry-pi-docker-setup/issues) page for help or to report a problem.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
