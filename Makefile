.PHONY : all

all: 
	@echo "First compilation..."
	@pdflatex --shell-escape --synctex=1 --output-format=pdf thesis.tex > /dev/null
	@echo "Compiling bibliography"
	@bibtex thesis > /dev/null
	@echo "Second compilation..."
	@pdflatex --shell-escape --synctex=1 --output-format=pdf thesis.tex > /dev/null
	@echo "Third compilation..."
	@pdflatex --shell-escape --synctex=1 --output-format=pdf thesis.tex > /dev/null
	@echo "Done"

view:
	@open thesis.pdf
	
