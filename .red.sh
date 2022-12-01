#!/bin/bash

dialog --title "Selecconar Subred" --menu "Subredes" 0 0 0 "192.168.1.0/24" 1 "192.168.2.0/24" 2
echo "$?"

sleep 2

