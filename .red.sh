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

nmap "$subred" | grep "scan report" | grep "(" | cut -f 2 -d "(" | cut -f 1 -d ")" > ip.txt

cat ip.txt > $(echo 'RED/RED-'$(date '+%d-%m-%Y-%T'));

if [ -s ip.txt ] ; then

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

respuesta=$(dialog --stdout --title "Seleccionar Escaneo" --menu "Tipos de escaneo" 0 0 0 1 "Escaneo de Servicios" 2 "Escaneo de Vulnerabilidades" 9 "Salir");

	if [ "$respuesta" == 1  ] ; then
		./.ser.sh $subred;
	elif [ "$respuesta" == 2  ] ; then
		./.vul.sh $subred;
	elif [ "$respuesta" == 9  ] ; then
		exit;
	else
		clear
		echo "Has cancelado el script de gestión de usuarios"
		sleep 2
		clear
		shell 2>/dev/null
		exit
	fi

else

dialog --title "Seleccionar Dispositivo" --msgbox "No se encontraron dispositivos en la SUBRED" 0 0

fi
rm ip.txt
