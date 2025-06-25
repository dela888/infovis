#!/bin/bash

# Bouw de Jupyter Book in een tijdelijke folder
jupyter-book build --builder html --path-output temp_build .

# Importeer de inhoud van temp_build direct in de root van gh-pages branch
ghp-import -n -p -f temp_build

# Optioneel: verwijder de tijdelijke folder
rm -rf temp_build