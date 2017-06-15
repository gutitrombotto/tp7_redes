#!/bin/bash

# BGP services using Quagga. Container image: quagga-fpm

#######################################################################
#                                                                     #
#     +----+                             +----+                       #
#     |    | dum1                        |    | dum1                  #
#     |    v 172.25.1.1/32               v    | 172.25.254.254/32     #
#     |  +---------+           +-----------+  |                       #
#     +--| quagga1 |           | quagga254 |--+                       #
#        | bgp     |           | bgp       |                          #
#        |         |           |           |                          #
#        +---------+           +-----------+                          #
#             |172.18.0.1           |172.18.0.254                     #
#             |                     |                                 #
#             +-------[br-ex]-------+                                 #
#                   172.18.0.100                                      #
#                                                                     #
#######################################################################

#Local path for BGP configuration files
VOLUME1=~/redes-quagga/volumes/quagga1
VOLUME254=~/redes-quagga/volumes/quagga254

#ovs-switch creation
sudo ovs-vsctl add-br br-ex
sudo ip link set br-ex up
#set vm ip address
sudo ip addr add 172.18.0.100/24 dev br-ex

#quagga1 instantiation
sudo docker run --name quagga1 --privileged -d -v $VOLUME1:/etc/quagga quagga-fpm_test
#quagga254 instantiation
sudo docker run --name quagga254 --privileged -d -v $VOLUME254:/etc/quagga quagga-fpm_test

#quagga1: add eth1 interface and connect it to ovs-switch
sudo ovs-docker add-port br-ex eth1 quagga1 --ipaddress=172.18.0.1/24
#quagga2: add eth1 interface and connect it to ovs-switch
sudo ovs-docker add-port br-ex eth1 quagga254 --ipaddress=172.18.0.254/24

