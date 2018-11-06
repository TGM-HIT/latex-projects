FROM debian:unstable-slim 
MAINTAINER mmueller@tilehub.io
RUN apt update
RUN apt install -y rubber texlive-fonts-extra texlive-xetex texlive-bibtex-extra texlive-lang-german wget make xindy grip
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py
RUN pip install Pygments
RUN mkdir /data
RUN wget https://raw.githubusercontent.com/TGM-HIT/latex-protocol/master/maketex -O /usr/bin/maketex
RUN chmod +x /usr/bin/maketex
