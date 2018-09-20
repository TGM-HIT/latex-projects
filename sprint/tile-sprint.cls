% Used for sprint related documents

% Provide class
\ProvidesClass{tile-sprint}

% = Options
% Path from the file to the src directory (required if not in the same directory)
\def\pathtosrc{}
\DeclareOption{../}{\renewcommand\pathtosrc{../}}
\DeclareOption{../../}{\renewcommand\pathtosrc{../../}}
\DeclareOption{../../../}{\renewcommand\pathtosrc{../../../}}
\DeclareOption{../../../../}{\renewcommand\pathtosrc{../../../../}}
\DeclareOption{../../../../../}{\renewcommand\pathtosrc{../../../../../}}

% == Pass Options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\pathtosrc tile-article}}
\ProcessOptions \relax

% == Extend tilehub-article
\LoadClass{\pathtosrc tile-article}

% = Variables
% == Sprint name
\newcommand\@sprint{} % {Sprint x}
\newcommand\sprint[1]{\renewcommand\@sprint{#1}}
% == Date the sprint started
\newcommand\@sprintstart{}  % Format: {dd. Month yyyy}
\newcommand\sprintstart[1]{\renewcommand\@sprintstart{#1}}
% == Date the sprint ends
\newcommand\@sprintend{}    % Format: {dd. Month yyyy}
\newcommand\sprintend[1]{\renewcommand\@sprintend{#1}}
% == Set the subtitle to the sprint duration
\subsubtitle{{\@sprintstart}~$\to$~{\@sprintend}}

% = Makros
% == Backlog
\newenvironment{backlog}{
	\table[!h]
    \center
    \tabularx{\textwidth}{l | X | l | l | r | r | l | l | l}
    ID & Name & Typ & P & R & V & Bearbeitet & Status & OK\\
    \hline \hline
}{
	\endtabularx
    \caption*{\small P ... Story Points\quad R ... Reale Zeit\quad V ... Verbleibende Zeit}
    \endcenter
    \endtable
}
% == Backlog item
% Add item to the backlog environment
% Usage: \addbacklogitem{id}{name}{type}{estimate}{actual time spent}{remaining}{editor}{status}
\newcommand\addbacklogitem[8]{
	\hline
    {#1} & {#2} & {#3} & {#4} & {#5} & {#6} & {#7} & {#8}\\
}
% == Backlog sum line
% Add a line to the backlog environment to summarize time for tasks
% Usage: \addbacklogsum{estimate}{actual time spent}{remaining}
\newcommand\addbacklogsum[3]{
	\hline \hline
    \multicolumn{3}{l |}{} & {#1} & {#2} & {#3} & \multicolumn{3}{l}{Punkte / Stunden}
}

% == Acceptance Line
\newcommand\makeacceptance{
    \newpage
    \section{Kommentare}
    \makecommenttable{20}
    \section{Abnahme}
    Der oben referenzierte Sprint, {\makeatletter\@sprint\makeatother}, gilt mit dem {\makeatletter\@sprintend\makeatother} als beendet und wird hiermit durch den Product Owner und Stakeholder abgenommen. \vspace{0.5em} \\
    Offene Elemente des Sprint Backlogs werden damit in den Product Backlog verschoben.
    \\ \vspace{0.5em}
    \begin{center}
    \begin{tabularx}{0.5\textwidth}{c c}
        \rule{0.25 \textwidth}{\headrulewidth} & \rule{0.25 \textwidth}{\headrulewidth}\\
        Markus Reichl & Mike B. \\
        \footnotesize{(Product Owner)} & \footnotesize{(Stakeholder)}
    \end{tabularx}
    \end{center}
}

% = Setup
% Load configuration
% TODO: Copy to tile-article and pass execution
\IfFileExists{conf.tex}{\input{conf.tex}}{}
