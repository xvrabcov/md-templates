\NeedsTeXFormat{LaTeX2e}%
\ProvidesPackage{bookfacts}%
\LoadClassWithOptions{article}%

\RequirePackage{array}%
\RequirePackage{caption}%
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
\RequirePackage[theme=xvrabcov/mdtemplate/blocks, definitionLists=true]{markdown}%
\RequirePackage{minipage-marginpar}%
\RequirePackage[all]{nowidow}
\RequirePackage{qrcode}%
\RequirePackage{tabularx}%
\RequirePackage{tikz}%
\RequirePackage{tikzpagenodes}%
\RequirePackage{wrapfig}
\RequirePackage{xcolor}%
\RequirePackage[lastpage]{zref}%

\long\def\bookfactssetup#1{%
  \setkeys{bookfacts}{#1}}

\newcommand{\bookfacts@def}[2][]{%
  \expandafter\def\csname bookfacts@#2\endcsname{%
    <<\ifx\bookfacts@empty#1\bookfacts@empty#2\else#1\fi>>}}

\bookfacts@def{address}%
\bookfacts@def{email}%
\bookfacts@def{phone}%
\bookfacts@def{url}%
\bookfacts@def{author}%
\bookfacts@def{title}%
\bookfacts@def{booktitle}%

\zref@newprop*{numpage}{\the\value{page}}
\zref@addprop{main}{numpage}
\newcommand{\oneormorepages}%
  {\ifthenelse{\zref@extractdefault{LastPage}{numpage}{1}>1}%
    {\thispagestyle{fancy}}%
    {\thispagestyle{empty}}%
  }

\newcommand{\noimage}{%
  \centering\textbf{\Huge{\bookfacts@author}}}

\patchcmd{\Gin@ii}%
  {\begingroup}%
  {\begingroup\renewcommand{\@latex@error}[2]{\noimage}}%
  {}%
  {}%
