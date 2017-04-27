printf "- Script attivato\n\n Connettere il computer ad internet\n- Prima di svolgere qualsiasi operazione.\n\n"
read -p "- Il computer e' connesso ad internet? (yes/no): " yn
[ "$yn" == y ] && (yn=yes);[ "$yn" == n ] && (yn=x)
[ "$yn" != yes ] && ( printf "\n- Connettiti ad una rete e riavvia lo script.\n\n"; exit 1)
read -p "- Inserire nome partizione swap (e.g. sda1) : " swap
read -p "- Inserire nome partizione principale (e.g. sda2) : " main
printf "\n\n - Formattando /dev/$main come ext4 \n\n"
mkfs.ext4 /dev/$main
[ "$?" != 0 ] && ( printf "\nE' stato riscontrato un errore\n nel formattare il disco\n\n";exit 1)
printf "\n\n - Montando /dev/$main su /mnt \n\n"
mount /dev/$main /mnt
[ "$?" != 0 ] && ( printf "\nE' stato riscontrato un errore\n nel montare /dev/$main\n\n";exit 1)
printf "\n\n - Generando file di swap in /dev/$swap \n\n"
mkswap /dev/$sec
[ "$?" != 0 ] && ( printf "\nE' stato riscontrato un errore\n nel generare il file swap\n\n";exit 1)
printf "\n\n - Attivando partizione di swap /dev/$swap\n\n"
swapon /dev/$sec
[ "$?" != 0 ] && ( printf "\nE' stato riscontrato un errore\n nell'attivare la swap \n\n";exit 1)
printf "\n\n - Procedura iniziale completata \n - Download della seconda parte dellos script di installazione\n\n"
wget -O start.sh https://raw.githubusercontent.com/tommasoascari/archinstaller/master/start.sh
[ "$?" != 0 ] && ( printf "\nE' stato riscontrato un errore\n nello scaricare lo script.\n\n";exit 1)
printf "\n\n - esecuzione dello script\n\n"
chmod 755 start.sh
[ "$?" != 0 ] && ( printf "\nE' stato riscontrato un errore\n nell'eseguire il programma";exit 1)
