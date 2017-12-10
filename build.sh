cd 'Esterni - ENG'
cd AnalisiDeiRequisiti
pdflatex -interaction=nonstopmode -halt-on-error AnalisiDeiRequisiti.tex && echo "ok" || exit  1
cd ..
cd ..

cd 'Esterni - ENG'
cd Glossario
pdflatex -interaction=nonstopmode -halt-on-error GlossarioEST.tex && echo "ok" || exit  2
cd ..
cd ..

cd 'Esterni - ENG'
cd PianoDiProgetto
pdflatex -interaction=nonstopmode -halt-on-error PianoDiProgetto.tex && echo "ok" || exit  3
cd ..
cd ..

cd 'Esterni - ENG'
cd PianoDiQualifica
pdflatex -interaction=nonstopmode -halt-on-error PianoDiQualifica.tex && echo "ok" || exit  4
cd ..
cd ..

cd 'Interni - ITA'
cd NormeDiProgetto
pdflatex -interaction=nonstopmode -halt-on-error NormeDiProgetto.tex && echo "ok" || exit  5
cd ..
cd ..

cd 'Interni - ITA'
cd StudioDiFattibilità
pdflatex -interaction=nonstopmode -halt-on-error StudioDiFattibilità.tex && echo "ok" || exit  6
cd ..
cd ..

cd 'Interni - ITA'
cd Verbale171122
pdflatex -interaction=nonstopmode -halt-on-error Verbale171122.tex && echo "ok" || exit  7
cd ..
cd ..

cd 'LetteraDiPresentazione - ITA'
pdflatex -interaction=nonstopmode -halt-on-error LetteraDiPresentazione.tex && echo "ok" || exit  8
cd ..


# 'Esterni - ENG/AnalisiDeiRequisiti.pdf'
# 'Esterni - ENG/GlossarioEST.pdf'
# 'Esterni - ENG/PianoDiProgetto.pdf'
# 'Esterni - ENG/PianoDiQualifica.pdf'
# 'Interni - ITA/NormeDiProgetto.pdf'
# 'Interni - ITA/StudioDiFattibilità.pdf'
# 'Interni - ITA/Verbale171122.pdf'
# 'LetteraDiPresentazione - ITA/LetteraDiPresentazione.pdf'
