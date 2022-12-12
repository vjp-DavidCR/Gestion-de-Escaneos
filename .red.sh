#!/bin/bash
if ! [ -d "RED" ]; then
mkdir RED
fi
redes=$(
contador=1
for n in $(ip r | grep "/" | cut -f 1 -d " ")
do

echo -n " $n"
echo -n " $contador"

contador=$(($contador + 1))

done
)

if [ $# -eq 0 ]
then
subred=$(dialog --stdout --title "Selecconar Subred" --menu "Subredes" 0 0 0 $redes)
Cancelado=$?
if [ $Cancelado -ne 0 ]
  then
	exit
fi
else
subred=$1
fi

dialog --infobox "Escaneando redes..." 0 0
nmap "$subred" | grep "scan report" | grep "(" | cut -f 2 -d "(" | cut -f 1 -d ")" > ip.txt

cat ip.txt > $(echo 'RED/RED-'$(date '+%d-%m-%Y-%T'));

if [ -s ip.txt ] ; then

if [ $# -eq 0 ]
then

ip=$(

contador=1

for n in $(nmap "$subred" | grep "scan report" | grep "(" | cut -f 2 -d "(" | cut -f 1 -d ")")

do

echo -n " $n"
echo -n " $contador"

contador=$(($contador + 1))

done
)

break2=0
while (( $break2 == 0 ))
do

subred=$(dialog --stdout --title "Selecconar Dispositivo" --menu "Dispositivos" 0 0 0 $ip)
Cancelado=$?
if [ $Cancelado -ne 0 ]
  then
        exit
fi

break1=0
while (( $break1 == 0 ))
do
respuesta=$(dialog --stdout --title "Seleccionar Escaneo" --menu "Tipos de escaneo" 0 0 0 1 "Escaneo de Servicios" 2 "Escaneo de Vulnerabilidades" 9 "Salir");

	if [ "$respuesta" == 1  ] ; then
		./.ser.sh $subred;
	elif [ "$respuesta" == 2  ] ; then
		./.vul.sh $subred;
	elif [ "$respuesta" == 9  ] ; then
		exit;
	else
		clear
		#echo "Has cancelado el script de gestión de usuarios"
		sleep 2
		clear
		shell 2>/dev/null
		exit
	fi
dialog --backtitle "Proyecto Shell Script" --title "Seleccionar tipos de Escaneos" --yesno "¿Desea seleccionar otro tipo de ESCANEO?" 0 0 2>temp
Cancelado=$?
Eleccion=`cat temp` ; rm temp
if [ $Cancelado -ne 0 ]
then break1=1
fi
done

dialog --backtitle "Proyecto Shell Script" --title "Seleccionar Dispositivos" --yesno "¿Desea seleccionar otro DISPOSITIVO?" 0 0 2>temp
Cancelado=$?
Eleccion=`cat temp` ; rm temp
if [ $Cancelado -ne 0 ]
then break2=1
fi
done



else
dialog --infobox "Escaneo de Red completado." 0 0
sleep 2
fi

else

dialog --title "Seleccionar Dispositivo" --msgbox "No se encontraron dispositivos en la SUBRED" 0 0

fi
rm ip.txt
