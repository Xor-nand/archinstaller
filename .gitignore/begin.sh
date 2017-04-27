echo;echo " SCRIPT > begin.sh e' stato attivato! "
echo;echo;echo " SCRIPT > questo script dovrebbe prendersi a conto un paio di lavori piuttosto noiosi"
echo;read -p " SCRIPT > scrivi qui il nome della tua partizione principale dove vuoi installare il sistema (esempio : sda1) : " main
read -p " SCRIPT > scrivi qui il nome della tua partizione dove e' allocata la swap (esempio : sda2) : " sec
echo;echo " SCRIPT > augurami (e augurati) buona fortuna"

mkfs.ext4 /dev/$main
[ "$?" != 0 ] && ( echo;echo " SCRIPT > qualcosa e' andato storto";echo;echo " SCRIPT > mi dispiace, non sono riuscito a formattare la partizine in ext4" ;echo )

mount /dev/$main /mnt
[ "$?" != 0 ] && ( echo;echo " SCRIPT > qualcosa e' andato storto";echo;echo " SCRIPT > mi dispiace, non sono riuscito a montare la partizione formattata";echo; exit 1)

mkswap /dev/$sec
[ "$?" != 0 ] && ( echo;echo " SCRIPT > qualcosa e' andato storto";echo;echo " SCRIPT > mi dispiace, non sono riuscito ad generare la swap";echo; exit 1)

swapon /dev/$sec
[ "$?" != 0 ] && ( echo;echo " SCRIPT > qualcosa e' andato storto";echo;echo " SCRIPT > mi dispiace, non sono riuscito ad attivare la swap";echo; exit 1)

sleep 1
echo;echo " SCRIPT > non ho rilevato errori, questo significa che il lavoro e' andato a buon fine. ora e' arrivato il momento di installare effettivamente il sistema sulla macchina"
echo;sleep 1
echo " SCRIPT > sto scaricando la seconda parte dello script"
## download from github maybe?
chmod 755 start.sh

echo;echo "se te la senti di continuare digita 'yes', se ci sono stati problemi digita 'no' e controlla la wiki, o scrivi a tommasoascari.office@gmail.com"
echo;read -p " SCRIPT > il computer e' connesso ad internet ? (yes/no) : " yn
[ "$yn" != yes ] && (echo;echo " SCRIPT > Buona fortuna e buon lavoro.";echo;echo " SCRIPT > Quitting";echo; exit 1)
sleep1
echo;echo "Fantastico, allora mi pare il caso di continuare, ora eseguiro' il prossimo script di installazione, start.sh, se non riesco puoi attivarlo tu manualmente digitando './start.sh'"
echo;./start.sh
[ "$?" != 0 ] && ( echo;echo " SCRIPT > qualcosa e' andato storto";echo;echo " SCRIPT > non sono riuscito ad attivare il secondo script, forse non sei connesso ad internet";echo; exit 1)
