#!/bin/bash

set -e

TEX_FILE="olaf_grette_resume.tex"
PDF_NAME="olaf_grette_resume.pdf"
DOCS_DIR="docs"
HISTORICAL_DIR="historical_pdfs"

echo "Running pdflatex on $TEX_FILE..."
pdflatex -output-directory="$DOCS_DIR" "$TEX_FILE"

if [ ! -f "$DOCS_DIR/$PDF_NAME" ]; then
    echo "Error: PDF was not generated successfully"
    exit 1
fi

TIMESTAMP=$(date +"%Y-%m-%d")
HISTORICAL_PDF="$HISTORICAL_DIR/${TIMESTAMP}_${PDF_NAME}"

echo "Copying PDF to historical directory as $HISTORICAL_PDF..."
cp "$DOCS_DIR/$PDF_NAME" "$HISTORICAL_PDF"

echo "Committing changes..."
git add "$DOCS_DIR/$PDF_NAME" "$HISTORICAL_PDF"
git commit -m "generate($TIMESTAMP): generate latest pdf"

echo "PDF generation complete!"
