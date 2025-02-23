#!/bin/bash

RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
MAGENTA='\e[35m'
NC='\e[0m'  # Réinitialisation

echo 'AutoRecon - v0'
echo 'Welcome on the AutRecon script which help you with your reco scans. Before executing this script, take care to have take note of this prerequisites :'
echo '-Target is  a linux machine'
echo '-You have the right to do it on you target '
var=$1

if [ -z "$var" ]; then
	echo -e "${RED}Entrer une IP${NC}"
else
	echo -e "${GREEN}[+] TARGET = $var${NC}"
	export TARGET=$var
fi

echo -e "${YELLOW}[/\] START SCANNING${NC}"

echo -e "${MAGENTA}[*] SCAN NMAP ${NC}"
result_nmap=nmap -sCV $TARGET

#if port 80
echo -e "${MAGENTA}[*] SUBDOMAINS SCANS${NC}"
#result_gobuster=gobuster dir -u http://$TARGET/ -w /usr/share/dirb/wordlists/common.txt -x php,txt,html -b 301 --exclude-length 6609 -k
resultat_dirb=dirb http://$TARGET/
resultat_ferox=feroxbuster -u http://$TARGET
echo -e "${MAGENTA}[*] VHOST SCANS${NC}"
resultat_vhost=fuff -c -w /usr/share/dirbuster/wordlists/directory-list-2.3-medium.txt -u http://$TARGET  -H "Host: FUZZ.${DOMAIN_NAME}" --fc 301
echo -e "${MAGENTA}[*] WEB SCANNING"
resultat_nikto=nikto -host $TARGET
