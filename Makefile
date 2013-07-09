LATEXPROGRAM=lualatex
INDEXPROGRAM=makeindex
RM=/bin/rm -f

SRC=phylogenetictree
AUXFILES=*.log *.aux *.toc *.idx *.hd *.glo *.out *.txt *.ilg *.ind *.synctex.gz *.gls *.bbl *.blg *.cfg *.tree
PACKAGEFILES=*.sty *.lua *.ins *.pdf README

all: phylogenetictree

phylogenetictree: $(SRC).dtx
	$(LATEXPROGRAM) $(SRC).dtx
	$(INDEXPROGRAM) -s gind.ist $(SRC).idx
	$(INDEXPROGRAM) -s gglo.ist -o $(SRC).gls $(SRC).glo
	$(LATEXPROGRAM) $(SRC).dtx
	$(LATEXPROGRAM) $(SRC).dtx
	@mv README.txt README

clean:
	@$(RM) $(AUXFILES)

mrproper:
	@$(RM) $(AUXFILES)	
	@$(RM) $(PACKAGEFILES)

