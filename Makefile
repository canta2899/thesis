.PHONY : all print restorethud
.DEFAULT_GOAL : all

chp := $(wildcard chapters/*.tex)

compile := pdflatex --shell-escape --synctex=1 --output-format=pdf thesis.tex > /dev/null
bib := bibtex thesis > /dev/null

all: thesis.pdf 
	@open thesis.pdf

thesis.pdf: thesis.tex thud.bib book.thud.tex beamer.thud.tex thud.cls $(chp)
	@printf "Compilation [1]"
	@$(compile)
	@printf "\rCompilation [B]"
	@$(bib)
	@printf "\rCompilation [2]"
	@$(compile)
	@printf "\rCompilation [3]"
	@$(compile)
	@printf "\rCompilation [Done]\n"

