#!/bin/bash


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

#sleep 1

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

if [[ $fecha < $(date +"%d/%m/%Y") ]] || [[ $hora < $(date +"%T") ]]
then
dialog --backtitle "Proyecto Shell Script" --infobox "¡No puedes elegir una fecha anterior a la actual!" 0 0
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
      echo "Escaneo de Red."
      dialog --backtitle "Proyecto Shell Script" --title "Programar Escaneo de Red" --inputbox "Dirección de Red en formato CDIR" 0 0 2>temp
      Cancelado=$?
      Eleccion=`cat temp` ; rm temp
      if [ $Cancelado -eq 0 ]
        then
          crontab -l | cat > temporal
          echo $(echo $hora | cut -d ":" -f 2) $(echo $hora | cut -d ":" -f 1) $(echo $fecha | cut -d "/" -f 1) $(echo $fecha | cut -d "/" -f 2)" * ./home/kali/Gestion-de-Escaneos/.red.sh $Eleccion" >> temporal
          cat temporal | crontab -
#          ./.red.sh $Eleccion
        else
          dialog --infobox "¡Has cancelado!" 4 24
        fi
    elif [ $Eleccion == 2 ]
    then
      echo "Escaneo de Servicios."
      dialog --backtitle "Proyecto Shell Script" --title "Programar Escaneo de Servicios" --inputbox "Dirección del DISPOSITIVO" 0 0 2>temp
      Cancelado=$?
      Eleccion=`cat temp` ; rm temp
      if [ $Cancelado -eq 0 ]
        then
          crontab -l | cat > temporal
          echo $(echo $hora | cut -d ":" -f 2) $(echo $hora | cut -d ":" -f 1) $(echo $fecha | cut -d "/" -f 1) $(echo $fecha | cut -d "/" -f 2)" * ./home/kali/Gestion-de-Escaneos/.ser.sh $Eleccion" >> temporal
          cat temporal | crontab -
#          ./.ser.sh $Eleccion
        else
          dialog --infobox "¡Has cancelado!" 4 24
        fi
    elif [ $Eleccion == 3 ]
    then
      echo "Escaneo de Vulnerabilidades."
      dialog --backtitle "Proyecto Shell Script" --title "Programar Escaneo de Vulnerabilidades" --inputbox "Dirección del DISPOSITIVO" 0 0 2>temp
      Cancelado=$?
      Eleccion=`cat temp` ; rm temp
      if [ $Cancelado -eq 0 ]
        then
          crontab -l | cat > temporal
          echo $(echo $hora | cut -d ":" -f 2) $(echo $hora | cut -d ":" -f 1) $(echo $fecha | cut -d "/" -f 1) $(echo $fecha | cut -d "/" -f 2)" * ./home/kali/Gestion-de-Escaneos/.vul.sh $Eleccion" >> temporal
          cat temporal | crontab -
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
