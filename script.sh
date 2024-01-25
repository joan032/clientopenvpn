#!/bin/bash
# Purpose: Configure Ubuntu DHCP server
# https://ubuntu.com/server/docs/network-dhcp
# Author: Jose Maria Madronal GPL v2.0+ (Proxmox script)
# ------------------------------------------

# Install apache2
sudo apt install openvpn

# declare STRING variable
STRING="Script example"
f_ca="https://raw.githubusercontent.com/joan032/clientopenvpn/main/cacert.pem"
f_config="https://raw.githubusercontent.com/joan032/clientopenvpn/main/client.conf"
f_crt="https://raw.githubusercontent.com/joan032/clientopenvpn/main/vpnclient1.projecteinfovj.com.crt"
f_key="https://raw.githubusercontent.com/joan032/clientopenvpn/main/vpnclient1.projecteinfovj.com.key"
f_ta="https://github.com/joan032/clientopenvpn/blob/main/ta.key"

# Download GitHub configuration file
wget $f_ca
wget $f_config
wget $f_crt
wget $f_key
wget $f_ta

# Copy the configuration 
sudo cp cacert.pem /etc/openvpn
sudo cp myserver.conf /etc/openvpn
sudo cp vpnclient1.projecteinfovj.com.crt /etc/openvpn
sudo cp vpnclient1.projecteinfovj.com.key /etc/openvpn
sudo cp ta.key /etc/openvpn

# Restart the openvpn server
sudo systemctl restart openvpn
sudo systemctl restart openvpn@client
sudo systemctl status openvpn@client

ip a
