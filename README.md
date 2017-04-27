# archinstaller
## *Installer per archlinux semplificato con una guida in italiano*
#### buon divertimento:

#### -- intro --
Credo, se stai leggendo questa guida, che tu stia tentando di installare Arch su una macchina, e che tu sia arrivato al punto di caricare la iso e premere su "Boot Arch Linux nel mennu principale"
Sarai gia stato invitato da un caloroso benvenuto della shell, ZSH, che a primo impatto risulta simile a :
```
  root@archiso ~ # _ 
```
#### -- partizionamento --
Ora avrai bisogno di prenderti qualche minuto, a lume di candela(opzionale) per partizionare l'HDD
Mi sembra quindi un buon momento per ricordarti un paio di punti importanti

 - Se sei un esperto, non seguire questa guida, e' rischioso per la tua salute mentale.
 - Se sei invece un novellino, non seguirla comunque. O almeno non come unica risorsa. Uniscila piuttosto ad un sano utilizzo della wiki.
 - Se non ti senti pronto ad installare arch, antergos e' una comodissima alternativa molto piu' user friendly.
 - Ogni parte di questa guida compresa tra " == " e' inteso come output tty

Detto questo partiamo col partizionamento.
Comincia scrivendo ```fdisk -l``` , l'output ci dara' tutti i dischi disponibili, cosi' possiamo scegliere su quale installare il nostro sistema evitando di pulire tutti i dati sbagliati.
```
root@archiso ~ # fdisk -l

Disk /dev/sda: 16.5 GiB, 17753428394 bytes, 973168 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
```

Nel mio caso ho solo un hard disk, in ```/dev/sda```, se avessi piu' di un HDD vedrei sotto al primo disk anche un secondo ```/dev/sdb``` o qualcosa di relativamente simile.

Tieni bene a mente l'hard disk che hai scelto sul quale andrai ad installare Arch, e digita il comando ```cfdisk /dev/sdx ``` per lanciare il manager di partizioni sul disco scelto, mettendo il nome del tuo disco al posto di "/dev/sdx "

```
root@archiso ~ # cfdisk /dev/sda
```

(nel caso in cui appaia un dialogo premi invio senza problemi)

Dopo aver fatto partire cfdisk sarai reindirizzato alla applicazione, dove se tutto e' andato come si deve vedrai in alto scritto il nome del tuo hard disk, vicino a ```Disk Drive :```.

puoi vedere ora elencate le partizioni del tuo disco.

Nel mio caso il disco e' completamente vuoto e mi mostra solo una partizione ```Free Space```, sta a te decidere se vuoi usare una partizione vuota o eliminarne una e sovrascriverla (selezionandola con le freccette DX e SX e cliccando su delete) ma in entrambi i casi avrai bisogno di due partizioni nuove per installare arch :

- una swap
- un contenitore principale

per realizzarle premi su ```new```, e inserisci la dimensione della swap che preferisci, io la realizzero' di un gigabyte, meta' la dimensione della mia ram, scrivendo ```1G``` e premendo invio

senza deselezionare la partizione, con la freccia a destra seleziono ```Type``` e successivamente ```Linux Swap```

Prossima partizione

Freccia in basso per selezionare la partizione ancora ```Free Space``` e seleziono ```New```
Una volta inserita la grandezza in Gigabyte (per riempire l'intera partizione e' sufficente premere invio) torno su type e stavolta seleziono ```linux filesystem```

ora bastera' premere su ```write``` e le partizioni verranno tutte scritte su disco

una volta finito il partizionamento sara' possibile premere su "quit"


-- installazione pt 1 --

Tutte le partizioni sono state scritte, o almeno in teoria, per controllare bastera' digitare "fdisk -l" e controllare che il disco /dev/sdx che avevi usato prima sia ora pieno con le due partizioni che abbiamo appena realizzato.

==
root@archiso ~ # fdisk -l

Disk /dev/sda: 16.5GiB, 500107862016 bytes, 976773168 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Disklabel type: dos
Disk identifier: 0xd66c8888

Device Boot Start   End   Sectors   Size Id Type
/dev/sda1   781461504 961148925 179687422   1G83 Linux
/dev/sda2   961148928 976771071  15622144   15.5G 82 Linux swap
==

Tutto e' andato secondo i piani.

A questo punto possiamo cominciare l'installazione. Cominciamo con un po di script che dovrebbero aiutarci un po'

Intanto scarica lo script con wget, utilizzando il comando "wget -O begin.sh https://raw.githubusercontent.com/tommasoascari/archinstaller/master/begin.sh"

con questo comando lo script dovrebbe andare in esecuzione: "chmod 755 begin.sh; ./begin.sh"

-- ritorno dallo script --

Se sei arrivato a questo punto della guida ipotizzo che non ci siano stati errori prima e che il tuo sistema sia quasi pronto a partire

Dunque siamo al passaggio piu delicato, se tutto e' andato come si deve allora non ci saranno problemi

digita nel terminale "arch-chroot /mnt", questo ci permettera' di accedere al sistema e completare qualche configurazione prima di concludere l'installazione

==
root@archiso ~ # arch-chroot /mnt
[root@archiso /]#
==

se il comando ti ha reindirizzato alla shell dentro /mnt, allora e' il momento giusto per generare una nuova password di root con il comando "passwd"

##########################################


/etc/locale.gen #su github
da rimuovere gli hashtag vicino ad italia

usr/share/zoneinfo
ls
tuutti i vari posti strani dove sta la roba
usr/share/zoneinfo/europe eccetera

ln -s /usr/share/zoneinfo/europe eccetera /etc/localtime

echo hostname (da definire dall'utente) > /etc/hostname

vuoi installare grub?

pacman -S grub-bios
installazione grub
grub-install /dev/sda (NON SDA2 o 1)
mkinitcpio -p linux
file per hardware connessione
grub-mkconfig -o /boot/grub/grub.cfg
exit
per uscire da chroot

genfstab /mnt >> /mnt/etc/fstab

fine

umount /mnt
