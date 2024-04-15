#!/usr/bin/bash

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
