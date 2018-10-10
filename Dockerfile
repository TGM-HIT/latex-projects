FROM debian:unstable-slim 
MAINTAINER mmueller@tilehub.io
RUN apt-get update
RUN apt-get install -y rubber texlive-fonts-extra texlive-xetex texlive-bibtex-extra texlive-lang-german wget make xindy grip
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py
RUN pip install Pygments
