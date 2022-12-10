#!/bin/bash

./.cron.sh

#dialog --ok-label "Siguiente" --msgbox "¡Bienvenido!" 0 0

#break=0
#while [ $break == 0 ]
#do

lista=$(cat .cron.txt | tr " " "$" | tr "*" "^" | grep -v "#")
#echo $lista; exit

touch temporal; rm temporal
#options=$(
contador=1
for n in $(echo $lista)
do
echo -n " "$contador "\"" >> temporal
echo -n $n | tr "$" " " | tr "^" "*" >> temporal
echo -n "\" off" >> temporal
contador=$(($contador + 1))
done
#)
#cat temporal; sleep 20
rm temporal

dialog --backtitle "Proyecto Shell Script" --buildlist "Opciones:" f1 "0 5 * * 1 cat /var/backups/home.tgz 2>/dev/void" off f2 "0 5 * * 1 cat /var/backups/home.tgz 2>/dev/void" off f3 "0 5 * * 1 cat /var/backups/home.tgz 2>/dev/void" off f4 "0 5 * * 1 cat /var/backups/home.tgz 2>/dev/void" off f5 "0 5 * * 1 cat /var/backups/home.tgz 2>/dev/void" off f6 "0 5 * * 1 cat /var/backups/home.tgz 2>/dev/void" off 0 0 0 2>temp
sleep 10
Cancelado=$?
Eleccion=`cat temp` ; rm temp
if [ $Cancelado -eq 0 ]
  then echo "Has elegido: $Eleccion"
  else dialog --infobox "¡Has cancelado!" 4 24
fi



#sleep 1
#done
#clear
