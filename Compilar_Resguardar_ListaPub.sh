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

# Compilar Localmente
cd ListaGlobalPublicaciones
bash Z.sh
cd ..

# Agrega un archivo
git add ListaGlobalPublicaciones/*.tex
git add ListaGlobalPublicaciones/Z.sh
git add ListaGlobalPublicaciones/*.pdf

# Establece una version
git commit -m "Version${current}"
# Hace el Push
git push -u origin main

# Desplegar Resultado
open ListaGlobalPublicaciones/*.pdf
