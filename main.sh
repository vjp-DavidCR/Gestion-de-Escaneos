#!/bin/bash

dialog --backtitle "Proyecto Shell Script" --ok-label "Siguiente" --msgbox "¡Bienvenido!" 0 0

break=0
while [ $break == 0 ]
do

dialog --backtitle "Proyecto Shell Script" --menu "Menú Principal" 0 0 0 1 "Escaneo de dispositivos" 2 "Programación de escaneos" 3 "Consultar escaneos de red" 4 "Consultar escaneos de servicios" 5 "Consultar escaneos de vulneravilidades" 0 "Salir" 2>temp
Cancelado=$?
Eleccion=`cat temp` ; rm temp
if [ $Cancelado -eq 0 ]
  then
#echo "Has elegido: $Eleccion"
    if [ $Eleccion == 1 ]
    then
      echo "Escaneo de dispositivos."
      ./.red.sh
    elif [ $Eleccion == 2 ]
    then
      echo "Programación de escaneos."
      ./.pro.sh
    elif [ $Eleccion == 3 ]
    then
      echo "Consultar escaneos de red."
      ./.cred.sh
    elif [ $Eleccion == 4 ]
    then
      echo "Consultar escaneos de servicios."
      ./.cser.sh
    elif [ $Eleccion == 5 ]
    then
      echo "Consultar escaneos de vulnerabilidades."
      ./.cvul.sh
    elif [ $Eleccion == 0 ]
    then
      dialog --backtitle "Proyecto Shell Script" --infobox "¡Hasta la próxima!" 4 24
      break=1
    else
      echo "Si ves esto es que algo ha salido mal."
      sleep 1
    fi
  else
  dialog --backtitle "Proyecto Shell Script" --infobox "¡Has cancelado!" 4 24
fi
sleep 1
done
clear
