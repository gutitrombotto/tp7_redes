#!/bin/bash

#Remove docker interfaces
sudo ovs-docker del-port br-ex eth1 quagga1 --ipaddress=172.18.0.1/24
sudo ovs-docker del-port br-ex eth1 quagga254 --ipaddress=172.18.0.254/24

#Remove docker instances
sudo docker kill quagga1
sudo docker kill quagga254
sudo docker rm quagga1
sudo docker rm quagga254

#Remove br-ex ip address
sudo ip addr del 172.18.0.100/24 dev br-ex

#Remove bridge
sudo ovs-vsctl del-br br-ex

