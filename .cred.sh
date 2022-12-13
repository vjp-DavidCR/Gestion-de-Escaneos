#!/bin/bash

counter=1
lista=$(
for n in $(ls RED)
do
echo -n " "$n" "$counter
counter=$(($counter + 1))
done
)
#echo $lista

break=0
while (( break == 0 )); do
dialog --backtitle "Proyecto Shell Script - David Corchado, Mario Carreras, Ismael Lopez y Jaime Gómez" --title "Seleccionar Informe" --menu "Informes de Escaneo de RED" 0 0 0 $lista 2>temp
Cancelado=$?
Eleccion=`cat temp` ; rm temp
if [ $Cancelado -eq 0 ]
  then
    dialog --backtitle "Proyecto Shell Script - David Corchado, Mario Carreras, Ismael Lopez y Jaime Gómez" --title "Informe de Red" --textbox "RED/$Eleccion" 0 0
    dialog --backtitle "Proyecto Shell Script - David Corchado, Mario Carreras, Ismael Lopez y Jaime Gómez" --title "Seleccionar Informe de Escaneo de RED" --yesno "¿Desea seleccionar otro INFORME?" 0 0 2>temp
    Cancelado=$?
    Eleccion=`cat temp` ; rm temp
    if [ $Cancelado -ne 0 ]
      then break=1
    fi
  else
    dialog --backtitle "Proyecto Shell Script - David Corchado, Mario Carreras, Ismael Lopez y Jaime Gómez" --infobox "¡Has cancelado!" 4 24
    break=1
fi
done
