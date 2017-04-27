printf " - Script di configurazione attivato\n\n \n- Seguire i passaggi per completare l'installazione.\n\n"
printf " - generazione dello script locale.gen\n\n"
wget -O temp.txt https://raw.githubusercontent.com/tommasoascari/configs/master/system/locale.gen
[ "$?" != 0 ] && ( printf "\nE' stato riscontrato un errore\n nello scaricare il file.\n\n";exit 1)
rm /mount/etc/locale.gen;mv temp.txt /mount/etc/locale.gen;
[ "$?" != 0 ] && ( printf "\nE' stato riscontrato un errore\n nel generare il file locale.gen.\n\n";exit 1)
printf "\n\n - generazione del file /etc/localtime\n\n"
ln -s /mnt/usr/share/zoneinfo/Europe/Rome /etc/localtime
[ "$?" != 0 ] && ( printf "\nE' stato riscontrato un errore\n nel generare il file /etc/localtime\n\n";exit 1)
read -p "\n\n - inserire un hostname per questa macchina\nSolo caratteri alfanumerici, senza spazi: " name
echo "$name" > /mnt/etc/hostname
printf "\n\n - installazione quasi completa"
wget -O /mnt/final.sh https://raw.githubusercontent.com/tommasoascari/archinstaller/master/scripts/grubinstall.sh
chmod 755 final.sh;
printf "\n\n - per completare l'installazione:\n - usa il comando 'arch-chroot /mnt'\n e segui la guida."
