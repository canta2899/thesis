.PHONY : all

all: 
	@pdflatex --shell-escape --synctex=1 --output-format=pdf thesis.tex
	@bibtex thesis
	@pdflatex --shell-escape --synctex=1 --output-format=pdf thesis.tex
	@pdflatex --shell-escape --synctex=1 --output-format=pdf thesis.tex
	
