#!/bin/bash

#dialog --ok-label "Siguiente" --msgbox "¡Bienvenido!" 0 0

#break=0
#while [ $break == 0 ]
#do

dialog --menu "Opciones:" 0 0 0 1 "Escaneo de dispositivos" 2 "Programación de escaneos" 2>temp
Cancelado=$?
Eleccion=`cat temp` ; rm temp
if [ $Cancelado -eq 0 ]
  then echo "Has elegido: $Eleccion"
  else dialog --infobox "¡Has cancelado!" 4 24
fi
#sleep 1
#done
#clear
