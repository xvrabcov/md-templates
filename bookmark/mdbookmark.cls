\NeedsTeXFormat{LaTeX2e}%
\ProvidesPackage{mdbookmark}%
\LoadClassWithOptions{article}%

\RequirePackage{array}%
\RequirePackage{eso-pic}%
\RequirePackage{etoolbox}%
\RequirePackage{fancyhdr}%
\RequirePackage{fontawesome}%
\RequirePackage{graphicx}%
\RequirePackage[paperwidth=2.25in,paperheight=6.25in, margin=0.125in]{geometry}%
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

\long\def\mdbookmarksetup#1{%
  \setkeys{mdbookmark}{#1}}

\newcommand{\mdbookmark@def}[2][]{%
  \expandafter\def\csname mdbookmark@#2\endcsname{%
    <<\ifx\mdbookmark@empty#1\mdbookmark@empty#2\else#1\fi>>}}
