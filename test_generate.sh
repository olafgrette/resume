#!/bin/bash

set -e

TEX_FILE="olaf_grette_resume.tex"
PDF_NAME="olaf_grette_resume.pdf"
TMP_DIR="/tmp/resume_test"
EPOCH=$(date +%s)
TEST_PDF_NAME="olaf_grette_resume_${EPOCH}.pdf"

mkdir -p "$TMP_DIR"

pdflatex -output-directory="$TMP_DIR" "$TEX_FILE"

if [ ! -f "$TMP_DIR/$PDF_NAME" ]; then
    echo "Error: PDF was not generated successfully"
    exit 1
fi

mv "$TMP_DIR/$PDF_NAME" "$TMP_DIR/$TEST_PDF_NAME"

xdg-open "$TMP_DIR/$TEST_PDF_NAME"

echo "Test PDF generated at: $TMP_DIR/$TEST_PDF_NAME"
