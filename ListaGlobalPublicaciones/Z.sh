Archivo=CronologicoBiber2

rm *.aux *.bbl *.blg *.out *.log
cat ./../Revistas.bib ./../CongresosArb.bib ./../CongresosEspanol.bib ./../RevistasNoArb.bib ./../RevistasArbitradaEspanol.bib > Todos.bib
cp Todos.bib TodosNuevo.bib

echo "%Lista Articulos" > Tabla.tex

pdflatex -interaction nonstopmode -halt-on-error -file-line-error  $Archivo.tex
biber $Archivo
pdflatex -interaction nonstopmode -halt-on-error -file-line-error $Archivo.tex
pdflatex -interaction nonstopmode -halt-on-error -file-line-error  $Archivo.tex


rm  ListadoTemporal.txt
cat $Archivo.aux | grep "\abx@aux@number" > ListadoTemporal.txt


#exit
V=`cat $Archivo.aux | grep "\abx@aux@number" | wc -l`
echo $V


# Sobreescribir el archivo anterior...
echo "%Lista Articulos" > Tabla.tex
#echo "\\begin{tabular}{cc}" >> Tabla.tex


echo "\\newcounter{conteoarticulos}">> Tabla.tex
echo "\\setcounter{conteoarticulos}{$V}">> Tabla.tex
echo "\\begin{longtable}{p{0.5cm}|p{14.0cm}|p{2cm}}">> Tabla.tex
echo "\\hline">> Tabla.tex
echo "\\textbf{\#} &">> Tabla.tex
echo "\\textbf{Ficha del Artículo} & ">> Tabla.tex
echo "\\textbf{Número de Evidencia}   \\\\ ">> Tabla.tex 
		echo "\\hline ">> Tabla.tex 
		echo "\\endfirsthead">> Tabla.tex 
		%primera parte de la tabla por pagina
		echo "\\multicolumn{3}{c}{Continuación de la tabla en la página anterior} \\\\ ">> Tabla.tex 
		echo "\\hline ">> Tabla.tex 

		echo "\\endhead">> Tabla.tex 
		echo "\\multicolumn{3}{c}{Continúa en la siguiente página} \\\\ ">> Tabla.tex 
		echo "\\endfoot ">> Tabla.tex 
		echo "\\endlastfoot ">> Tabla.tex 


while IFS= read -r line; do
    echo "Text read from file: $line"
    #echo $line | tr '{ ' '\n'
    arr=($(echo "$line" | tr '{' '\n'))
    #echo ${arr[0]}
    #echo ${arr[1]}
    r=`echo ${arr[2]} | head -c -2`
    echo "\\theconteoarticulos&\\fullcite{$r}&\\\\ \\hline " >> Tabla.tex
    echo "\\addtocounter{conteoarticulos}{-1}">> Tabla.tex
    echo $r
done < ListadoTemporal.txt

echo "\\end{longtable}" >> Tabla.tex


pdflatex -interaction nonstopmode -halt-on-error -file-line-error  $Archivo.tex
biber -interaction nonstopmode -halt-on-error -file-line-error  $Archivo
pdflatex -interaction nonstopmode -halt-on-error -file-line-error  $Archivo.tex
pdflatex -interaction nonstopmode -halt-on-error -file-line-error  $Archivo.tex
xreader $Archivo.pdf


