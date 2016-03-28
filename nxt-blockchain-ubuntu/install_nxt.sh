#!/bin/bash

set -x
apt-add-repository -y ppa:openjdk-r/ppa
apt-add-repository -y ppa:nxtcore/nxt
apt-get -y update
apt-get -y install nxt unattended-upgrades

if [ $1 == "False" ]
then
    echo "nxt.apiServerHost=0.0.0.0" >> /etc/nxt/nxt.properties
    echo "nxt.allowedBotHosts=*" >> /etc/nxt/nxt.properties
fi

if [ $2 == "True" ]
then
    echo "nxt.isTestnet=true" >> /etc/nxt/nxt.properties
else
    apt-get -y install nxt-bootstrap-blockchain
fi

restart nxt

