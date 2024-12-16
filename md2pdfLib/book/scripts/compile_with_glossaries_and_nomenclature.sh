#!/bin/bash

# Define the output name variable
OUTPUT_NAME="book_output"

# Run the script to export a .tex file
python3 md2pdfLib/book/scripts/md2pdf.py ${OUTPUT_NAME}.tex 2>&1 | tee data/out/book.log

# Assuming the output is named $OUTPUT_NAME.tex
lualatex data/out/${OUTPUT_NAME}.tex
makeglossaries ${OUTPUT_NAME}
makeindex ${OUTPUT_NAME}.nlo -s nomencl.ist -o ${OUTPUT_NAME}.nls
lualatex data/out/${OUTPUT_NAME}.tex
lualatex data/out/${OUTPUT_NAME}.tex
# copy all relevant .tex related files to shared data dir
cp -r ${OUTPUT_NAME}.* data/out
