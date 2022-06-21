\NeedsTeXFormat{LaTeX2e}%
\ProvidesPackage{mdtemp}%
\LoadClassWithOptions{article}%

\input{common_class}%
\geometry{paperwidth=9.5in,paperheight=4.125in, top=0.125in, bottom=0.25in, left=0in}

\newcommand{\noimage}{%
  \centering\textbf{\Huge{\mdtemp@author}}}

\patchcmd{\Gin@ii}%
  {\begingroup}%
  {\begingroup\renewcommand{\@latex@error}[2]{\noimage}}%
  {}%
  {}%
