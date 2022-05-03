\NeedsTeXFormat{LaTeX2e}%
\ProvidesPackage{mdenvelope}%
\LoadClassWithOptions{article}%

\RequirePackage{array}%
\RequirePackage{eso-pic}%
\RequirePackage{etoolbox}%
\RequirePackage{fancyhdr}%
\RequirePackage{fontawesome}%
\RequirePackage{graphicx}%
\RequirePackage[paperwidth=9.5in,paperheight=4.125in, top=0.125in, bottom=0.25in, left=0in]{geometry}%
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

\long\def\mdenvelopesetup#1{%
  \setkeys{mdenvelope}{#1}}

\newcommand{\mdenvelope@def}[2][]{%
  \expandafter\def\csname mdenvelope@#2\endcsname{%
    <<\ifx\mdenvelope@empty#1\mdenvelope@empty#2\else#1\fi>>}}

\mdenvelope@def{address}%
\mdenvelope@def{author}%

\newcommand{\noimage}{%
  \centering\textbf{\Huge{\mdenvelope@author}}}

\patchcmd{\Gin@ii}%
  {\begingroup}%
  {\begingroup\renewcommand{\@latex@error}[2]{\noimage}}%
  {}%
  {}%
