# Pasos Previos
#git init
#git add .
#git commit -m "Initial Commit"
#git config --global credential.helper store
#git config --global user.email "mnunom@upv.edu.mx" 
#git branch -M main
#git remote add origin https://github.com/mnunom-upv/Lista-de-Productos-Academicos-y-de-Investigacion.git

# Clonar repositiro remoto a local
#gh repo clone mnunom-upv/Lista-de-Productos-Academicos-y-de-Investigacion
#git clone https://github.com/mnunom-upv/Lista-de-Productos-Academicos-y-de-Investigacion

current=$(date '+%s')
#echo $current

#exit()


rm *.aux *.bbl *.blg *.out *.bcf *.xml *.log
pdflatex Publications.tex
biber Publications
pdflatex Publications.tex
pdflatex Publications.tex
rm *.aux *.bbl *.blg *.out *.bcf *.xml *.log
open Publications.pdf
#exit

# Agrega un archivo
git add Publications.tex
git add *.sh
git add *.bib
git add *.sty
git add Publications.pdf

# Establece una version
git commit -m "Version${current}"
# Hace el Push
git push -u origin main

open Publications.pdf
