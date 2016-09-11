#!/bin/bash
cd assets/files
cp ../../publications.md .
#pandoc vita.md --template cv-template.tex -f markdown-startnum -o cv.tex
pandoc publications.md --template cv-template.tex -f markdown-startnum -o cv.pdf
# Haven't figured out how to convert the md file with jekyll-scholar syntex to pdf.
# But it is possible to convert the _site/pubs/index.html to pdf by
#pandoc --smart index.html --template ../../assets/files/cv-template.tex -o cv.pdf
# The index.html file need to be trimmed out with the following changes: 1. remove <div id="***-materials">..</div> parts on references.
# 2. all relative url should be replaced with absolute urls.
# 3. remove some header (<nav>) and footer elements.
# 4. optionally remove the "and" in Chinese references' author lists.
rm publications.md
cd
