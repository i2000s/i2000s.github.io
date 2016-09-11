#!/bin/bash
cd assets/files
cp ../../publications.md .
#pandoc vita.md --template cv-template.tex -f markdown-startnum -o cv.tex
pandoc publications.md --template cv-template.tex -f markdown-startnum -o cv.pdf
rm publications.md
cd
