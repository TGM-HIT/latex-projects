# LaTeX Projects
LaTeX templates for project documentation and scrum artifacts.

### Anwendung

Zur Anwendung sind je nach Dokument bestimmte Dateien aus dem Vorlagenverzeichnis zu kopieren.
Um die Dokumente zu kompilieren werden XeLaTex und Python 3.4 oder höher benötigt.

**Dokument**
``` sh
mkdir -p docs/test                          # Verzeichnis des neuen Dokuments
cp templates/article/*article* docs/test/.  # Kopieren der Vorlagen
```

Zusätzlich können auch Bibliographie- und Glossareinträge früherer Dokumente hinzugefügt werden.
``` sh
cp templates/article/bib.bib docs/test/. && cp templates/article/glo.tex docs/test/.
```

Kompiliert wird ein Dokument über die Anwendung `maketex`.
``` sh
cd docs/test
../../maketex -xf article
```

**Artefakt**
``` sh
mkdir -p alpha/test
cp -r templates/sprint/* alpha/test/.
cd alpha/test
../../maketex -xf abnahme dokumentation retro
```

Alternativ kann ein Docker Container mit allen Abhängigkeiten der [Dockerfile](https://github.com/TGM-HIT/latex-projects/blob/master/Dockerfile) Datei instanziert werden.
Um diesen Container zu erstellen, sollte folgendes Kommando ausgeführt werden: `docker build -t latex-tgm/projects:latest .`. Das Erstellen von Dokumenten ist dann über Docker folgendermaßen auszuführen: `docker run --rm -it --user="$(id -u):$(id -g)" -v $PWD:/data latex-tgm/projects:latest bash -c "cd data && maketex -xf article"` oder einfach mit dem bereitgestellten Shell-Script im jeweiligen Verzeichnis: `../../rundocker.sh -xf article`.

