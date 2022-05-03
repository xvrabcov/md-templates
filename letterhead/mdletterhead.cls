\NeedsTeXFormat{LaTeX2e}%
\ProvidesPackage{mdletterhead}%
\LoadClassWithOptions{letter}%

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

\long\def\mdletterheadsetup#1{%
  \setkeys{mdletterhead}{#1}}

\newcommand{\mdletterhead@def}[2][]{%
  \expandafter\def\csname mdletterhead@#2\endcsname{%
    <<\ifx\mdletterhead@empty#1\mdletterhead@empty#2\else#1\fi>>}}

\mdletterhead@def{addressFrom}%
\mdletterhead@def{addressTo}%
\mdletterhead@def{email}%
\mdletterhead@def{phone}%
\mdletterhead@def{url}%
\mdletterhead@def{author}%
\mdletterhead@def{sender}%

\zref@newprop*{numpage}{\the\value{page}}
\zref@addprop{main}{numpage}
\newcommand{\oneormorepages}%
  {\ifthenelse{\zref@extractdefault{LastPage}{numpage}{1}>1}%
    {\thispagestyle{fancy}}%
    {\thispagestyle{empty}}%
  }

\newcommand{\noimage}{%
  \centering\textbf{\Huge{\mdletterhead@author}}}

\patchcmd{\Gin@ii}%
  {\begingroup}%
  {\begingroup\renewcommand{\@latex@error}[2]{\noimage}}%
  {}%
  {}%
