\NeedsTeXFormat{LaTeX2e}%
\ProvidesPackage{mdpostcard}%
\LoadClassWithOptions{article}%

\RequirePackage{array}%
\RequirePackage{eso-pic}%
\RequirePackage{etoolbox}%
\RequirePackage{fancyhdr}%
\RequirePackage{fontawesome}%
\RequirePackage{graphicx}%
\RequirePackage[paperwidth=6.25in,paperheight=4.25in, margin=0.125in]{geometry}%
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

\long\def\mdpostcardsetup#1{%
  \setkeys{mdpostcard}{#1}}

\newcommand{\mdpostcard@def}[2][]{%
  \expandafter\def\csname mdpostcard@#2\endcsname{%
    <<\ifx\mdpostcard@empty#1\mdpostcard@empty#2\else#1\fi>>}}
