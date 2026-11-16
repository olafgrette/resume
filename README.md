# resume

Run commands from the repository root. Use this workflow for manual and agent
changes:

1. Edit the LaTeX, scripts, or other source files.
2. Run `./test_generate.sh` to build and open a preview in `/tmp/resume_test/`.
3. Examine the rendered PDF. Repeat edits and previews until it is ready.
4. Commit the LaTeX, script, and other source changes.
5. Push the source commit.
6. Run `./generate_pdf.sh` for final publication. It updates the PDF in `docs/`,
   saves a dated copy in `historical_pdfs/`, and commits the PDFs.
7. Push the generated PDF commit to publish the update.

Both scripts require `pdflatex`, the `fontawesome6` LaTeX package, and librsvg's
`rsvg-convert` command.

The Omron logo in `assets/logos/omron.svg` comes from
[Omron-europe on Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Omron-logo_blue.svg),
under [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/).
Its paths are unchanged; the fill is black and unused SVG structure is removed.
The modified SVG and its PDF conversion retain that license.
The logo identifies the employer and does not imply endorsement.
