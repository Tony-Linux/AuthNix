#!/usr/bin/bash

setup_linux()
{
	
}

setup_termux()
{
	
}

main()
{
	if [[ -d /usr/bin ]]; then
		if [ $(id -u) -ne 0 ]; then
			echo "This script must be ran as root"
			exit 1
		fi 
		setup_linux
	elif [[ -d /data/data/com.termux/files/home ]]; then
		setup_termux
	fi
}

main
