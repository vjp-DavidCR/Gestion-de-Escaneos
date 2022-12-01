#!/bin/bash

redes=$(
contador=1
for n in $(ip r | grep "/" | cut -f 1 -d " ")
do

echo -n " $n"
echo -n " $contador"

contador=$(($contador + 1))

done
)

subred=$(dialog --stdout --title "Selecconar Subred" --menu "Subredes" 0 0 0 $redes)


if

#Si hay redes haz esto

ip=$(

contador=1

for n in $(nmap "$subred" | grep "scan report" | grep "(" | cut -f 2 -d "(" | cut -f 1 -d ")")

do

echo -n " $n"
echo -n " $contador"

contador=$(($contador + 1))

done
)

subred=$(dialog --stdout --title "Selecconar Dispositivo" --menu "Dispositivos" 0 0 0 $ip)

else

echo "No se encontraron dispositivos"
