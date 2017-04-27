# archinstaller
## *Installer per archlinux semplificato con una guida in italiano*
**buon divertimento :)**

## -- intro --
Credo, se stai leggendo questa guida, che tu stia tentando di installare Arch su una macchina, e che tu sia arrivato al punto di caricare la iso e premere su "Boot Arch Linux" nel menu principale.
Sarai gia stato invitato da un caloroso benvenuto della shell, ZSH, che a primo impatto risulta simile a:
```
  root@archiso ~ # _ 
```
## -- partizionamento --
Ora avrai bisogno di prenderti qualche minuto, a lume di candela (opzionale) per partizionare l'HDD
Mi sembra quindi un buon momento per ricordarti un paio di punti importanti

 - Se sei un esperto, non seguire questa guida, è rischioso per la tua salute mentale.
 - Se sei invece un novellino, non seguirla comunque. O almeno non come unica risorsa. Uniscila piuttosto ad un sano utilizzo della wiki.
 - Se non ti senti pronto ad installare arch, antergos è una comodissima alternativa molto più user friendly.
 - Durante il corso di questa installazione avrai bisogno si un costante accesso ad internet, in caso contrario il programma potrebbe incombere in errori anche molto dannosi

Detto questo partiamo col partizionamento.
Comincia scrivendo ``fdisk -l`` , l'output ci darà tutti i dischi disponibili, così possiamo scegliere su quale installare il nostro sistema evitando di pulire tutti i dati sbagliati.

```
root@archiso ~ # fdisk -l

Disk /dev/sda: 16.5 GiB, 17753428394 bytes, 973168 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
```

Nel mio caso ho solo un hard disk, in ``/dev/sda``, se avessi più di un HDD vedrei sotto al primo disk anche un secondo ``/dev/sdb`` o qualcosa di relativamente simile.

Tieni bene a mente l'hard disk che hai scelto sul quale andrai ad installare Arch, e digita il comando ``cfdisk /dev/sdx `` per lanciare il manager di partizioni sul disco scelto, mettendo il nome del tuo disco al posto di ``/dev/sdx``.

```
root@archiso ~ # cfdisk /dev/sda
```

(nel caso in cui appaia un dialogo premi invio senza problemi)

Dopo aver fatto partire ``cfdisk`` sarai reindirizzato alla applicazione, dove se tutto è andato come si deve vedrai in alto scritto il nome del tuo hard disk, vicino a ``Disk Drive:``.

Puoi vedere ora elencate le partizioni del tuo disco.

Nel mio caso il disco è completamente vuoto e mi mostra solo una partizione ``Free Space``, sta a te decidere se vuoi usare una partizione vuota o eliminarne una e sovrascriverla (selezionandola con le freccette ← e → e cliccando su ``delete``) ma in entrambi i casi avrai bisogno di due partizioni nuove per installare arch:

- una swap
- un contenitore principale

Per realizzarle premi su ``new``, e inserisci la dimensione della swap che preferisci, io la realizzerò di un gigabyte, metà la dimensione della mia ram, scrivendo ``1G`` e premendo invio.

Senza deselezionare la partizione, con la freccia a destra seleziono ``Type`` e successivamente ``Linux Swap``.

Prossima partizione:

Freccia in basso per selezionare la partizione ancora ``Free Space`` e seleziono ``New``
Una volta inserita la grandezza in gigabyte (per riempire l'intera partizione è sufficente premere invio) torno su ``Type`` e stavolta seleziono ``linux filesystem``.

Ora basterà premere su ``write``, scrivere `` yes`` e le partizioni verranno tutte scritte su disco.

Una volta finito il partizionamento sarà possibile premere su ``Quit``.


## -- installazione pt 1 --

Tutte le partizioni sono state scritte, o almeno in teoria, per controllare basterà digitare ``fdisk -l`` e controllare che il disco ``/dev/sdx`` che avevi usato prima sia ora pieno con le due partizioni che abbiamo appena realizzato.

```
root@archiso ~ # fdisk -l

Disk /dev/sda: 16.5GiB, 500107862016 bytes, 976773168 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Disklabel type: dos
Disk identifier: 0xd66c8888

Device Boot Start   End   Sectors   Size Id Type
/dev/sda1   781461504 961148925 179687422   1G  83 Linux
/dev/sda2   961148928 976771071  15622144   15.5G 82 Linux swap
```

Tutto è andato secondo i piani.

A questo punto possiamo cominciare l'installazione. Cominciamo con un po' di script che dovrebbero aiutarci un po'.

Intanto scarica lo script con wget, utilizzando il comando ``wget -O begin.sh https://raw.githubusercontent.com/tommasoascari/archinstaller/master/scripts/installer.sh``.

con questo comando lo script dovrebbe andare in esecuzione: ``chmod 755 installer.sh; ./installer.sh``.

## -- ritorno dallo script --

Se sei arrivato a questo punto della guida ipotizzo che non ci siano stati errori prima e che il tuo sistema sia quasi pronto a partire.

Dunque siamo al passaggio piu delicato, se tutto è andato come si deve allora non ci saranno problemi.

ora il tuo sistema e' installato, ma prima di accedervi abbiamo bisogno di sistemare un paio di cose:

Digita nel terminale ``arch-chroot /mnt``, questo ci permetterà di accedere al sistema e completare qualche configurazione prima di concludere l'installazione.

```
root@archiso ~ # arch-chroot /mnt
[root@archiso /]#
```
Se il comando ti ha reindirizzato alla shell dentro ``/mnt`` come nell'esempio allora è il momento giusto per attivare lo script di configurazione finale.

Ma prima cambia la password, utilizzando il comando ``passwd``, cosi possiamo utilizzare l'utente root con facilita'

ora ti rimane un solo step, devi avviare lo script di configurazione con il comando ``./final.sh``
Lo script ti seguira' negli ultimi passi di installazione.

### buon divertimento :)
