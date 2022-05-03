\NeedsTeXFormat{LaTeX2e}%
\ProvidesPackage{mdlabel}%
\LoadClassWithOptions{article}%

\RequirePackage{array}%
\RequirePackage{eso-pic}%
\RequirePackage{etoolbox}%
\RequirePackage{fancyhdr}%
\RequirePackage{fontawesome}%
\RequirePackage{graphicx}%
\RequirePackage{geometry}%
    \geometry{%
      paperheight=4.25in, 
      paperwidth=3.583in,
      left=0.25in,
      right=0.25in,
      top=0.25in,
      bottom=0.25in
    }%
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

\long\def\mdlabelsetup#1{%
  \setkeys{mdlabel}{#1}}

\newcommand{\mdlabel@def}[2][]{%
  \expandafter\def\csname mdlabel@#2\endcsname{%
    <<\ifx\mdlabel@empty#1\mdlabel@empty#2\else#1\fi>>}}
