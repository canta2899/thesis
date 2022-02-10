.PHONY : all 

chp := $(wildcard chapters/*.tex)

all: thesis.pdf 
	@open thesis.pdf

thesis.pdf: thesis.tex $(chp) thud.bib book.thud.tex beamer.thud.tex thud.cls
	@echo "First compilation..."
	@pdflatex --shell-escape --synctex=1 --output-format=pdf thesis.tex > /dev/null
	@echo "Compiling bibliography"
	@bibtex thesis > /dev/null
	@echo "Second compilation..."
	@pdflatex --shell-escape --synctex=1 --output-format=pdf thesis.tex > /dev/null
	@echo "Third compilation..."
	@pdflatex --shell-escape --synctex=1 --output-format=pdf thesis.tex > /dev/null
	@echo "Done"

