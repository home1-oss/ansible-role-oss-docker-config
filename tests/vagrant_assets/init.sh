#!/usr/bin/env bash

if type -p lsb_release > /dev/null; then
    id="$(lsb_release -is)"
    codename=$(lsb_release -cs)
    if [ "${id}" == "Ubuntu" ]; then
        sudo sed -i 's#http://archive.ubuntu.com/ubuntu#http://mirrors.163.com/ubuntu#g' /etc/apt/sources.list
        sudo sed -i 's#http://security.ubuntu.com/ubuntu#http://mirrors.163.com/ubuntu#g' /etc/apt/sources.list
        sudo rm -vrf /var/lib/apt/lists/*
        sudo apt-get clean -y

        if [ "${codename}" == "xenial" ]; then
            sudo apt-get update -y || sudo apt-get update -y
            sudo apt-get install -y python
        fi
    fi
fi
