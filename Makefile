.PHONY : all 

chp := $(wildcard chapters/*.tex)

all: thesis.pdf 
	@open thesis.pdf

thesis.pdf: thesis.tex thud.bib book.thud.tex beamer.thud.tex thud.cls $(chp)
	@printf "Compilation: [1]"
	@pdflatex --shell-escape --synctex=1 --output-format=pdf thesis.tex > /dev/null
	@printf "\rCompilation: [B]"
	@bibtex thesis > /dev/null
	@printf "\rCompilation: [2]"
	@pdflatex --shell-escape --synctex=1 --output-format=pdf thesis.tex > /dev/null
	@printf "\rCompilation: [3]"
	@pdflatex --shell-escape --synctex=1 --output-format=pdf thesis.tex > /dev/null
	@printf "\nDone\n"

