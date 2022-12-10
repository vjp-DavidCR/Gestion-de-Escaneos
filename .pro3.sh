#!/bin/bash

./.cron.sh

#dialog --ok-label "Siguiente" --msgbox "¡Bienvenido!" 0 0

#break=0
#while [ $break == 0 ]
#do

lista=$(cat .cron.txt | tr " " "$" | tr "*" "." | grep -v "#")
#echo $lista; exit

options=$(
contador=1
for n in $(echo $lista)
do
echo -n " "$contador "\""
echo -n $n | tr "$" " " | tr "^" "*"
echo -n "\" off"
contador=$(($contador + 1))
done
)
echo $options; sleep 2

dialog --backtitle "Proyecto Shell Script" --buildlist "Opciones:" 0 0 0$options 2>temp
Cancelado=$?
Eleccion=`cat temp` ; rm temp
if [ $Cancelado -eq 0 ]
  then echo "Has elegido: $Eleccion"
  else dialog --infobox "¡Has cancelado!" 4 24
fi

#sleep 1
#done
#clear
