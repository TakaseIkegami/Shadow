#!/usr/bin/env bash

## get general OS updates
sudo apt update -y
sudo apt upgrade -y

## install shadow dependencies
sudo apt install -y gcc g++ python libglib2.0-0 libglib2.0-dev libigraph0v5 libigraph0-dev cmake make xz-utils python-pyelftools

sudo apt install -y libc-dbg

## install shadow-plugin-tor dependencies
sudo apt install -y gcc automake autoconf zlib1g zlib1g-dev

## install tools for analyzing shadow output
sudo apt install -y python-matplotlib python-numpy python-scipy python-networkx python-lxml

## install generally useful dev tools
sudo apt install -y git dstat screen htop

## setup pyenv
#source pyenv_setup.sh
#pyenv global 2.7.0
#pyenv versions
#pip install python numpy scipy matplotlib networkx lxml twisted stem

## get shadow/tor
mkdir -p /vagrant
cd /vagrant
git clone https://github.com/shadow/shadow.git
git clone https://github.com/shadow/shadow-plugin-tor.git
git clone https://git.torproject.org/tor.git -b release-0.2.7

## setup shadow/tor
cd /vagrant/shadow
python setup build -cg
python setup install
cd /vagrant/tor
cd /vagrant/shadow-plugin-tor
python setup dependencies -y
python setup build -cg --tor-prefix /vagrant/tor
python setup install

## get shadow in your path
echo "export PATH=${PATH}:/home/${USER}/.shadow/bin" >> ~/.bashrc

## set some configs (for running large simulations)
echo "* soft nofile 25000" >> /etc/security/limits.conf
echo "* hard nofile 25000" >> /etc/security/limits.conf
echo "vm.max_map_count = 262144" >> /etc/sysctl.conf
sudo sysctl -w vm.max_map_count=262144
echo "fs.file-max = 5000000" >> /etc/sysctl.conf
sudo sysctl -w fs.file-max=5000000
sudo sysctl -p
