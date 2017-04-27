echo;echo " SCRIPT > start.sh e' stato attivato"
echo; echo " SCRIPT > Questo script necessita di una connessione ad internet, PRIMA DI CONTINUARE ASSICURARSI DI AVERE CONNESSO IL CAVO DI RETE E DI ESSERE ONLINE"
echo

read -p " SCRIPT > Sei sicuro che il computer sia connesso? (yes/no) : " yn
[ "$yn" != yes ] && ( echo;echo " SCRIPT > connettiti e riprova";echo;echo " SCRIPT > se non hai una connessione via cavo digita wifi-menu e connettiti utilizzando quello";echo; exit 1)

echo;echo " SCRIPT > perfetto, si procede"
echo;echo " SCRIPT > il prossimo comando potrebbe metterci un po piu di quanto ti aspetti, quindi prenditi una pausa e lascia questo script a
lavorare"
echo;sleep 2
echo
pacstrap /mnt base base-devel
[ "$?" != 0 ] && ( echo;echo " SCRIPT > qualcosa e' andato storto";echo;echo " SCRIPT > mi dispiace, ma a questo punto dovrai controllare sulla wiki";echo; exit 1)

echo;echo " SCRIPT > BUONE NOTIZIE, a quanto pare il sistema e' stato caricato e ora mancano solo pochi passaggi prima di terminare"
echo;sleep 1;echo;echo " SCRIPT > ora sta a te entrare nella partizione principale e terminare l'installazione, punta alla guida per il resto delle informazioni"
echo
