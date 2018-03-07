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
pdflatex -interaction=nonstopmode -halt-on-error GlossarioEST.tex && echo "ok" || exit  10001
pdflatex -interaction=nonstopmode -halt-on-error GlossarioEST.tex && echo "ok" || exit  10002
pdflatex -interaction=nonstopmode -halt-on-error GlossarioEST.tex && echo "ok" || exit  10003
cd ..
cd ..

cd 'Esterni'
cd AnalisiDeiRequisiti
pdflatex -interaction=nonstopmode -halt-on-error AnalisiDeiRequisiti.tex && echo "ok" || exit  3
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
pdflatex -interaction=nonstopmode -halt-on-error VER-2018-01-09.tex && echo "ok" || exit  8
cd ..
cd ..

cd 'Esterni'
cd VER-2018-02-18
pdflatex -interaction=nonstopmode -halt-on-error VER-2018-02-18.tex && echo "ok" || exit  8
cd ..
cd ..

cd 'Interni'
cd NormeDiProgetto
pdflatex -interaction=nonstopmode -halt-on-error NormeDiProgetto.tex && echo "ok" || exit  9
cd ..
cd ..

cd 'Interni'
cd StudioDiFattibilità
pdflatex -interaction=nonstopmode -halt-on-error StudioDiFattibilità.tex && echo "ok" || exit  10
cd ..
cd ..

cd 'Interni'
cd VER-2017-11-13
pdflatex -interaction=nonstopmode -halt-on-error VER-2017-11-13.tex && echo "ok" || exit  11
cd ..
cd ..

cd 'Interni'
cd VER-2018-01-29
pdflatex -interaction=nonstopmode -halt-on-error VER-2018-01-29.tex && echo "ok" || exit  11
cd ..
cd ..

cd 'Interni'
cd VER-2018-02-05
pdflatex -interaction=nonstopmode -halt-on-error VER-2018-02-05.tex && echo "ok" || exit  11
cd ..
cd ..

cd 'Interni'
cd VER-2018-02-19
pdflatex -interaction=nonstopmode -halt-on-error VER-2018-02-19.tex && echo "ok" || exit  11
cd ..
cd ..

cd 'Interni'
cd VER-2018-03-02
pdflatex -interaction=nonstopmode -halt-on-error VER-2018-03-02.tex && echo "ok" || exit  11
cd ..
cd ..

cd 'Interni'
cd VER-2018-03-06
pdflatex -interaction=nonstopmode -halt-on-error VER-2018-03-06.tex && echo "ok" || exit  11
cd ..
cd ..

cd LetteraDiPresentazione
pdflatex -interaction=nonstopmode -halt-on-error LetteraDiPresentazione.tex && echo "ok" || exit  11
cd ..