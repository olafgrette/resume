#!/bin/bash

set -e

TEX_FILE="olaf_grette_resume.tex"
PDF_NAME="olaf_grette_resume.pdf"
TMP_DIR="/tmp/resume_test"
EPOCH=$(date +%s)
TEST_PDF_NAME="olaf_grette_resume_${EPOCH}.pdf"

mkdir -p "$TMP_DIR"

echo "Converting Omron SVG to PDF..."
rsvg-convert --format pdf --output assets/logos/omron.pdf assets/logos/omron.svg

pdflatex -output-directory="$TMP_DIR" "$TEX_FILE"

if [ ! -f "$TMP_DIR/$PDF_NAME" ]; then
    echo "Error: PDF was not generated successfully"
    exit 1
fi

mv "$TMP_DIR/$PDF_NAME" "$TMP_DIR/$TEST_PDF_NAME"

OPEN_LOG="$TMP_DIR/${TEST_PDF_NAME%.pdf}.open.log"
# Detach the viewer's input and output so it cannot hold the build terminal open.
(
    if ! xdg-open "$TMP_DIR/$TEST_PDF_NAME"; then
        if ! open "$TMP_DIR/$TEST_PDF_NAME"; then
            echo "Warning: couldn't automatically open the file: file://$TMP_DIR/$TEST_PDF_NAME"
        fi
    fi
) </dev/null >"$OPEN_LOG" 2>&1 &

echo "Test PDF generated at: $TMP_DIR/$TEST_PDF_NAME"
echo "Preview launcher log: $OPEN_LOG"
