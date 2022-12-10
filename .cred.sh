#!/bin/bash

counter=1
lista=$(
for n in $(ls RED)
do
echo -n " "$n" "$counter
counter=$(($counter + 1))
done
)
echo $lista

dialog --backtitle "Proyecto Shell Script" --title "Listar Escaneos de Red" --menu "Elige un registro" 0 0 0 $lista 2>temp
Cancelado=$?
Eleccion=`cat temp` ; rm temp
if [ $Cancelado -eq 0 ]
  then
    lista=$(
    for n in $(cat RED/$Eleccion); do
    echo $n"\n"
    done)
    dialog --backtitle "Proyecto Shell Script" --title "Listar Escaneos de Red" --msgbox "$lista" 0 0
  else dialog --infobox "¡Has cancelado!" 4 24
fi
