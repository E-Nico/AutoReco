#!/bin/bash

RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
NC='\e[0m'  # Réinitialisation

echo 'AutoRecon - v0'

var=$1

if [ -z "$var" ]; then
	echo -e "${RED}Entrer une IP${NC}"
else
	echo -e "${GREEN}[+] TARGET = $var${NC}"
fi
