\NeedsTeXFormat{LaTeX2e}%
\ProvidesPackage{mdposter}%
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

\long\def\mdpostersetup#1{%
  \setkeys{mdposter}{#1}}

\newcommand{\mdposter@def}[2][]{%
  \expandafter\def\csname mdposter@#2\endcsname{%
    <<\ifx\mdposter@empty#1\mdposter@empty#2\else#1\fi>>}}

\mdposter@def{address}%
\mdposter@def{email}%
\mdposter@def{phone}%
\mdposter@def{url}%
\mdposter@def{author}%
\mdposter@def{title}%

\zref@newprop*{numpage}{\the\value{page}}
\zref@addprop{main}{numpage}
\newcommand{\oneormorepages}%
  {\ifthenelse{\zref@extractdefault{LastPage}{numpage}{1}>1}%
    {\thispagestyle{fancy}}%
    {\thispagestyle{empty}}%
  }

\newcommand{\noimage}{%
  \centering\textbf{\Huge{\mdposter@author}}}

\patchcmd{\Gin@ii}%
  {\begingroup}%
  {\begingroup\renewcommand{\@latex@error}[2]{\noimage}}%
  {}%
  {}%
