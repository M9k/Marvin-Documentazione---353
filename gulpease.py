import sys
import re
import subprocess
import glob, os
'''
Semplice script che calcola il gulpease per ogni documento
In pratica entra in ogni cartella del documento, cerca tutti i file .tex
(escluso il main -> PianoDiQualifica.tex e il diariomodifiche.tex),
rimuove i tag latex con Detex e inserisce il contenuto dell'estrazione in
una stringa. Questa stringa viene poi scritta su un file temporaneo (il comando
tmp_file.write() lascia sempre un \n, in questo modo non si attaccano parole involontariamente)
e analizzata dallo script in perl.
I vari risultati vengono salvati in una stringa che viene poi stampata nella console.

P.S. il testo estrapolato da detex viene manipolato:
-Vengono sostituite le ; con i .
-Viene aggiunto un punto alla fine di ogni frase che non lo ha (ad esempio i titoli delle sezioni)

Link detex: https://github.com/pkubowicz/opendetex
Per usarlo: Installare python e "python gulpease.py"
Testato con Python v2.7.12
'''

SCRIPT_DIR = sys.path[0]
DETEX_CMD = "detex -e table "
PERL_CMD = "perl gulpease.pl "
TMP_FILE = "tmp.txt"
directories = [
    "Interni/NormeDiProgetto"
]
gulpease_indexes = ""
for directory in directories:
    text = ""
    os.chdir(directory)

'''    document_name = directory.split('/')[-1]
    for tex_file in glob.glob("*.tex"):
        if  document_name not in tex_file and "diariomodifiche" not in tex_file:
            detex = ["detex", "-e", "table", tex_file]
            output, error = subprocess.Popen(detex, stdout=subprocess.PIPE).communicate()
            #r"\w\s\*\n" -> trova tutte le lettere seguite da un numero
            #indefinito (anche 0) di spazi seguiti da un a capo
            #Sono praticamente i titoli delle sezioni, mettendoci il . alla
            #fine l'indice migliora decisamente
            text += re.sub(r"\w\s*\n", "a.\n", re.sub(';', '.', output)) + '\n'
'''
    for tex_file in glob.glob("*.tex"):
        if directory.split('/')[-1] not in tex_file and "diariomodifiche" not in tex_file:
            command = DETEX_CMD + tex_file
            detex = subprocess.Popen(command.split(), stdout=subprocess.PIPE)
            output, error = detex.communicate()
            text += re.sub(r"\w\s*\n", "a.\n", re.sub(';', '.', output))

    if len(text) == 0:
        text = "NOPE" #Cosi non mi crasha il perl
    os.chdir(SCRIPT_DIR)
    tmp_file = open(TMP_FILE, "w")
    tmp_file.write(text)
    tmp_file.close()
'''
    gulpease = ["perl", "gulpease.pl", TMP_FILE]
    output, error = subprocess.Popen(gulpease, stdout=subprocess.PIPE).communicate()
    os.remove(TMP_FILE)
    document_index = output.split()[-1]
    gulpease_indexes += document_name + " - " + document_index + '\n'
'''
    command = PERL_CMD + TMP_FILE
    gulpease = subprocess.Popen(command.split(), stdout=subprocess.PIPE)
    output, error = gulpease.communicate()
    os.remove(TMP_FILE)
    gulpease_indexes += directory.split('/')[-1] + " - " + output.split()[-1] + '\n'
print gulpease_indexes
