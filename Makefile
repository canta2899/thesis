.PHONY : all 

chp := $(wildcard chapters/*.tex)

compile := pdflatex --shell-escape --synctex=1 --output-format=pdf
bib := bibtex

all: thesis.pdf 
	@open thesis.pdf

sync: thesis.pdf
	@./sync

thesis.pdf: thesis.tex thud.bib book.thud.tex beamer.thud.tex thud.cls $(chp)
	@printf "Compilation [1]"
	@$(compile) thesis.tex > /dev/null
	@printf "\rCompilation [B]"
	@$(bib) thesis > /dev/null
	@printf "\rCompilation [2]"
	@$(compile) thesis.tex > /dev/null
	@printf "\rCompilation [3]"
	@$(compile) thesis.tex > /dev/null
	@printf "\rCompilation [Done]\n"

