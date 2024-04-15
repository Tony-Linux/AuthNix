#!/usr/bin/bash

green='\033[1;32m'
red='\033[1;31m'
white='\033[1;37m'
cyan='\033[0;36m'

packages()
{
	if [[ $(command -v python3) ]]; then
    	echo -e "${white} [${green}+${white}] ${green}Python 3 is installed."
	else
    	echo -e "${white} [${red}+${white}] ${red}Python 3 command not found. To install Python 3, please execute the installation command: 'apt install python3'."
    	exit
	fi

	if [[ $(command -v ruby) ]]; then
    	echo -e "${white} [${green}+${white}] ${green}Ruby is installed."
	else
    	echo -e "${white} [${red}+${white}] ${red}Ruby command not found. To install Ruby, please execute the installation command: 'apt install ruby'."
    	exit
	fi
	
	if python3 -c "import requests" &> /dev/null; then
	    echo "${white} [${green}+${white}] ${green}Requests package is installed."
	else
	    echo "${white} [${red}+${white}] ${red}Requests package not found. Please install it using: 'pip install requests'."
	fi
}

verify_code()
{
	
}

setup_linux()
{
	mkdir -p /usr/share/authnix	
	mkdir -p /usr/share/authnix/subdomain
	mkdir -p /usr/share/authnix/password
	mkdir -p /usr/share/authnix/hidden
	cp -p password /usr/share/authnix/
	cp -p src/authnix /usr/bin/
	chmod +x /usr/bin/authnix
	cp -p subdomain/domain.txt /usr/share/authnix/subdomain/
	cp -p subdomain/authnixsubdomain /usr/bin/authnixsubdomain
	chmod +x /usr/bin/authnixsubdomain
}

setup_termux()
{
	mkdir -p /data/data/com.termux/files/usr/share/authnix
	mkdir -p /data/data/com.termux/files/usr/share/authnix/subdomain
	mkdir -p /data/data/com.termux/files/usr/share/authnix/password
	mkdir -p /data/data/com.termux/files/usr/share/authnix/hidden
	cp -p password /data/data/com.termux/files/usr/share/authnix/
	cp -p src/authnix /data/data/com.termux/files/usr/bin/
	chmod +x /data/data/com.termux/files/usr/bin/authnix
	cp -p subdomain/domain.txt /data/data/com.termux/files/usr/share/authnix/subdomain/
	cp -p subdomain/authnixsubdomain /data/data/com.termux/files/usr/bin/
	chmod +x /data/data/com.termux/files/usr/bin/authnixsubdomain
}

main()
{
	if [[ -d /usr/bin ]]; then
		if [ $(id -u) -ne 0 ]; then
			echo -e "${white} [${red}+${white}] ${red}This script must be ran as root"
			exit 1
		fi 
		setup_linux
	elif [[ -d /data/data/com.termux/files/home ]]; then
		setup_termux
	fi
}

main
packages
verify_code
