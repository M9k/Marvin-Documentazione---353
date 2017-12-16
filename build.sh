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

# 'Esterni - ENG/AnalisiDeiRequisiti.pdf'
# 'Esterni - ENG/GlossarioEST.pdf'
# 'Esterni - ENG/PianoDiProgetto.pdf'
# 'Esterni - ENG/PianoDiQualifica.pdf'
# 'Interni - ITA/NormeDiProgetto.pdf'
# 'Interni - ITA/StudioDiFattibilità.pdf'
# 'Interni - ITA/Verbale171122.pdf'
# 'LetteraDiPresentazione - ITA/LetteraDiPresentazione.pdf'
