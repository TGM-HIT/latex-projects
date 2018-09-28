# LaTeX Projects
LaTeX templates for project documentation and scrum artifacts.

### Anwendung

Zur Anwendung sind je nach Dokument bestimmte Dateien aus dem Vorlagenverzeichnis zu kopieren.
Um die Dokumente zu kompilieren werden XeLaTex und Python 3.4 oder höher benötigt.

Alternativ kann ein Docker Container mit allen Abhängigkeiten der [Dockerfile](https://github.com/TGM-HIT/latex-projects/blob/master/Dockerfile) Datei instanziert werden.

**Dokument**
``` sh
mkdir -p docs/test && cd docs/test  # Verzeichnis des neuen Dokuments
cp ../../templates/*article* .      # Kopieren der Vorlagen
cp ../../templates/make .           # Kopieren der Anwendung zur Kompilierung
```

Zusätzlich können auch Bibliographie- und Glossareinträge früherer Dokumente hinzugefügt werden.
``` sh
cp ../../templates/bib.bib . && cp ../../templates/glo.tex .
```

Kompiliert wird ein Dokument über die Anwendung `make`.
``` sh
./make -xf article.tex
```

**Artefakt**
``` sh
mkdir -p alpha/test && cd alpha/test
cp ../../templates/tile-article.cls .
cp ../../templates/make .
cp ../../templates/sprint/* .

./make -xf abnahme dokumentation retro
```
