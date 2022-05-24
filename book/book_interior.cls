\ProvidesClass{book_interior}

\LoadClass[11pt,twoside]{memoir}

\RequirePackage[all]{nowidow}  % Automatically eliminate clubs and widows
\RequirePackage{appendix}
\RequirePackage{epigraph}
\RequirePackage[tracking=true]{microtype}     % Enable character expansion and protrusion
\RequirePackage{quoting}
\RequirePackage{xurl}          % URLs can break at any point, preventing overfull lines

% Geometry
\usepackage[
  includehead,
  paperheight=9.25in,
  paperwidth=7.5in,
  top=0.75in,
  headheight=10.26pt,
  headsep=0.625in,
  bottom=0.625in,
  left=1in,
  right=1in,
]{geometry}

% Fonts
\usepackage[T1]{fontenc}
\usepackage{fontspec}
\usepackage{ebgaramond-maths}

\usepackage{cinzel}
\long\def\textcinzel#1{{\cinzel\textls[200]{#1}}}
\let\texttrjn\textcinzel

\SetTracking{ encoding=* }{ 200 }  % Use the same tracking amount when \textls is used

\urlstyle{rm}
\linespread{1.15}
\frenchspacing % Use single-space sentence spacing

% Index
\RequirePackage{imakeidx}
\begin{filecontents}[overwrite, noheader, nosearch]{\jobname.ist}
delim_0 "\\dotfill "
\end{filecontents}
\makeindex[options= -s \jobname.ist, columns=3, columnsep=0.25in]

% Table of contents
\RequirePackage{etoolbox}
\setcounter{tocdepth}{1}
\pretocmd\appendix{% Only show appendices, not their sections, in the table of contents
  \markdownSetup{snippet=xvrabcov/memoir/beautiful/hideSectionFromToC}%
}{}{%
  \PackageError{our_book_template}{Failed to patch \appendix command}{}%
}
\setlength\cftpartnumwidth{2em}

% Bibliography
\RequirePackage[
  style = numeric,
  refsection = chapter, % resets reference counter per chap
  defernumbers = true,
]{biblatex}
\addbibresource{\jobname.bib}
\setcounter{biburllcpenalty}{7000}  % Enable line breaks after lower-case letters in URLs
\setcounter{biburlucpenalty}{8000}  % Enable line breaks after upper-case letters in URLs

% Code highlighting
\RequirePackage{minted}
\usemintedstyle{bw}

% Endnotes instead of footnotes
\RequirePackage{endnotes}
\let\footnote=\endnote
\let\oldtheendnotes=\theendnotes
\AtBeginDocument{%
  \renewcommand\theendnotes{%
    \oldtheendnotes
    \setcounter{endnote}{0}%
  }%
}

% Graphics
\usepackage{graphicx}
\graphicspath{
  {../images/}
}
\setkeys{Gin}{
  width=\linewidth,
  height=0.7\paperheight,
  keepaspectratio,
}

% Epigraphs
\let\oldafterpartskip\afterpartskip
\newcommand\partepigraph[3][60pt]{%
  \renewcommand{\afterpartskip}{%
    \vskip#1
    \epigraph{#2}{#3}
    \vfil
  }%
}
\newcommand\removeepigraph{%
  \let\afterpartskip\oldafterpartskip}

% Typeset (La)TeX logotypes automagically
\RequirePackage{hologo, luacode}
\begin{luacode*}
  function enable_pretty_tex_and_latex_logos()
    luatexbase.add_to_callback('process_input_buffer', function(buffer)
      if not enable_pretty_tex_and_latex_logos then return end
      local lpeg = require"lpeg"
      local pattern = lpeg.P"La"^-1 * lpeg.P"TeX"
      local function replacement(s) return [[\]] .. s .. "{}" end
      pattern = lpeg.Cs(([[\]] * pattern + pattern / replacement + 1)^0)
      return pattern:match(buffer)
    end, 'pretty-tex-and-latex-logos')
  end
  function disable_pretty_tex_and_latex_logos()
    luatexbase.remove_from_callback('process_input_buffer', 'pretty-tex-and-latex-logos')
  end
\end{luacode*}

% Definitions of various Unicode characters
\RequirePackage{newunicodechar}
\newunicodechar{′}{\/\ensuremath{^{\prime}}}
\newunicodechar{″}{\/\ensuremath{^{\prime\prime}}}
\newunicodechar{©}{\copyright\,}
\newunicodechar{␣}{\textvisiblespace}

% Fine-grained design of individual markdown elements
\RequirePackage[
  theme = witiko/memoir/beautiful,
  theme = witiko/dot,
  theme = xvrabcov/memoir/beautiful,
]{markdown}

% Clickable hyperlinks
\usepackage[hidelinks,pdfa]{hyperref}

% Setting short title of the book
\newcommand{\@shorttitle}{}
\newcommand\shorttitle[1]{\renewcommand\@shorttitle{#1}}
\newcommand{\theshorttitle}{\@shorttitle}