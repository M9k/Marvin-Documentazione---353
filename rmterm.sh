#!/bin/bash
<<FUNZIONAMENTO
  Questo script elimina un termine dal glossario e le relative citazioni
  dai file che lo usano.
FUNZIONAMENTO
<<USAGE
  /bin/bash rmterm.sh termine
USAGE
GLOSSARYDIR="Esterni/Glossario"
GLOSSARYENTRY="newglossaryentry"
GLOSSARYCOMMAND="citGloss"
GLOSSARYFILE="$GLOSSARYDIR/Definizioni.tex"
sed -i "/./{H;\$!d} ; x ;/%INIZIO $1.*%FINE $1/Id" $GLOSSARYFILE #Rimuove il termine dal file delle definizioni
find . -name "*.tex" -not -path "*$GLOSSARYDIR*" | xargs sed -i "s/\\\\$GLOSSARYCOMMAND{$1}/$1/gI" #Regex che toglie il citGloss
