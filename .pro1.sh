#!/bin/bash


#dialog --ok-label "Siguiente" --msgbox "¡Bienvenido!" 0 0

#break=0
#while [ $break == 0 ]
#do

dialog --backtitle "Proyecto Shell Script" --title "Programar un escaneo" --calendar "Determine la fecha:" 0 0 2>temp
Cancelado=$?
Eleccion=`cat temp` ; rm temp
if [ $Cancelado -eq 0 ]
  then echo "Has elegido: $Eleccion" > /dev/null 2>&1
  else dialog --backtitle "Proyecto Shell Script" --infobox "¡Has cancelado!" 4 24
fi
fecha=$Eleccion

#sleep 1

dialog --backtitle "Proyecto Shell Script" --title "Programar un escaneo" --timebox "Determine la hora:" 0 0 2>temp
Cancelado=$?
Eleccion=`cat temp` ; rm temp
if [ $Cancelado -eq 0 ]
  then echo "Has elegido: $Eleccion" > /dev/null 2>&1
  else dialog --backtitle "Proyecto Shell Script" --infobox "¡Has cancelado!" 4 24
fi
hora=$Eleccion

if [[ $(echo $fecha | tr "/" "-") < $(date '+%d-%m-%Y') ]] || [[ $(echo $hora) < $(date +"%T") ]] ;
then
  echo "break"
  dialog --title "¡ERROR!" --backtitle "Proyecto Shell Script" --msgbox "El script no puede tener una fecha inferior a la actual." 0 0
fi

#date '+%d-%m-%Y'
#echo $fecha | tr "/" "-"
#date +"%T"
#echo $hora

./.cron.sh
#sleep 1
#done
clear
