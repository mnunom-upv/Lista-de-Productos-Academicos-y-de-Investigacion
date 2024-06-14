# Pasos Previos
#git init
#git add .
#git commit -m "Initial Commit"
#git config --global credential.helper store
#git branch -M main
#git remote add origin https://github.com/mnunom-upv/Lista-de-Productos-Academicos-y-de-Investigacion.git

# Clonar repositiro remoto a local
#gh repo clone mnunom-upv/Lista-de-Productos-Academicos-y-de-Investigacion

current=$(date '+%s')
#echo $current

#exit()

pdflatex Publications.tex
biber Publications
pdflatex Publications.tex
pdflatex Publications.tex

# Agrega un archivo
git add Publications.tex
git add Z.sh
git add Publications.bib
git add Publications.pdf

# Establece una version
git commit -m "Version${current}"
# Hace el Push
git push -u origin main

atril Publications.pdf
