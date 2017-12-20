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
pdflatex -interaction=nonstopmode -halt-on-error GlossarioEST.tex && echo "ok" || exit  2
cd ..
cd ..

cd 'Esterni'
cd PianoDiProgetto
pdflatex -interaction=nonstopmode -halt-on-error PianoDiProgetto.tex && echo "ok" || exit  3
cd ..
cd ..

cd 'Interni'
cd NormeDiProgetto
pdflatex -interaction=nonstopmode -halt-on-error NormeDiProgetto.tex && echo "ok" || exit  5
cd ..
cd ..

cd 'Interni'
cd StudioDiFattibilità
pdflatex -interaction=nonstopmode -halt-on-error StudioDiFattibilità.tex && echo "ok" || exit  6
cd ..
cd ..

# 'Esterni/AnalisiDeiRequisiti.pdf'
# 'Esterni/GlossarioEST.pdf'
# 'Esterni/PianoDiProgetto.pdf'
# 'Esterni/PianoDiQualifica.pdf'
# 'Interni/NormeDiProgetto.pdf'
# 'Interni/StudioDiFattibilità.pdf'
# 'Interni/Verbale171122.pdf'
# 'LetteraDiPresentazione - ITA/LetteraDiPresentazione.pdf'
