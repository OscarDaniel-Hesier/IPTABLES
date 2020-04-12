#!/bin/bash

echo ' -----------------------------------------------'
echo '|***********______**__***__*********************|'
echo '|----------|  __  |-| |_| |---------------------|'
echo '|----------|  ||  |-|  _  |---------------------|'
echo '|----------|  ||  |-| | | |---------------------|'
echo '|----------|______|_|_| |_|---------------------|'
echo '|                                               |'
echo '|*******Bienvenidos a mi script*****************|'
echo '|                                               |'
echo '|**************OscarHesier**********************|'
echo ' -----------------------------------------------'

#------------------------------------------------------------------------|
#Cerramos todo
sudo iptables -P INPUT DROP
sudo iptables -P OUTPUT DROP
sudo iptables -P FORWARD DROP
#------------------------------------------------------------------------|

echo '¿Cual es su IP?'
#Guardar dato en la var1(able)
read var1
echo 
#------------------------------------------------------------------------|
for i in 1 2 3  
do

   sudo iptables -A INPUT   -s $var1 -j ACCEPT
   sudo iptables -A OUTPUT  -s $var1 -j ACCEPT
   sudo iptables -A FORWARD -s $var1 -j ACCEPT
done

echo 'Listo!!!' 

echo 'Activando puertos: 80 3306 22 443 y 55/......[]'
echo '---------------------------------------------[]'
echo '---------------------------------------------[]'
echo '---------------------------------------------[]'
#------------------------------------------------------------------------|
echo 'Continuar? si '
read res
if [ $res == 'si' ] || [ $res == 'SI' ]
then
sudo iptables -A INPUT   -s $var1 -p tcp --dport 80 -j ACCEPT
sudo iptables -A OUTPUT  -s $var1 -p tcp --dport 80 -j ACCEPT
sudo iptables -A FORWARD -s $var1 -p tcp --dport 80 -j ACCEPT
#---------------------------------------------------------------------|
sudo iptables -A INPUT   -s $var1 -p tcp --dport 3306 -j ACCEPT
sudo iptables -A OUTPUT  -s $var1 -p tcp --dport 3306 -j ACCEPT 
sudo iptables -A FORWARD -s $var1 -p tcp --dport 3306 -j ACCEPT
#---------------------------------------------------------------------|
sudo iptables -A INPUT   -s $var1 -p tcp --dport 22 -j ACCEPT
sudo iptables -A OUTPUT  -s $var1 -p tcp --dport 22 -j ACCEPT
sudo iptables -A FORWARD -s $var1 -p tcp --dport 22 -j ACCEPT
#---------------------------------------------------------------------|
sudo iptables -A INPUT   -s $var1 -p tcp --dport 443 -j ACCEPT
sudo iptables -A OUTPUT  -s $var1 -p tcp --dport 443 -j ACCEPT
sudo iptables -A FORWARD -s $var1 -p tcp --dport 443 -j ACCEPT 
#---------------------------------------------------------------------|
sudo iptables -A INPUT   -s $var1 -p tcp --dport 55 -j ACCEPT
sudo iptables -A OUTPUT  -s $var1 -p tcp --dport 55 -j ACCEPT
sudo iptables -A FORWARD -s $var1 -p tcp --dport 55 -j ACCEPT 
#---------------------------------------------------------------------|
echo 'Listo!!!'
echo 
echo 
echo ' Ingresamos  3 IPS'
#---------------------------------------------------------------------|
read ip1
read ip2
read ip3



   sudo iptables -A INPUT   -s $ip1 -j ACCEPT
   sudo iptables -A OUTPUT  -s $ip1 -j ACCEPT
   sudo iptables -A FORWARD -s $ip1 -j ACCEPT

   sudo iptables -A INPUT   -s $ip2 -j ACCEPT
   sudo iptables -A OUTPUT  -s $ip2 -j ACCEPT
   sudo iptables -A FORWARD -s $ip2 -j ACCEPT


   sudo iptables -A INPUT   -s $ip3 -j ACCEPT
   sudo iptables -A OUTPUT  -s $ip3 -j ACCEPT
   sudo iptables -A FORWARD -s $ip3 -j ACCEPT

#---------------------------------------------------------------------|
echo 'se hizo con exito '
echo 
echo ' se activara los servicios de mysql apache2 y ssh'
   sudo /etc/init.d/mysql restart
   sudo service apache2 start
   sudo service ssh start

else
#---------------------------------------------------------------------|
sudo iptables -P INPUT ACCEPT
sudo iptables -P OUTPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
echo 'se detendran todo'
echo 
#---------------------------------------------------------------------|
sudo /etc/init.d/mysql stop
sudo service apache2 stop
sudo service ssh stop
#---------------------------------------------------------------------|
fi
echo '|----------------------------------------------------------------------|'
echo '|-esto no es Metasploit,o ninguna otra herramienta, es un simple script|'
echo '|----------------------------------------------------------------------|'




