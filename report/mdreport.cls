\NeedsTeXFormat{LaTeX2e}%
\ProvidesPackage{mdreport}%
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

\long\def\mdreportsetup#1{%
  \setkeys{mdreport}{#1}}

\newcommand{\mdreport@def}[2][]{%
  \expandafter\def\csname mdreport@#2\endcsname{%
    <<\ifx\mdreport@empty#1\mdreport@empty#2\else#1\fi>>}}

\mdreport@def{address}%
\mdreport@def{email}%
\mdreport@def{phone}%
\mdreport@def{url}%
\mdreport@def{author}%
\mdreport@def{title}%
\mdreport@def{booktitle}%
\mdreport@def{subtitle}%

\zref@newprop*{numpage}{\the\value{page}}
\zref@addprop{main}{numpage}
\newcommand{\oneormorepages}%
  {\ifthenelse{\zref@extractdefault{LastPage}{numpage}{1}>1}%
    {\thispagestyle{fancy}}%
    {\thispagestyle{empty}}%
  }

\newcommand{\noimage}{%
  \centering\textbf{\Huge{\mdreport@author}}}

\patchcmd{\Gin@ii}%
  {\begingroup}%
  {\begingroup\renewcommand{\@latex@error}[2]{\noimage}}%
  {}%
  {}%