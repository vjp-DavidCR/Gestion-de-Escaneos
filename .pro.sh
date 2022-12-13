#!/bin/bash

#./.cron.sh

#dialog --ok-label "Siguiente" --msgbox "¡Bienvenido!" 0 0

break=0
while [ $break == 0 ]
do

dialog --nocancel --backtitle "Proyecto Shell Script - David Corchado, Mario Carreras, Ismael López y Jaime Gómez" --menu "Opciones:" 0 0 0 1 "Programar nuevo escaneo" 2 "Listar escaneos programados" 3 "Borrar escaneos programados" 9 "Salir" 2>temp
Cancelado=$?
if [ $Cancelado -ne 0 ]
  then
        exit
fi

Eleccion=`cat temp` ; rm temp
if [ $Cancelado -eq 0 ]
  then
#echo "Has elegido: $Eleccion"
    if [ $Eleccion == 1 ]
    then
#      echo "Programar nuevo escaneo."
      ./.pro1.sh
      ./.cron.sh
    elif [ $Eleccion == 2 ]
    then
#      echo "Listar escaneos programados."
      ./.pro2.sh
      ./.cron.sh
    elif [ $Eleccion == 3 ]
    then
#      echo "Borrar escaneos programados."
      ./.pro3.sh
      ./.cron.sh
    elif [ $Eleccion == 9 ]
    then
#      echo "Salir"
      break=1
    else
      echo "Si ves esto es que algo ha salido mal."
      sleep 1
    fi
  else dialog --backtitle "Proyecto Shell Script - David Corchado, Mario Carreras, Ismael López y Jaime Gómez" --infobox "¡Has cancelado!" 4 24
  sleep 1
fi


#sleep 1
done
#clear
