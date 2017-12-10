cd 'Esterni - ENG'
cd AnalisiDeiRequisiti
pdflatex -interaction=nonstopmode -halt-on-error AnalisiDeiRequisiti.tex
cd ..
cd ..

cd 'Esterni - ENG'
cd Glossario
pdflatex -interaction=nonstopmode -halt-on-error GlossarioEST.tex
cd ..
cd ..

cd 'Esterni - ENG'
cd PianoDiProgetto
pdflatex -interaction=nonstopmode -halt-on-error PianoDiProgetto.tex
cd ..
cd ..

cd 'Esterni - ENG'
cd PianoDiQualifica
pdflatex -interaction=nonstopmode -halt-on-error PianoDiQualifica.tex
cd ..
cd ..

cd 'Interni - ITA'
cd NormeDiProgetto
pdflatex -interaction=nonstopmode -halt-on-error NormeDiProgetto.tex
cd ..
cd ..

cd 'Interni - ITA'
cd StudioDiFattibilità
pdflatex -interaction=nonstopmode -halt-on-error StudioDiFattibilità.tex
cd ..
cd ..

cd 'Interni - ITA'
cd Verbale171122
pdflatex -interaction=nonstopmode -halt-on-error Verbale171122.tex
cd ..
cd ..

cd 'LetteraDiPresentazione - ITA'
pdflatex -interaction=nonstopmode -halt-on-error LetteraDiPresentazione.tex
cd ..


# 'Esterni - ENG/AnalisiDeiRequisiti.pdf'
# 'Esterni - ENG/GlossarioEST.pdf'
# 'Esterni - ENG/PianoDiProgetto.pdf'
# 'Esterni - ENG/PianoDiQualifica.pdf'
# 'Interni - ITA/NormeDiProgetto.pdf'
# 'Interni - ITA/StudioDiFattibilità.pdf'
# 'Interni - ITA/Verbale171122.pdf'
# 'LetteraDiPresentazione - ITA/LetteraDiPresentazione.pdf'
