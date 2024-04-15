#!/usr/bin/bash

setup_linux()
{
	mkdir -p /usr/share/authnix	
	cp -p password /usr/share/authnix/
	cp -p src/authnix /usr/bin/
	chmod +x /usr/bin/authnix
}

setup_termux()
{
	mkdir -p /data/data/com.termux/files/usr/share/authnix
	cp -p password /data/data/com.termux/files/usr/share/authnix/
	cp -p src/authnix /data/data/com.termux/files/usr/bin/
	chmod +x /data/data/com.termux/files/usr/bin/authnix
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
