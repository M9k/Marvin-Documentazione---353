<<USAGE
  FUNZIONANTE SU DISTRIBUTZIONI LINUX
  2 Modi per usarlo:
  1)/bin/bash compile.sh
  2)
    Dare permessi di esecuzione al file "chmod +x build.sh"
    ./compile.sh
USAGE
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

for D in 'Interni Esterni'
do
  cd $D
  for NM in `find * -maxdepth 0 -type d -not -name "Verbale"`
  do
    cd $NM
    echo ""
    echo -e "${BLUE}Compilando $NM.tex${NC}"
    if [ -f $NM.tex ]; then
      pdflatex -interaction=nonstopmode -halt-on-error $NM.tex && echo "ok" || exit  11
    else
      echo -e "${RED}File main mancante, controllare il contenuto della cartella${NC}"
      exit 11
    fi
    cd ..
  done
  cd ..
done
