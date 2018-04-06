# -*- coding: utf-8 -*-
import sys
import re
import subprocess
import glob, os
import unirest
import json
from textstat.textstat import textstat
'''
Semplice script che calcola il flesch per ogni documento
In pratica entra in ogni cartella del documento, cerca tutti i file .tex
(escluso il main -> PianoDiQualifica.tex e il diariomodifiche.tex),
rimuove i tag latex con Detex e inserisce il contenuto dell'estrazione in
una stringa. Questa stringa viene poi scritta su un file temporaneo e analizzata
dallo script in perl.
I vari risultati vengono salvati in una stringa che viene poi stampata nella console.

P.S. il testo estrapolato da detex viene manipolato:
-Vengono sostituite le ; con i .
-Viene aggiunto un punto alla fine di ogni frase che non lo ha (ad esempio i titoli delle sezioni)
-I separatori di colonna, nelle tabelle (&), vengono sostituiti con i .

Link detex: https://github.com/pkubowicz/opendetex
-Per usarlo: Installare python e "python flesch.py"
-Testato con Python v2.7.12
'''

SCRIPT_DIR = sys.path[0]
TMP_FILE = "tmp.txt"
directories = [
    "Esterni/ManualeSviluppatore",
    "Esterni/ManualeUtente"
]
flesch_indexes = ""
flesch_obj = []
for directory in directories:
    text = ""
    os.chdir(directory)
    document_name = directory.split('/')[-1]
    for tex_file in glob.glob("*.tex"):
        detex = ["detex", "-e", "table", tex_file] #Il flag -e stampa anche le tabelle
        output, error = subprocess.Popen(detex, stdout=subprocess.PIPE).communicate()
        #r"\w\s\*\n" -> trova tutte le lettere seguite da un numero
        #indefinito (anche 0) di spazi seguiti da un a capo
        #Sono praticamente i titoli delle sezioni, mettendoci il . alla
        #fine l'indice migliora decisamente
        formatted_text = re.sub(';', '.', output) #Sostituisce i "punti e virgola" con il punto
        formatted_text = re.sub(r"\w\s*\n", "a.\n", formatted_text) #Mette il punto dove manca
        formatted_text = re.sub(r"\w\s*\&", "a. ", formatted_text) #Sostitusice il separatore di colonne latex con il punto
        text += formatted_text + '\n'
    os.chdir(SCRIPT_DIR)
    document_index = str(textstat.flesch_reading_ease(text))
    flesch_obj.append({"documento": document_name, "indice": document_index});
    flesch_indexes += document_name + " - " + document_index + '\n'
if "TRAVIS" in os.environ:
    a = unirest.post("http://api.353swe.ml/metrics/flesch.php", headers={ "Accept": "application/json" }, params={'indexes': json.dumps(flesch_obj)})
print flesch_indexes
