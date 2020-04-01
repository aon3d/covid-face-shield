DATE:=$(shell date +%Y-%m-%d)

.PHONY: pdf
pdf: pdf-msds pdf-assembly

.PHONY: pdf-assembly
pdf-assembly:
	pandoc --template=pandoc-latex-template/eisvogel.tex --number-sections --resource-path=docs -V date=$(DATE) -o out/assembly.pdf docs/assembly.md

.PHONY: pdf-msds
pdf-msds:
	pandoc --template=pandoc-latex-template/eisvogel.tex --number-sections --resource-path=docs -V date=$(DATE) -o out/msds-en.pdf docs/msds-en.md
	pandoc --template=pandoc-latex-template/eisvogel.tex --number-sections --resource-path=docs -V date=$(DATE) -o out/msds-fr.pdf docs/msds-fr.md
