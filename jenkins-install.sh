#!/bin/bash

install_java(){

echo "installing the latest LTS version"
if [["$os"=='debian' || "$os" == 'ubuntu']]; then 
	sudo apt update 
	sudo apt install -y openjdk-17-jdk
elif [[ "$os" == "rhel" || "$os" == "fedora" || "$os" == "centos"]]; then
	sudo yum install -y java-17-openjdk
elif [[ "$os" == "mac"]]; then
	brew install openjdk@17
fi
echo "java 17 has been installed"
}
install_jenkins(){
	echo "installing the latest LTS version of Jenkins..."
	if [[ "$os" == "debian" || "$os" == "ubuntu"]]; then
		sudo apt update
		sudo apt install -y wget
		wget -q -O wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
        sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
        sudo apt update
        sudo apt install -y jenkins
	elif [[ "$os" == "rhel" || "$os" == "fedora" || "$os" == "centos" ]]; then
        sudo yum install -y wget
        sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
        sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
        sudo yum upgrade
        sudo yum install -y jenkins
    elif [[ "$os" == "mac" ]]; then
        brew install jenkins-lts
    fi

    echo "Jenkins latest LTS has been installed."
