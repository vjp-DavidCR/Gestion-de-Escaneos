#!/bin/bash

counter=1
lista=$(
for n in $(ls VUL)
do
echo -n " "$n" "$counter
counter=$(($counter + 1))
done
)
#echo $lista

break=0
while (( break == 0 )); do
dialog --backtitle "Proyecto Shell Script - David Corchado, Mario Carreras, Ismael López y Jaime Gómez" --title "Listar Escaneos de Vulnerabilidades" --menu "Elige un registro" 0 0 0 $lista 2>temp
Cancelado=$?
Eleccion=`cat temp` ; rm temp
if [ $Cancelado -eq 0 ]
  then
    dialog --backtitle "Proyecto Shell Script - David Corchado, Mario Carreras, Ismael López y Jaime Gómez" --title "Listar Escaneos de Vulnerabilidades" --textbox "VUL/$Eleccion" 0 0
    dialog --backtitle "Proyecto Shell Script - David Corchado, Mario Carreras, Ismael López y Jaime Gómez" --title "Seleccionar Informe de Escaneo de VULNERABILIDADES" --yesno "¿Desea seleccionar otro INFORME?" 0 0 2>temp
    Cancelado=$?
    Eleccion=`cat temp` ; rm temp
    if [ $Cancelado -ne 0 ]
      then break=1
    fi
  else
    dialog --backtitle "Proyecto Shell Script - David Corchado, Mario Carreras, Ismael López y Jaime Gómez" --infobox "¡Has cancelado!" 4 24
    break=1
fi
done
