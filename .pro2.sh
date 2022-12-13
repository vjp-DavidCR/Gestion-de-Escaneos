#!/bin/bash
#Listar tareas programadas

#./.cron.sh

#dialog --ok-label "Siguiente" --msgbox "¡Bienvenido!" 0 0

#break=0
#while [ $break == 0 ]
#do

lista=$(
for n in $(crontab -l | cat | grep -v "#" | tr " " "@")
do
echo -n "- "
echo $n | tr "@" " "
echo "\n"
done
)

#echo $lista; sleep 1

#counter=$(( $(crontab -l | cat | tr " " "-" | wc -l) + 6 ))

dialog --backtitle "Proyecto Shell Script - David Corchado, Mario Carreras, Ismael López y Jaime Gómez" --title "Listar escaneos programados" --msgbox "Lista de escaneos: \n\n$lista" 0 0
# $counter 60

#sleep 1
#done
#clear
