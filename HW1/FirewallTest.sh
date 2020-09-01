#!/bin/bash
#Nick Graca
#Test to make sure the fire wall script works

#Test Web both port 80 and 443
curl http://www.google.com/ > /dev/null 2>&1
if [ $? -eq 0 ]
then
    curl https://www.google.com/ > /dev/null 2>&1
    if [ $? -eq 0 ]
    then
        echo "Web works"
    else
        echo "Web is not working"
    fi
else
    echo "Web is not working"
fi

#Test ssh on itself
timeout 2 bash -c "</dev/tcp/localhost/22" > /dev/null 2>&1
if [ $? -eq 0 ]
then
    echo "SSH works"
else
    echo "SSH is not working"
fi

#Test LDAP connection
timeout 2 bash -c "</dev/tcp/localhost/389" > /dev/null 2>&1
if [ $? -eq 0 ]
then
    echo "LDAP works"
else
    echo "LDAP is not working"
fi