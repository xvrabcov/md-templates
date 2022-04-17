\NeedsTeXFormat{LaTeX2e}%
\ProvidesPackage{mdscenario}%
\LoadClassWithOptions{article}%

\RequirePackage{array}%
\RequirePackage{eso-pic}%
\RequirePackage{etoolbox}%
\RequirePackage{fancyhdr}%
\RequirePackage{fontawesome}%
\RequirePackage{graphicx}%
\RequirePackage{geometry}%
    \geometry{left=2.5cm, top=2cm, right=2.5cm, bottom=5.5cm}
\RequirePackage[hidelinks,pdfa]{hyperref}%
\RequirePackage{ifthen}
\RequirePackage{keyval}%
\RequirePackage[theme=xvrabcov/mdtemplate/blocks]{markdown}%
\RequirePackage{minipage-marginpar}%
\RequirePackage[all]{nowidow}
\RequirePackage{qrcode}%
\RequirePackage{tabularx}%
\RequirePackage{tikz}%
\RequirePackage{tikzpagenodes}%
\RequirePackage{wrapfig}
\RequirePackage{xcolor}%
\RequirePackage[lastpage]{zref}%

\long\def\mdscenariosetup#1{%
  \setkeys{mdscenario}{#1}}

\newcommand{\mdscenario@def}[2][]{%
  \expandafter\def\csname mdscenario@#2\endcsname{%
    <<\ifx\mdscenario@empty#1\mdscenario@empty#2\else#1\fi>>}}

\mdscenario@def{address}%
\mdscenario@def{email}%
\mdscenario@def{phone}%
\mdscenario@def{url}%
\mdscenario@def{author}%
\mdscenario@def{title}%
\mdscenario@def{booktitle}%
\mdscenario@def{color}%

\zref@newprop*{numpage}{\the\value{page}}
\zref@addprop{main}{numpage}
\newcommand{\oneormorepages}%
  {\ifthenelse{\zref@extractdefault{LastPage}{numpage}{1}>1}%
    {\thispagestyle{fancy}}%
    {\thispagestyle{empty}}%
  }

\newcommand{\noimage}{%
  \centering\textbf{\Huge{\mdscenario@author}}}

\patchcmd{\Gin@ii}%
  {\begingroup}%
  {\begingroup\renewcommand{\@latex@error}[2]{\noimage}}%
  {}%
  {}%