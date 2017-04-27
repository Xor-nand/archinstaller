read -p "\n\n - ultimi passaggi:\n - Vuoi installare GRUB? (yes/no) : " yn
[ "$yn" == n ] && (yn=no);[ "$yn" == y ] && (yn=yes)
[ "$yn" != yes ] && ( printf "\n\n - Puoi riavviare la procedura utilizzando \nil comando : 'final.sh'\n\n"; exit 0)
pacman -S grub-bios
[ "$?" != 0 ] && ( printf "\nE' stato riscontrato un errore\n nello scaricare GRUB \n\n";exit 1)
read -p "\n\n - inserisci il nome dell'hard disk\nsu cui installare GRUB \n (e.g. sda or sdb, NOT sda1) : " HDD
grub-install /dev/$HDD
[ "$?" != 0 ] && ( printf "\nE' stato riscontrato un errore\n nell'installare GRUB \n\n";exit 1)
mkinitcpio -p linux
[ "$?" != 0 ] && ( printf "\nE' stato riscontrato un errore\n nel generare il file mkinitcpio \n\n";exit 1)
grub-mkconfig -o /boot/grub/grub.cfg
[ "$?" != 0 ] && ( printf "\nE' stato riscontrato un errore\n nel generare grup.cfg\n\n";exit 1)
printf "\n - IL SISTEMA E' STATO INSTALLATO CORRETTAMENTE \n\n"
printf "copia e incolla i successivi comandi per confermare l'installazione \n\n"
printf "   exit  \n\n"
printf "   genfstab /mnt >> /mnt/etc/fstab ; umount /mnt  \n\n"
