#!/bin/bash

./.cron.sh

#dialog --ok-label "Siguiente" --msgbox "¡Bienvenido!" 0 0

#break=0
#while [ $break == 0 ]
#do

#lista=$(cat .cron.txt | tr " " "-" | tr "*" "." | grep -v "#")
lista=$(crontab -l | cat | tr " " "_" | grep -v "#")
#echo $lista; exit

options=$(
contador=1
for n in $(echo $lista)
do
echo -n " "$contador" "
echo -n $n | tr "^" "*"
echo -n " off"
contador=$(($contador + 1))
done
)
#echo $options; sleep 2

dialog --backtitle "Proyecto Shell Script" --title "Borrar escaneos programados" --buildlist "Lista de escaneos:" 0 0 0$options 2>temp
Cancelado=$?
Eleccion=`cat temp` ; rm temp
if [ $Cancelado -eq 0 ]
  then
    #echo "Has elegido: $Eleccion"
    touch temp1
    for n in $Eleccion
    do
      crontab -l | tr " " "%" | cat -n | sed -e 's/^[ \t]*//' | grep ^$n | cut -f 2 | tr "%" " " >> temp1
    done

    crontab -l | cat > temp2

    touch temp3
    comm -23 temp2 temp1 > temp3
    rm temp1
    rm temp2

    dialog --title "Confirmar borrado" --backtitle "Proyecto Shell Script" --yesno "Confirmar borrado de registros." 0 0 2>temp
    Cancelado=$?
    Eleccion=`cat temp` ; rm temp
    if [ $Cancelado -eq 0 ]
      then
        cat temp3 | crontab -
      else
        dialog --infobox "Borrado cancelado" 0 0
        sleep 1
    fi
    rm temp3
  else dialog --infobox "¡Has cancelado!" 4 24
fi

#sleep 1
#done
#clear
