#!/bin/bash
<<USAGE
  FUNZIONANTE SU DISTRIBUTZIONI LINUX
  2 Modi per usarlo:
  1)/bin/bash build.sh
  2)
    Dare permessi di esecuzione al file "chmod +x build.sh"
    ./build.sh
USAGE
<<FUNZIONAMENTO
  Esegue la compilazione per vedere se le modifiche manuali non rompono niente
  Crea una cartella di backup dove salvare il contenuto attuale
  Esegue l'aggiornamento del glossario
  Compila per vedere se l'aggiornamento del glossario ha rotto qualcosa
    Se non ha rotto niente elmina la cartella di bakcup
    Altrimenti recupera il contenuto della cartella di backup e stampa gli errori in un log
  FINE
FUNZIONAMENTO
<<NOTE
  "&>/dev/null" --> non stampa l'output, vedere se compatibile con travis/windows
NOTE

#Configurazione
#BACKUPDIR="/tmp/backup" #cartella di backup, verificare supporto travis/windows
#rm -r $BACKUPDIR/ &>/dev/null

# Compila due volte
/bin/bash compile.sh
/bin/bash compile.sh

#prima compilazione
#COMPILELOG=$(/bin/bash compile.sh) #Prova a compilare salvandosi il risultato
#RESULT="${COMPILELOG##*$'\n'}" #Si trova l'ultima riga dell'output di compilazione
#if [[ $RESULT != "ok" ]]; then
#  echo "LE MODIFCHE EFFETTUATE SONO ERRATE, CONTROLLARE I FILE MODIFICATI"
#  exit 10001;
#fi

#UPDATE DEL GLOSSARIO
#mkdir $BACKUPDIR/ &>/dev/null #Crea la cartella di backup
#cp -r * $BACKUPDIR/ &>/dev/null #Copia il contenuto corrente nella cartella di backup

###########################################
#  FUNZIONE TEMPORANEAMENTE DISABILITATA  #
###########################################
# /bin/bash gupdate.sh #Esegue l'update dei termini del glossario
###########################################

#COMPILELOG=$(/bin/bash compile.sh) #Prova a compilare salvandosi il risultato
#RESULT="${COMPILELOG##*$'\n'}" #Si trova l'ultima riga dell'output di compilazione
#if [[ $RESULT == 'ok' ]]; then
#  rm -r $BACKUPDIR #Rimuove la cartella di backup
#  echo "EVERYTHING IS GONNA BE ALL RIGHT"
#  echo "ok"
#  exit 0;
#else
#  echo "$COMPILELOG" > compile_errors.log
#  rm -r * #Elimina il contenuto rotto da gupdate.sh
#  mv -f $BACKUPDIR/* . #Recupera la cartella di backup
#  rm -r $BACKUPDIR/ #Rimuove la cartella di bakcup
#  echo "GLOSSARY UPDATE BROKE SOMETHING, ROLLBACK EXECUTED"
#  echo "See compile_errors.log for further details"
#  exit 10000;
#fi
