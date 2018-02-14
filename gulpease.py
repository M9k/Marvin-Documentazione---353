# -*- coding: utf-8 -*-
import sys
import re
import subprocess
import glob, os
import unirest
import json
'''
Semplice script che calcola il gulpease per ogni documento
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
-Per usarlo: Installare python e "python gulpease.py"
-Testato con Python v2.7.12
'''

SCRIPT_DIR = sys.path[0]
TMP_FILE = "tmp.txt"
directories = [
    "Interni/StudioDiFattibilità",
    "Interni/NormeDiProgetto",
    "Interni/VER-2017-11-13",
    "Interni/VER-2018-01-29",
    "Esterni/AnalisiDeiRequisiti",
    "Esterni/PianoDiProgetto",
    "Esterni/PianoDiQualifica",
    "Esterni/VER-2017-11-22",
    "Esterni/VER-2017-12-08",
    "Esterni/VER-2018-01-09",
    "LetteraDiPresentazione"
]
gulpease_indexes = ""
gulpease_obj = []
with_intro = ["LetteraDiPresentazione", "Verbale"]
for directory in directories:
    text = ""
    os.chdir(directory)
    document_name = directory.split('/')[-1]
    for tex_file in glob.glob("*.tex"):
        if  directory in with_intro or (document_name not in tex_file and "diariomodifiche" not in tex_file):
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
    if len(text) == 0:
        text = "NOPE" #Cosi non mi crasha il perl
    os.chdir(SCRIPT_DIR)
    tmp_file = open(TMP_FILE, "w")
    tmp_file.write(text)
    tmp_file.close()
    gulpease = ["perl", "gulpease.pl", TMP_FILE]
    output, error = subprocess.Popen(gulpease, stdout=subprocess.PIPE).communicate()
    os.remove(TMP_FILE)
    document_index = output.split()[-1]
    gulpease_obj.append({"documento": document_name, "indice": document_index});
    gulpease_indexes += document_name + " - " + document_index + '\n'
a = unirest.post("http://api.353swe.ml/metrics/gulpease.php", headers={ "Accept": "application/json" }, params={'indexes': json.dumps(gulpease_obj)})
print gulpease_indexes
