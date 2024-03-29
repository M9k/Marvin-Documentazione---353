<<USAGE
  FUNZIONANTE SU DISTRIBUTZIONI LINUX
  2 Modi per usarlo:
  1)/bin/bash compile.sh
  2)
    Dare permessi di esecuzione al file "chmod +x build.sh"
    ./compile.sh
USAGE

cd 'Esterni'
cd Glossario
pdflatex -interaction=nonstopmode -halt-on-error GlossarioEST.tex && echo "ok" || exit  1
pdflatex -interaction=nonstopmode -halt-on-error GlossarioEST.tex && echo "ok" || exit  2
pdflatex -interaction=nonstopmode -halt-on-error GlossarioEST.tex && echo "ok" || exit  3
cd ..
cd ..

cd 'Esterni'
cd AnalisiDeiRequisiti
pdflatex -interaction=nonstopmode -halt-on-error AnalisiDeiRequisiti.tex && echo "ok" || exit  4
cd ..
cd ..

cd 'Esterni'
cd PianoDiProgetto
pdflatex -interaction=nonstopmode -halt-on-error PianoDiProgetto.tex && echo "ok" || exit  5
cd ..
cd ..

cd 'Esterni'
cd PianoDiQualifica
pdflatex -interaction=nonstopmode -halt-on-error PianoDiQualifica.tex && echo "ok" || exit  6
cd ..
cd ..

cd 'Esterni'
cd VER-2017-11-22
pdflatex -interaction=nonstopmode -halt-on-error VER-2017-11-22.tex && echo "ok" || exit  7
cd ..
cd ..

cd 'Esterni'
cd VER-2017-12-08
pdflatex -interaction=nonstopmode -halt-on-error VER-2017-12-08.tex && echo "ok" || exit  8
cd ..
cd ..

cd 'Esterni'
cd VER-2018-01-09
pdflatex -interaction=nonstopmode -halt-on-error VER-2018-01-09.tex && echo "ok" || exit  9
cd ..
cd ..

cd 'Esterni'
cd VER-2018-02-18
pdflatex -interaction=nonstopmode -halt-on-error VER-2018-02-18.tex && echo "ok" || exit  10
cd ..
cd ..

cd 'Esterni'
cd VER-2018-04-04
pdflatex -interaction=nonstopmode -halt-on-error VER-2018-04-04.tex && echo "ok" || exit  10
cd ..
cd ..

#cd 'Esterni'
#cd ManualeSviluppatore
#pdflatex -interaction=nonstopmode -halt-on-error -file-line-error ManualeSviluppatore.tex && echo "ok" || exit  11
#cd ..
#cd ..

#cd 'Esterni'
#cd ManualeUtente
#pdflatex -interaction=nonstopmode -halt-on-error -file-line-error ManualeUtente.tex && echo "ok" || exit  12
#cd ..
#cd ..

cd 'Interni'
cd NormeDiProgetto
pdflatex -interaction=nonstopmode -halt-on-error NormeDiProgetto.tex && echo "ok" || exit  13
cd ..
cd ..

cd 'Interni'
cd StudioDiFattibilità
pdflatex -interaction=nonstopmode -halt-on-error StudioDiFattibilità.tex && echo "ok" || exit  14
cd ..
cd ..

cd 'Interni'
cd VER-2017-11-13
pdflatex -interaction=nonstopmode -halt-on-error VER-2017-11-13.tex && echo "ok" || exit  15
cd ..
cd ..

cd 'Interni'
cd VER-2018-01-29
pdflatex -interaction=nonstopmode -halt-on-error VER-2018-01-29.tex && echo "ok" || exit  16
cd ..
cd ..

cd 'Interni'
cd VER-2018-02-05
pdflatex -interaction=nonstopmode -halt-on-error VER-2018-02-05.tex && echo "ok" || exit  17
cd ..
cd ..

cd 'Interni'
cd VER-2018-02-19
pdflatex -interaction=nonstopmode -halt-on-error VER-2018-02-19.tex && echo "ok" || exit  18
cd ..
cd ..

cd 'Interni'
cd VER-2018-03-02
pdflatex -interaction=nonstopmode -halt-on-error VER-2018-03-02.tex && echo "ok" || exit  19
cd ..
cd ..

cd 'Interni'
cd VER-2018-03-06
pdflatex -interaction=nonstopmode -halt-on-error VER-2018-03-06.tex && echo "ok" || exit  20
cd ..
cd ..

cd 'Interni'
cd VER-2018-03-26
pdflatex -interaction=nonstopmode -halt-on-error VER-2018-03-26.tex && echo "ok" || exit  21
cd ..
cd ..

cd 'Interni'
cd VER-2018-04-04
pdflatex -interaction=nonstopmode -halt-on-error VER-2018-04-04.tex && echo "ok" || exit  22
cd ..
cd ..

cd 'Interni'
cd VER-2018-04-09
pdflatex -interaction=nonstopmode -halt-on-error VER-2018-04-09.tex && echo "ok" || exit  23
cd ..
cd ..

cd LetteraDiPresentazione
cd RQ
pdflatex -interaction=nonstopmode -halt-on-error LetteraDiPresentazione.tex && echo "ok" || exit  24
cd ..
cd ..
