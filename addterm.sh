#!/bin/bash
<<USAGE
  /bin/bash addterm.sh "nome_termine" "descrizione"
  La descrizione è falcoltativa: può essere aggiunta manualmente dopo
USAGE
<<FUNZIONAMENTO
  Lo script aggunge un termine nel file di definizione di glossario
  Dopo di che aggiorna tutti i file contententi quel termine
FUNZIONAMENTO
GLOSSARYDIR="Esterni/Glossario"
GLOSSARYCOMMAND="citGloss"
GLOSSARYFILE="$GLOSSARYDIR/Definizioni.tex"

if [[ -z "$1" ]]; then
  echo "E' obbligatorio inserire il nome del termine"
  exit 2
fi
UPPERENTRY=$(echo "$1" | tr '[:lower:]' '[:upper:]') #Mette in uppercase l'argomento passato
#crea la stringa da inserire le definizioni
NEWENTRY="
%INIZIO $UPPERENTRY
\\newglossaryentry{$1}{
	name={$1},
	description={$2}
}
%FINE $UPPERENTRY"
echo "$NEWENTRY" >> $GLOSSARYFILE #Scrive in modalità append la stringa nel file di definizioni
/bin/bash gupdate.sh $1 #Lancia il comando di update glossario del termine inserito
