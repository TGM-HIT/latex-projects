% ================== %
% :: Tile Article :: %
% ================== %

% Base class for all TileHub articles
%
% @author   Markus Reichl <markus@re1.at> 
% @version  2018-04-18

% Extend article
\ProvidesClass{tile-article}
\LoadClass[a4paper]{article}

% -------------- %
% :: Packages :: %
% -------------- %
\RequirePackage{a4wide, geometry}
\RequirePackage[ddmmyyyy]{datetime}
\RequirePackage{hhline}
\RequirePackage{titlesec}
\RequirePackage{titling}
\RequirePackage{lscape}
\RequirePackage[ngerman]{babel}
\RequirePackage{csquotes}
\RequirePackage{fontspec}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{ccicons, csquotes, amssymb, mathtools}
\RequirePackage{fancyhdr, float, multicol, multirow, titling}
\RequirePackage[marginal, norule, perpage]{footmisc}
\RequirePackage[dvipsnames, table]{xcolor}
\RequirePackage{hyperref, url, pageslts}
\RequirePackage{outlines, enumitem}
\RequirePackage{booktabs, tabularx}
\RequirePackage{graphicx, subcaption}
\RequirePackage[font=small]{caption}
\RequirePackage[backend=bibtex]{biblatex}
\RequirePackage[acronym, xindy, toc, nohypertypes={acronym,notation}]{glossaries}
\RequirePackage[figure,table,listing]{totalcount}
\RequirePackage{parskip}
% == Lists
\RequirePackage{enumitem}
% == Tools
\RequirePackage{forloop}
% == Listings
\RequirePackage[newfloat]{minted}
% == Symbols
\RequirePackage{eurosym}
% == Image Float
\pagenumbering{arabic}                      % Required by pageslts

\definecolor{HeavyMetal}{HTML}{1c1d1c}
\definecolor{Mirage}{HTML}{1f2f3f}
\definecolor{Genoa}{HTML}{1a7461}
\definecolor{GreenHaze}{HTML}{00a169}
\definecolor{DeYork}{HTML}{88c591}
\definecolor{PictonBlue}{HTML}{5ec5ed}
\definecolor{MorningGlory}{HTML}{99d3db}
\definecolor{Salomie}{HTML}{ffde85}
\definecolor{Goldenrod}{HTML}{ffe169}
\definecolor{Rajah}{HTML}{f8ae61}
\definecolor{Cinnabar}{HTML}{ea573c}
\definecolor{Crimson}{HTML}{d6174a}
\definecolor{Tosca}{HTML}{923f3f}
\definecolor{Masala}{HTML}{4b4643}
\definecolor{Gallery}{HTML}{ededed}


% = Options
% == Colors
\definecolor{Red}{HTML}{FF0000}
\definecolor{Orange}{HTML}{FF6600}
\definecolor{Green}{HTML}{00FF00}
% Define document status color
\newcommand\statuscolor[1]{\textcolor{Red}{#1}}
% == Document release
\DeclareOption{alpha}{\renewcommand{\statuscolor}[1]{\textcolor{Red}{#1}}}
\DeclareOption{beta}{\renewcommand{\statuscolor}[1]{\textcolor{Orange}{#1}}}
\DeclareOption{release}{\renewcommand{\statuscolor}[1]{\textcolor{Green}{#1}}}
% == Fonts
\newif\iffonts\fontstrue
\DeclareOption{nofonts}{\fontsfalse}
% == Bibliography
\newif\ifnobib
\nobibfalse
\DeclareOption{nobib}{\nobibtrue}
% == Glossaries
\newif\ifnoglo
\noglofalse
\DeclareOption{noglo}{\noglotrue}
% == Titlepage
\newif\ifnotitlepage
\notitlepagefalse
\DeclareOption{notitlepage}{\notitlepagetrue}
% == Toc
\newif\ifnotoc
\notocfalse
\DeclareOption{notoc}{\notoctrue}
% == Document signation
\newif\ifsigned
\signedfalse
\DeclareOption{signed}{\signedtrue}
% == Document approval
\newif\ifapproved
\approvedfalse
\DeclareOption{approved}{\approvedtrue}
% == Pass Options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% = Setup I
\IfFileExists{glo.tex}{\ifnoglo\else\input{glo}\makeglossaries\fi}{}
\IfFileExists{bib.bib}{\ifnobib\else\addbibresource{bib.bib}\fi}{}

% = Variables
% Fix title and author
\renewcommand{\title}[1]{\gdef\@title{#1}\gdef\titlefix{#1}}
\renewcommand{\author}[1]{\gdef\@author{#1}\gdef\authorfix{#1}}
% == Version
\newcommand\@version{}
\newcommand\version[1]{\renewcommand\@version{#1}}
% == Product release
\newcommand\@release{\@empty}
\newcommand\release[1]{\renewcommand\@release{#1}}
% == Subtitle
\newcommand\@subtitle{}
\newcommand\subtitle[1]{\renewcommand\@subtitle{#1}}
% == Subsubtitle
\newcommand\@subsubtitle{}
\newcommand\subsubtitle[1]{\renewcommand\@subsubtitle{#1}}
\newif\ifsans\sansfalse                 % Sans-serif fonts

% = Settings
% == Tabularx
\newcolumntype{Y}{p{.5\textwidth}}
% == Datetime
\renewcommand{\dateseparator}{.}
% == Fancy Header
\pagestyle{fancy}
\fancyhf{}
% \fancyhead[L]{\small TileHub \ifthenelse{\equal{\@release}{\@empty}}{}{\-- \@release} \-- {\titlefix} \-- {\@subtitle}}
\fancyhead[R]{\small Version \@version \normalsize\statuscolor{$\blacktriangledown$}}
\fancyfoot[L]{\small \authorfix}
\fancyfoot[R]{\small \thepage~/~{\lastpageref*{VeryLastPage}}~{\normalsize\statuscolor{$\blacktriangle$}}}
\renewcommand{\footrulewidth}{\headrulewidth}
% == Hyperref
\hypersetup{colorlinks=true, linkcolor=MidnightBlue, urlcolor=MidnightBlue, citecolor=MidnightBlue}
% == Footnotes
\def\arraystretch{1.5}
\renewcommand{\thefootnote}{\Roman{footnote}}
% == Minted (Source: https://tex.stackexchange.com/a/254177)
\newenvironment{code}{\captionsetup{type=listing}}{}
\SetupFloatingEnvironment{listing}{name=Source Code}

% = Fonts
\iffonts        % Load correct fonts when available
    % \IfFileExists{lato.sty}{\RequirePackage{lato}}{}
    \ifsans \renewcommand*\familydefault{\sfdefault}
    \else   \IfFileExists{crimson.sty}{\RequirePackage{crimson}}{}\fi
    \IfFileExists{inconsolata.sty}{\RequirePackage{inconsolata}}{}
    \IfFileExists{raleway.sty}{\RequirePackage{raleway}}{}
\fi
% == Section fonts
% https://tex.stackexchange.com/questions/27843/level-of-boldness-changeable
\titleformat*{\section}{\fontseries{bx}\LARGE\raleway}
\titleformat*{\subsection}{\fontseries{bx}\Large\raleway}
\titleformat*{\subsubsection}{\fontseries{bx}\large\raleway}
\titleformat*{\paragraph}{\fontseries{bx}\large\raleway}
\titleformat*{\subparagraph}{\fontseries{bx}\large\raleway}

% = Makros
% == Signatures
% === Git Path                          - Optional
\newcommand\@filepath{}
\newcommand\filepath[1]{\renewcommand\@filepath{#1}}
% === Creator			                - Optional
\newcommand\@creationname{\@empty}
\newcommand\creationname[1]{\renewcommand\@creationname{#1}}
% === Date of creation	                - Optional
\newcommand\@creationdate{\@empty}
\renewcommand\creationdate[1]{\renewcommand\@creationdate{#1}}
% === validators		                - Optional
\newcommand\@validationname{\@empty}
\newcommand\validationname[1]{\renewcommand\@validationname{#1}}
% === Date of validation	            - Optional
\newcommand\@validationdate{\@empty}
\newcommand\validationdate[1]{\renewcommand\@validationdate{#1}}
% === Approver			                - Optional
\newcommand\@approvedname{\@empty}
\newcommand\approvedname[1]{\renewcommand\@approvedname{#1}}
% === Date of approval	                - Optional
\newcommand\@approveddate{\@empty}
\newcommand\approveddate[1]{\renewcommand\@approveddate{#1}}

% == Make team
% Creates a downside triangle containing the names of the team
\newcommand\maketeam{
		\begin{center}
        \small{
        \begin{tabular}{*{4}{>{\centering\arraybackslash}p{0.2 \textwidth}}}
            Maximilian Müller & Dragana Sunaric & Kevin Waldock
        \end{tabular}
        \\ \vspace{2 em}
        \begin{tabular}{*{3}{>{\centering\arraybackslash}p{0.2 \textwidth}}}
            Markus Reichl \scriptsize{\mbox{(Product Owner)}} & Michael Borko \scriptsize{\mbox{(Scrum Master)}}
        \end{tabular}
        }
    \end{center}
}

% == Make signed team
% Creates a downside triangle containing the names of the team and a thin line for their signature
\newcommand\makesignedteam{
    \begin{center}
        \small{
        \begin{tabular}{*{4}{>{\centering\arraybackslash}p{0.2 \textwidth}}}
            \hrulefill & \hrulefill & \hrulefill \\
            Maximilian Müller & Dragana Sunaric & Kevin Waldock
        \end{tabular}
        \\ \vspace{2 em}
        \begin{tabular}{*{3}{>{\centering\arraybackslash}p{0.2 \textwidth}}}
            \hrulefill & \hrulefill \\
            Markus Reichl \scriptsize{\mbox{(Product Owner)}} & Michael Borko \scriptsize{\mbox{(Scrum Master)}}
        \end{tabular}
        }
    \end{center}
}

% == Make signatures
% Creates a table reserved for the signatures of document creators, validators and approvers
\newcommand\makesignatures{
    \vspace*{\fill}
    \begin{center}
    \begin{tabularx}{\textwidth}{X X X X}
        & \textbf{Datum} & \textbf{Bearbeitet} & \textbf{Unterschrift}\\
        \textbf{Erstellt}
        	& \ifthenelse{\equal{\@creationname}{\@empty}}{\theauthor}{\@creationname}
        	& \ifthenelse{\equal{\@creationdate}{\@empty}}{\hrulefill}{\@creationdate}
        	& \hrulefill \\
        \textbf{Geprüft}
        	& \ifthenelse{\equal{\@validationname}{\@empty}}{\hrulefill}{\@validationname}
        	& \ifthenelse{\equal{\@validationdate}{\@empty}}{\hrulefill}{\@validationdate}
        	& \hrulefill \\
        \textbf{Freigegeben}
        	& \ifthenelse{\equal{\@approvedname}{\@empty}}{\hrulefill}{\@approvedname}
        	& \ifthenelse{\equal{\@approveddate}{\@empty}}{\hrulefill}{\@approveddate}
        	& \hrulefill
    \end{tabularx}
    \end{center}
    \footnotesize{~~~\textbf{Pfad:} \@filepath \hfill \textbf{Version:} \@version{~~~}} \normalsize{\statuscolor{$\blacktriangle$}}
}

% == Make path and version
\newcommand\makepathversion{
	\vspace*{\fill}
	\footnotesize{~~~\textbf{Pfad:} \@filepath \hfill \textbf{Version:} \@version{~~~}}
}

% == Create comment table
% Creates an empty table with 2 columns and a given number of rows
\newcommand\makecommenttable[1]{
	\newcounter{ct}
	\begin{center}
	\begin{tabularx}{\textwidth}{ p{1.5 em} | l}
		~ID & Kommentar \\\hline
		\forloop{ct}{1}{\value{ct} < #1}{& \\ \hline}
	\end{tabularx}
	\end{center}
}

% == Make a simple figure
\newcommand\makefig[4]{
    \begin{figure}[H]
        \centering
        \includegraphics[#2]{#1}
        \ifx\relax#3\relax
        \else\caption{#3}\fi
        \ifx\relax#4\relax
        \else\label{#4}\fi
    \end{figure}
}

% == Changelog
\newenvironment{changelog}{
	\section*{Changelog}
	\center
	\footnotesize
	\tabularx{\textwidth}{| X | X | X | Y |}
        \hline
        \textbf{Version} & \textbf{Datum} & \textbf{Autor} & \textbf{Kommentar}\\
        \hline
}{\endtabularx \normalsize \endcenter}
% Adds a version to the changelog environment.
% Usage: \addversion{version}{date}{author}{Comment}
\newcommand\addversion[4]{
    {#1} & {#2} & {#3} & {#4}\\ \hline
    % TODO: \renewcommand\@version{#1}
}

% == Maketitle
\renewcommand{\@maketitle}{
    \newpage
    \null \vspace{2 em}
    \begin{center}
        \let \footnote \thanks
        \begin{center}
            \fontseries{bx}\raleway
            \LARGE TileHub\\\vspace{0.5 em}
            \ifthenelse{\equal{\@release}{\@empty}}{}{\Large{\@release}\vspace{1 em}~\\}
            \Huge
            \statuscolor{$\blacktriangledown$}\\\vspace{1 em}
            \titlefix ~\\\vspace{0.5 em}
            \huge
            \@subtitle ~\\\vspace{1 em}
            \normalsize
            \@subsubtitle ~\\\vspace{1.5 em}
        \end{center}
        \vspace{1.5em}
        \ifsigned\makesignedteam\else\maketeam\fi
    \end{center}
    \ifapproved\makesignatures\else\makepathversion\fi
}

% == Begin document
\AtBeginDocument{
    % Add titlepage
    \ifnotitlepage\else
        \maketitle
        \thispagestyle{empty}
    \fi
    % Add toc
    \ifnotoc\else
        \newpage
        { % Black toc
          \hypersetup{linkcolor=black}
          \tableofcontents
          \ifnoglo\else\glsresetall\fi
        }
        \vfill
    \fi
}

% == End document
\AtEndDocument{
    % Newpage on glo or bib
    \ifnoglo\ifnobib\else\newpage\fi\else\newpage\fi
    % Print glossaries
    \ifnoglo\else
        % \glsaddall
        \printglossaries\fi
    % Print bibliography
    \ifnobib\else\printbibliography[heading=bibintoc, title={Ressourcen}]\fi
    % List lists if not empty
    \iftotalfigures\listoffigures\fi
    \iftotaltables\listoftables\fi
    \iftotallistings\listoflistings\fi
}

% another layer of sectioning (using Paragraphs)
% \setcounter{secnumdepth}{4}
\titleformat{\paragraph}{\large\raleway}{\theparagraph}{1em}{}
\titlespacing*{\paragraph}{0em}{1em}{0.5em}
