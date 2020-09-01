#Nick Graca
#CDT HW1

#Test ICMP
ping localhost -n 3 *> $null
if ($?){
    echo "Ping Works"
}
else{
    echo "Ping does not work"
}

#Test DNS
nslookup google.com ns1.google.com *> $null
if ($?){
    echo "DNS Works"
}
else{
    echo "DNS does not work"
}

#TEST HTTP
curl http://www.google.com/ *> $null
if ($?){
    echo "HTTP Works"
}
else{
    echo "HTTP does not work"
}

#Test HTTPS
curl https://www.google.com/ *> $null
if ($?){
    echo "HTTP Works"
}
else{
    echo "HTTP does not work"
}

#Test SMB
$value = (Test-NetConnection -ComputerName localhost -Port 445).TcpTestSucceeded *> $null
if ($?){
    echo "SMB Works"
}
else{
    echo "SMB does not work"
}

#Test LDAP
$value = (Test-NetConnection -ComputerName localhost -Port 389).TcpTestSucceeded *> $null
if ($?){
    echo "LDAP Works"
}
else{
    echo "LDAP does not work"
}

#Test LDAP SSL
$value = (Test-NetConnection -ComputerName localhost -Port 636).TcpTestSucceeded *> $null
if ($?){
    echo "LDAP SSL Works"
}
else{
    echo "LDAP SSL does not work"
}

#Test Global Catalog
$value = (Test-NetConnection -ComputerName localhost -Port 3268).TcpTestSucceeded *> $null
if ($value){
    echo "Global Catalog Works"
}
else{
    echo "Global Catalog does not work"
}