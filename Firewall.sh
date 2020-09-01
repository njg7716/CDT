#!/bin/bash
#Nick Graca
#CDT HW1

#Delete all firewall rules
sudo iptables -F 

##########################################
#Inbound

#Allow Web Traffic
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT

#Allow ssh for gitlab shell to push or pull
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT

#Allow LDAP to Auth with AD
sudo iptables -A INPUT -p tcp --dport 389 -j ACCEPT
##########################################
#Outbound

#Web Traffic
sudo iptables -A OUTPUT -p tcp --sport 80 -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 443 -j ACCEPT

#GitLab Shell
sudo iptables -A OUTPUT -p tcp --sport 22 -j ACCEPT

#LDAP Auth
sudo iptables -A OUTPUT -p tcp --sport 389 -j ACCEPT