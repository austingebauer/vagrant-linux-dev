#!/usr/bin/env bash

set -ex

main() {
    apt-get update
    install_dev_tools
    install_nginx
    clean_up
}

#
# Installs development tools.
#
install_dev_tools() {
    # Install packages available in apt-get
    apt-get install -y \
        git \
        linux-kernel-headers \
        build-essential

    # Install go1.12.6
    wget https://dl.google.com/go/go1.12.6.linux-amd64.tar.gz
    sudo tar xzvf go1.12.6.linux-amd64.tar.gz -C /usr/local
    echo "PATH=${PATH}:/usr/local/go/bin" >> /home/vagrant/.bashrc
}

#
# Installs nginx proxy and web server.
#
install_nginx() {
    # Install prerequisite dependencies
    apt-get install -y \
        gnupg2 \
        ca-certificates \
        lsb-release \
        libpcre3 \
        libpcre3-dev \
        zlib1g \
        zlib1g-dev \
        libssl-dev

    # Set up the apt repository for stable nginx packages
    echo "deb http://nginx.org/packages/ubuntu `lsb_release -cs` nginx" \
    | sudo tee /etc/apt/sources.list.d/nginx.list

    # Import nginx signing key so apt could verify the packages authenticity
    curl -fsSL https://nginx.org/keys/nginx_signing.key | sudo apt-key add -

    # Verify the key
    apt-key fingerprint ABF5BD827BD9BF62

    # Install nginx package
    apt-get update
    apt-get -y install nginx

    # Allow logs to be readable
    sudo chmod -R uga+r /var/log/nginx

    # Install nginx source package for building modules
    wget http://nginx.org/download/nginx-1.16.0.tar.gz
}

#
# Cleans up after provisioning is complete.
#
clean_up() {
    rm -rf *.tar.gz
}

main
