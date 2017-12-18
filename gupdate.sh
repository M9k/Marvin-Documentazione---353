#!/bin/bash
<<USAGE
  FUNZIONANTE SU DISTRIBUTZIONI LINUX
  2 Modi per usarlo:
  1)/bin/bash gupdate.sh
  2)
    Dare permessi di esecuzione al file "chmod +x build.sh"
    ./gupdate.sh
USAGE
<<FUNZIONAMENTO
  Recupera i termini definiti nel glossario
  Cerca in tutti i file .tex i termni trovati e li sostituisce con il comando di
  glossario relativo
FUNZIONAMENTO
#Variabili di configurazione
GLOSSARYDIR="Esterni/Glossario"
GLOSSARYENTRY="newglossaryentry"
PICKCOMMAND="^[^%]$GLOSSARYENTRY" #"^[^%] -> evita di prendere righe commentate
PICKREGEX="$PICKCOMMAND{.*}"
GLOSSARYFILE="$GLOSSARYDIR/Definizioni.tex"
BEFORETERM="\\\\$GLOSSARYENTRY\{"
AFTERTERM="\}"
GLOSSARYCOMMAND="citGloss"

#Script
RAWTERMS=$(grep -o $PICKREGEX "$GLOSSARYFILE") #Ricevi tutti i termini del glossario
IFS=$'\n' TERMS=($RAWTERMS) #Crea un array spezzando la stringa per il carattere a capo
for term in "${TERMS[@]}"; do
  term=${term//$BEFORETERM/""} #Elimina il testo latex lasciando solo il nome del term
  term=${term//$AFTERTERM/""}

  #find ... -> trova il nome di tutti i file .tex ricorsivamente nella
  #cartella corrente (.) evitando la cartella del glossario (-not -path ...)
  FILES=$(find . -name "*.tex" -not -path "*$GLOSSARYDIR*")
  IFS=$'\n' FILES=($FILES) #Spezza la stringa in righe
  for file in "${FILES[@]}"; do #cicla sulle righe

    #Sostiusce i termini evitando le righe che contengono il term desiderato in comandi latext
    #eg \somecommand{requisiti} non viene toccato
    #In questo modo il comando può essere eseguito più volte senza paura di annidare sostituzioni
    #In questo modo evitiamo di mettere la g pedice in sezioni,capitoli, label, etc.
    sed -i "/[\t|' ']*\\\\.*[{[].*$term.*}/I!s/$term/\\\\$GLOSSARYCOMMAND\{$term\}/gI" $file
<<COMMENT
      SPIEGAZIONE COMANDO SOPRA
      sed -i -> esegui sed in place, ovvero lavora direttamente sul file in esame
      Sed è un utility GNU per il find&replace, prende come argomento la regex per la ricerca
      e il termine con cui sostituire il contenuto tornato nel formato:
      s/regex/termine/g
      Per questo compito necessitiamo di due componenti separate:
      1)/[\t|' ']*\\\\.*[{[].*$term.*}/I!
      2)s/$term/\\\\$GLOSSARYCOMMAND\{$term\}/gI
      La 1 viene lanciata per prima e indica quali linee non considerare (grazie a "!"),
      la seconda esegue il find&replace sulle righe considerate, in particolare:
      1 dice di non considerare le linee che contengono la sintassi \command{..termine..}
      2 effettua la sostituzione, ovvero mette il termine in esecuzione in \citGloss{term}

      Segue documentazione dettagliata delle due espressioni
      Nota per GNU, siccome il comando SED in place (-i) non riesce a lavorare con gli
      apici singoli (non chiedetemi perché), gli apici doppi conseguono patch abbastanza
      rognose come: "////" per stampare il backslash (comune carattere di escape,
      in questo caso bisogna eseguire due escape, uno per le virgolette e uno per la REGEX)
      ----------------------------------1-------------------------------------
      / --> trova le stringhe con
      [\t|' ']* --> 0 o più tabulazioni o spazi, seguita da
      \\\\ --> il carattere backslash, seguita da
      .* --> 0 o più caratteri qualsiasi, seguita da
      [{[] -> una parentesi graffa o quadra aperta, seguita da
      } --> una parentesi graffa chiusa (*)
      / --> fine
      ---OPZIONI DI RICERCA---
      I --> case insensitive
      ! --> considera le linee non contenenti questa stringa
      ---COMMENTI---
      * non riesco a dirgli di prendere anche quella quadra, ma sembra funzionare
        siccome i comandi latex con le quadre sono seguiti da graffe
      ----------------------------------2--------------------------------------
      s/ --> trova le stringhe costituite da
      $term --> il termine esaminato
      / --> sostituiscile con
      \\\\ --> il carattere backslash, seguito da
      $GLOSSARYCOMMAND --> il comando per il glossario, seguito da
      \{ --> la parentesi graffa aperta, seguita da
      $term --> il termine esaminato, seguito da
      \} --> la parentesi graffa chiusa
      g --> fine
      ---OPZIONI DI RICERCA--
      I --> case insensitive
COMMENT
  done
done
#Se dovessimo rinominare le cartelle, togliendo gli spazi, un'alternativa
#credo più efficente sarebbe si dare l'output di find direttamente in pasto a sed:
# find . -name "*.tex" -not -path "*$GLOSSARYDIR*" | xargs sed REGEX
