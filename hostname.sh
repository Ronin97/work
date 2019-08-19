#!/bin/bash
net=`ifconfig | awk -F'[ :]+' '!NF{if(eth!=""&&ip=="")print eth;eth=ip4=""}/^[^ ]/{eth=$1}/inet addr:/{ip=$4}'| awk "NR==1"`
ipadd=`ifconfig "$net" | grep 'inet ' | awk '{print $2}'`
hostname=`cat /root/host | grep $ipadd | awk '{print $2}'`
echo $ipadd
echo $hostname
hostnamectl set-hostname --static $hostname
hostname $hostname

