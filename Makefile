DATE:=$(shell date +%Y-%m-%d)

.PHONY: pdf
pdf: pdf-msds pdf-assembly

.PHONY: pdf-assembly
pdf-assembly:
	pandoc --template=pandoc-latex-template/eisvogel.tex --number-sections --resource-path=docs -V date=$(DATE) -o out/temp.pdf docs/assembly.md
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dBATCH -dPDFSETTINGS=/printer -sOutputFile=out/assembly.pdf out/temp.pdf

.PHONY: pdf-msds
pdf-msds:
	pandoc --template=pandoc-latex-template/eisvogel.tex --number-sections --resource-path=docs -V date=$(DATE) -o out/msds-en.pdf docs/msds-en.md
	pandoc --template=pandoc-latex-template/eisvogel.tex --number-sections --resource-path=docs -V date=$(DATE) -o out/msds-fr.pdf docs/msds-fr.md
	pandoc --template=pandoc-latex-template/eisvogel.tex --number-sections --resource-path=docs -V date=$(DATE) -o out/msds-es.pdf docs/msds-es.md
