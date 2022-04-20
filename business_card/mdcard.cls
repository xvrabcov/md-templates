\NeedsTeXFormat{LaTeX2e}%
\ProvidesPackage{mdcard}%
\LoadClassWithOptions{article}%

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{helvet}
\renewcommand{\familydefault}{\sfdefault}

\pagestyle{empty}

\RequirePackage{amssymb}%
\RequirePackage{array}%
\RequirePackage{enumitem}%
\RequirePackage{eso-pic}%
\RequirePackage{etoolbox}%
\RequirePackage{keyval}%
\RequirePackage[theme=xvrabcov/mdtemplate/blocks,tightLists=false]{markdown}%
\RequirePackage{tikz}%
\RequirePackage{xcolor}%

\long\def\mdcardsetup#1{%
  \setkeys{mdcard}{#1}}

\newcommand{\mdcard@def}[2][]{%
  \expandafter\def\csname mdcard@#2\endcsname{%
    <<\ifx\mdcard@empty#1\mdcard@empty#2\else#1\fi>>}}
