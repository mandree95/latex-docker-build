#!/bin/bash

CLEAN_FILES=0

while getopts 'l:c' OPTION; do
  case "$OPTION" in
  l)
    LATEX_FILE="$OPTARG"
    ;;
  c)
    CLEAN_FILES=1
    ;;
  ?)
    echo "Script usage: $(basename $0) [-l mytexfile] [-c]" >&2
    exit 1
    ;;
  esac
done

if [ -z ${LATEX_FILE+x} ]; then
  echo "Script usage: $(basename $0) [-l mytexfile] [-c]" >&2
  exit 1
fi

rm -f ${LATEX_FILE}.pdf
pdflatex -halt-on-error -interaction=nonstopmode ${LATEX_FILE} | grep '^!.*' -A200 --color=always || true
bibtex ${LATEX_FILE}
pdflatex -halt-on-error -interaction=nonstopmode ${LATEX_FILE} | grep '^!.*' -A200 --color=always || true
pdflatex -halt-on-error -interaction=nonstopmode ${LATEX_FILE} | grep '^!.*' -A200 --color=always || true

if [ $CLEAN_FILES -gt 0 ]; then
  rm -f *.aux *.bbl *.blg *.idx *.ilg *.ind *.lof *.log *.lot *.out *.out.ps *.toc
fi