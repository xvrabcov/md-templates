\NeedsTeXFormat{LaTeX2e}%
\ProvidesPackage{mdauthorbio}%
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
\RequirePackage{ifthen}%
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

\long\def\mdauthorbiosetup#1{%
  \setkeys{mdauthorbio}{#1}}

\newcommand{\mdauthorbio@def}[2][]{%
  \expandafter\def\csname mdauthorbio@#2\endcsname{%
    <<\ifx\mdauthorbio@empty#1\mdauthorbio@empty#2\else#1\fi>>}}

\mdauthorbio@def{address}%
\mdauthorbio@def{email}%
\mdauthorbio@def{phone}%
\mdauthorbio@def{url}%
\mdauthorbio@def{author}%
\mdauthorbio@def{title}%

\zref@newprop*{numpage}{\the\value{page}}
\zref@addprop{main}{numpage}
\newcommand{\oneormorepages}%
  {\ifthenelse{\zref@extractdefault{LastPage}{numpage}{1}>1}%
    {\thispagestyle{fancy}}%
    {\thispagestyle{empty}}%
  }

\newcommand{\noimage}{%
  \centering\textbf{\Huge{\mdauthorbio@author}}}

\patchcmd{\Gin@ii}%
  {\begingroup}%
  {\begingroup\renewcommand{\@latex@error}[2]{\noimage}}%
  {}%
  {}%