printf " - Script attivato\n\n Connettere il computer ad internet\n- Prima di svolgere qualsiasi operazione.\n\n"
read -p " - Continuare con l'installazione? (yes/no): " yn
[ "$yn" == y ] && (yn=yes);[ "$yn" == n ] && (yn=x)
[ "$yn" != yes ] && ( printf "\n- Riprendi l'installazione quando vuoi con './updater.sh'\n\n"; exit 0)
printf "\n\n - installando il sistema su /mnt \n"
printf " - Ci vorra' un po. prenditela comoda \n\n"
sleep 2;pacstrap /mnt base base-devel
[ "$?" != 0 ] && ( printf "\nE' stato riscontrato un errore\n nell'installare il sistema\n\n";exit 1)
printf "\n\n - Installazione completata\n\n"
wget -O configure.sh https://raw.githubusercontent.com/tommasoascari/archinstaller/master/scripts/configure.sh
chmod 755 configure.sh;./configure.sh
