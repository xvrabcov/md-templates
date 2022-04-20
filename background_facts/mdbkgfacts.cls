\NeedsTeXFormat{LaTeX2e}%
\ProvidesPackage{mdbkgfacts}%
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

\long\def\mdbkgfactssetup#1{%
  \setkeys{mdbkgfacts}{#1}}

\newcommand{\mdbkgfacts@def}[2][]{%
  \expandafter\def\csname mdbkgfacts@#2\endcsname{%
    <<\ifx\mdbkgfacts@empty#1\mdbkgfacts@empty#2\else#1\fi>>}}

\mdbkgfacts@def{address}%
\mdbkgfacts@def{email}%
\mdbkgfacts@def{phone}%
\mdbkgfacts@def{url}%
\mdbkgfacts@def{author}%
\mdbkgfacts@def{title}%
\mdbkgfacts@def{booktitle}%

\zref@newprop*{numpage}{\the\value{page}}
\zref@addprop{main}{numpage}
\newcommand{\oneormorepages}%
  {\ifthenelse{\zref@extractdefault{LastPage}{numpage}{1}>1}%
    {\thispagestyle{fancy}}%
    {\thispagestyle{empty}}%
  }

\newcommand{\noimage}{%
  \centering\textbf{\Huge{\mdbkgfacts@author}}}

\patchcmd{\Gin@ii}%
  {\begingroup}%
  {\begingroup\renewcommand{\@latex@error}[2]{\noimage}}%
  {}%
  {}%