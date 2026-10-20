#!/bin/bash

NOME_PROGETTO="tesi-macchina-enigma"

# Elimino i possibili file vecchi per evitare
# incoerenze con vecchi file

rm $NOME_PROGETTO.aux
rm $NOME_PROGETTO.log
rm $NOME_PROGETTO.pdf

# Comando per compilare il progetto
pdflatex $NOME_PROGETTO.tex
