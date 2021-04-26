#!/bin/bash
#funcivariables
TIEMPO=$(date +%F/%H-%M-%S)
FECHA=$(date +%F)

echo "menu basico nmap"
echo "$FECHA"
echo "1) Reconocimiento de red con SYN"
echo "2) Reconocimiento de puertos y script basico sobre puertos "
echo "3) dispositivos en la red" 
echo "4) posibles vulnerabilidades que contiene nmap  (Necesitaras privilegios ROOT)"  
echo "5) salir"
read -p "elija una opcion : " opcion
case $opcion in


1)
    echo "indique la dirreccion"
    read -p "direccion:  " direccion1
        echo "Escaneando la red en busca de informacion ..."

           # nmap -sS --min-rate 5000 -p- --open -vvv -n -Pn $direccion para ejecutarlo necesitas ser  root suele ser mejor
        nmap -p- --open -T5 -v -n  "$direccion1"

 echo "$TIEMPO"   
    ;;
2) 
    read -p "indique la direccion para escanear los puertos  : " puertos2

            nmap -sC -sV "$puertos2"

    echo "$TIEMPO"
    #nmap -sC -sV -p22,80,139,445 ip -oN +fichero
    ;;
3)
    echo "indique la red y su mascara  :  "
    read -p "ejemplo :  192.168.1.*/24    ahora ponga su direccion : " dispositivos3
            echo "Escaneando la red en busca de informacion ..."

          nmap -sP "$dispositivos3"

    echo "$TIEMPO"
    ;;    
4)
   echo "indique la dirreccion"
    read -p "direccion : " direccion4

        echo "Escaneando la red en busca de informacion ..."
  
            nmap -f --script vuln "$direccion4"

    echo "$TIEMPO"
    ;;
5) 
    echo "ha elegido salir"
    exit 0
    ;;
*)
    echo "prueba otra opcion"
    ;;
esac