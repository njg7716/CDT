#Nick Graca
#CDT HW 1
#Firewall Rules for DNS, Group Policy and LDAP
#https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/dd772723(v=ws.10)?redirectedfrom=MSDN

#Fresh Start
Disable-NetFirewallRule -All

############################################################################################################################################
#Ingress

#Web
New-NetFirewallRule -DisplayName "Allow inbound Web" -Direction Inbound -Protocol TCP -Action Allow -LocalPort 80
New-NetFirewallRule -DisplayName "Allow inbound Web" -Direction Inbound -Protocol TCP -Action Allow -LocalPort 443

#ICMP
New-NetFirewallRule -DisplayName "Allow inbound ICMP" -Direction Inbound -Protocol ICMPv4 -IcmpType 8 -Action Allow

#DNS (Resolve)
New-NetFirewallRule -DisplayName "Inbound Allow TCP DNS" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 53
New-NetFirewallRule -DisplayName "Inbound Allow UDP DNS" -Direction Inbound -Action Allow -Protocol UDP -LocalPort 53

#Group Policy (Connect)
New-NetFirewallRule -DisplayName "Inbound Allow SMB" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 445
New-NetFirewallRule -DisplayName "Inbound Allow Global Catalog TCP" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 3268
New-NetFirewallRule -DisplayName "Inbound Allow Global Catalog UDP" -Direction Inbound -Action Allow -Protocol UDP -LocalPort 3268

#LDAP (Auth)
New-NetFirewallRule -DisplayName "Inbound Allow LDAP TCP" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 389
New-NetFirewallRule -DisplayName "Inbound Allow LDAP UDP" -Direction Inbound -Action Allow -Protocol UDP -LocalPort 389
New-NetFirewallRule -DisplayName "Inbound Allow LDAP SSL TCP" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 636
New-NetFirewallRule -DisplayName "Inbound Allow LDAP SSL UDP" -Direction Inbound -Action Allow -Protocol UDP -LocalPort 636
############################################################################################################################################
#Egress

#Web
New-NetFirewallRule -DisplayName "Allow Outbound Web" -Direction Outbound -Protocol TCP -Action Allow -LocalPort 80
New-NetFirewallRule -DisplayName "Allow Outbound Web" -Direction Outbound -Protocol TCP -Action Allow -LocalPort 443

#ICMP
New-NetFirewallRule -DisplayName "Allow inbound ICMP" -Direction Outbound -Protocol ICMPv4 -IcmpType 0 -Action Allow

#Group Policy (Connect)
New-NetFirewallRule -DisplayName "Outbound Allow SMB" -Direction Outbound -Action Allow -Protocol TCP -LocalPort 445
New-NetFirewallRule -DisplayName "Outbound Allow Global Catalog TCP" -Direction Outbound -Action Allow -Protocol TCP -LocalPort 3268
New-NetFirewallRule -DisplayName "Outbound Allow Global Catalog UDP" -Direction Outbound -Action Allow -Protocol UDP -LocalPort 3268

#LDAP (Auth)
New-NetFirewallRule -DisplayName "Outbound Allow LDAP TCP" -Direction Outbound -Action Allow -Protocol TCP -LocalPort 389
New-NetFirewallRule -DisplayName "Outbound Allow LDAP UDP" -Direction Outbound -Action Allow -Protocol UDP -LocalPort 389
New-NetFirewallRule -DisplayName "Outbound Allow LDAP SSL TCP" -Direction Outbound -Action Allow -Protocol TCP -LocalPort 636
New-NetFirewallRule -DisplayName "Outbound Allow LDAP SSL UDP" -Direction Outbound -Action Allow -Protocol UDP -LocalPort 636
############################################################################################################################################