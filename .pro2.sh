#!/bin/bash
#Listar tareas programadas

#./.cron.sh

#dialog --ok-label "Siguiente" --msgbox "¡Bienvenido!" 0 0

#break=0
#while [ $break == 0 ]
#do

lista=$(
for n in $(cat .cron.txt | grep -v "#" | tr " " "@")
do
echo -n "- "
echo $n | tr "@" " "
echo "\n"
done
)

#echo $lista; sleep 1

counter=$(( $(cat .cron.txt | grep -v "#" | wc -l) + 6 ))

dialog --backtitle "Proyecto Shell Script" --title "Listar escaneos programados" --msgbox "Lista de escaneos: \n\n$lista" $counter 60

#sleep 1
#done
#clear
