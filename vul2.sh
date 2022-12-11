#!/bin/bash
#PROBLEMA AL LISTAR LAS CVE EN dialog RESUMEN DE VULNERABILIDADES
#LA VARIABLE IP ESTÁ EN MANUAL PARA PROBAR SU FUNCIONAMIENTO. SOLO SE DEBE
#ELIMINAR O COMENTAR PARA QUE TOME LA DEL sh ANTERIOR.

ip="192.168.1.14";
nmap -f -script vuln $ip > subred1.txt;
#Busca las vulnerabilidades de la IP y lo plasma en subred1.txt

cat subred1.txt | grep -w cve subred1.txt > resultado_vuln.txt;
#hace grep sobre subred1.txt y vuelca el resultado en resultado_vuln.txt

dialog --title "Escaneo de VULNERABILIDADES -> $ip" --textbox "resultado_vuln.txt" 0 0; 
#Muestra el resultado en el anterior dialog

#De aquí hacia abajo he intentado hacer las condiciones por si no hay
#vulnerabilidades que diga: NO SE ENCONTRARON VULNERABILIDADES.

grep1=$`grep -n cve resultado_vuln.txt`
#Saca el número de veces que aparece (cve), así puedo hacer el IF, pero me da
#error.


if [ "grep1" -lt "1" ]; then dialog --title "Resultado Vulnerabilidades" --msgbox "Nmap eth0" --textbox "No se han encontrado vulnerabilidades" 0 0;
else echo "reinicie programa.";
fi
