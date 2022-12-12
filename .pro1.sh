#!/bin/bash
ruta=$(pwd)

#dialog --ok-label "Siguiente" --msgbox "¡Bienvenido!" 0 0

#break=0
#while [ $break == 0 ]
#do

dialog --backtitle "Proyecto Shell Script" --title "Programar un escaneo" --calendar "Determine la fecha:" 0 0 2>temp
Cancelado=$?
Eleccion=`cat temp` ; rm temp
if [ $Cancelado -eq 0 ]
  then echo "Has elegido: $Eleccion"
  else dialog --backtitle "Proyecto Shell Script" --infobox "¡Has cancelado!" 4 24
  sleep 1
  exit
fi
fecha=$Eleccion

if [[ $fecha < $(date +"%d/%m/%Y") ]]
then
dialog --backtitle "Proyecto Shell Script" --infobox "¡La fecha no puede ser anterior a la fecha actual!" 0 0
sleep 2
exit
fi

dialog --backtitle "Proyecto Shell Script" --title "Programar un escaneo" --timebox "Determine la hora:" 0 0 2>temp
Cancelado=$?
Eleccion=`cat temp` ; rm temp
if [ $Cancelado -eq 0 ]
  then echo "Has elegido: $Eleccion"
  else dialog --backtitle "Proyecto Shell Script" --infobox "¡Has cancelado!" 4 24
  sleep 1
  exit
fi
hora=$Eleccion

if [[ $hora < $(date +"%T") ]]
then
dialog --backtitle "Proyecto Shell Script" --infobox "¡La hora no puede ser anterior a la hora actual!" 0 0
sleep 2
exit
fi

dialog --backtitle "Proyecto Shell Script" --menu "Seleccionar escaneo:" 0 0 0 1 "Escaneo de Red" 2 "Escaneo de Servicios" 3 "Escaneo de Vulnerabilidades" 9 "Salir" 2>temp
Cancelado=$?
Eleccion=`cat temp` ; rm temp
if [ $Cancelado -eq 0 ]
  then
#echo "Has elegido: $Eleccion"
    if [ $Eleccion == 1 ]
    then
#      echo "Escaneo de Red."
      dialog --backtitle "Proyecto Shell Script" --title "Programar Escaneo de Red" --inputbox "Dirección de Red en formato CDIR" 0 0 2>temp
      Cancelado=$?
      Eleccion=`cat temp` ; rm temp
      if [ $Cancelado -eq 0 ]
        then
          crontab -l | cat > temporal
          echo $(echo $hora | cut -d ":" -f 2) $(echo $hora | cut -d ":" -f 1) $(echo $fecha | cut -d "/" -f 1) $(echo $fecha | cut -d "/" -f 2)" * cd $ruta && sh .red.sh $Eleccion 1" >> temporal
          cat temporal | crontab -
          rm temporal
#          ./.red.sh $Eleccion
        else
          dialog --infobox "¡Has cancelado!" 4 24
        fi
    elif [ $Eleccion == 2 ]
    then
#      echo "Escaneo de Servicios."
      dialog --backtitle "Proyecto Shell Script" --title "Programar Escaneo de Servicios" --inputbox "Dirección del DISPOSITIVO" 0 0 2>temp
      Cancelado=$?
      Eleccion=`cat temp` ; rm temp
      if [ $Cancelado -eq 0 ]
        then
          crontab -l | cat > temporal
          echo $(echo $hora | cut -d ":" -f 2) $(echo $hora | cut -d ":" -f 1) $(echo $fecha | cut -d "/" -f 1) $(echo $fecha | cut -d "/" -f 2)" * cd $ruta && sh .ser.sh $Eleccion 1" >> temporal
          cat temporal | crontab -
          rm temporal
#          ./.ser.sh $Eleccion
        else
          dialog --infobox "¡Has cancelado!" 4 24
        fi
    elif [ $Eleccion == 3 ]
    then
#      echo "Escaneo de Vulnerabilidades."
      dialog --backtitle "Proyecto Shell Script" --title "Programar Escaneo de Vulnerabilidades" --inputbox "Dirección del DISPOSITIVO" 0 0 2>temp
      Cancelado=$?
      Eleccion=`cat temp` ; rm temp
      if [ $Cancelado -eq 0 ]
        then
          crontab -l | cat > temporal
          echo $(echo $hora | cut -d ":" -f 2) $(echo $hora | cut -d ":" -f 1) $(echo $fecha | cut -d "/" -f 1) $(echo $fecha | cut -d "/" -f 2)" * cd $ruta && sh .vul.sh $Eleccion 1" >> temporal
          cat temporal | crontab -
          rm temporal
#          ./.vul.sh $Eleccion
        else
          dialog --infobox "¡Has cancelado!" 4 24
        fi
    elif [ $Eleccion == 9 ]
    then
      echo "Salir"
      break=1
    else
      echo "Si ves esto es que algo ha salido mal."
      sleep 1
    fi
  else dialog --infobox "¡Has cancelado!" 4 24
fi




./.cron.sh
#sleep 1
#done
#clear
