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
dialog --backtitle "Proyecto Shell Script" --title "Seleccionar Informe" --menu "Informes de Escaneo de RED" 0 0 0 $lista 2>temp
Cancelado=$?
Eleccion=`cat temp` ; rm temp
if [ $Cancelado -eq 0 ]
  then
    dialog --backtitle "Proyecto Shell Script" --title "Informe de Red" --textbox "RED/$Eleccion" 0 0
  else
    dialog --backtitle "Proyecto Shell Script" --infobox "¡Has cancelado!" 4 24
    break=1
fi
done
