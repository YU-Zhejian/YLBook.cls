%% Copyright (C) 2020 YU Zhejian <Zhejian.19@intl.zju.edu.cn>
%% 
%% This file may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, either version 1.2 of this license
%% or (at your option) any later version.  The latest version of this
%% license is in:
%% 
%%    http://www.latex-project.org/lppl.txt
%% 
%% and version 1.2 or later is part of all distributions of LaTeX version
%% 1999/12/01 or later.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PREPARATION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1999/12/01]\ProvidesClass{ylcollection}[2020-08-04 v1 YLCollection]

\RequirePackage{times}
\RequirePackage{url}
\RequirePackage{iftex}

\newif\if@web \@webfalse
\DeclareOption{web}{\@webtrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass{book}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% MARGINS	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setlength\parindent{2em}
\RequirePackage{indentfirst}
\if@web
\RequirePackage[inner=1in,outer=1in]{geometry}
\else
\RequirePackage[inner=1.5in,outer=0.5in]{geometry}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% WEB
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\@mainmattertrue
\if@web
\renewcommand\familydefault{\sfdefault}
\pagenumbering{arabic}
\renewcommand{\cleardoublepage}{\relax}
\renewcommand\frontmatter{\relax}
\renewcommand\mainmatter{\relax}
\renewcommand\backmatter{\relax}
\fi

\newcommand{\keywordname}{Keyword}
\newcommand{\abstractname}{Abstract}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CHAPTER
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{xcolor}
\setlength{\fboxrule}{0.75pt}

\newcommand{\complexchapter}[5][]{ % Title, Author, Abstract, Keyword, Affiliation
\if@web\clearpage\else\cleardoublepage\fi
\refstepcounter{chapter}%
\addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}#1}\chaptermark{#1}%
\if@web
\definecolor{color1}{RGB}{0,0,90} % Color of the article title and sections
\definecolor{color2}{RGB}{0,20,20} % Color of the boxes behind the abstract and headings
\thispagestyle{empty}\vskip-36pt%
{\raggedleft\small\bfseries#1\\Copyright \copyright 2019-2020 Authors\par}%
{\raggedright\color{color1}\bfseries\fontsize{20}{25}\selectfont #1\par}%
{\raggedright\color{color1}\fontsize{12}{16}\selectfont #2\par}%
\fcolorbox{color1}{white}{%
\parbox{\textwidth-2\fboxsep-2\fboxrule}{
\centering%
\ifx#3\@empty\else
\colorbox{color2!10}{
\parbox{\textwidth-6\fboxsep-2\fboxrule}{
\textbf{\abstractname:} #3\vskip4pt%
\ifx#4\@empty\else\textbf{\keywordname:} #4\fi%
}
}
\fi
}
}\\{\footnotesize #5}\par%
\else
{\raggedleft\small\bfseries#1\\Copyright \copyright 2019-2020 Authors\\}%
{\raggedright\itshape\fontsize{20}{30}\selectfont #1\par}%
{\raggedright\fontsize{12}{16}\selectfont\textsc{#2}\par\small#5\par}%
\ifx#3\@empty\else
\fbox{\parbox{\textwidth}{{\noindent\bfseries\abstractname: \itshape\space#3\par}
\ifx#4\@empty\else{\noindent\textbf{\keywordname: }#4\par}\fi}}
\fi
\fi
}

\if@web
\renewcommand\chapter{\clearpage
\global\@topnum\z@
\@afterindentfalse
\secdef\@chapter\@schapter}
\fi
\RequirePackage{enumitem}
\renewenvironment{thebibliography}[1]
{\chapter{\bibname}\fontsize{6}{8}\selectfont%
\list{\@biblabel{\@arabic\c@enumiv}}%
{\settowidth\labelwidth{\@biblabel{#1}}%
\leftmargin\labelwidth
\advance\leftmargin\labelsep
\@openbib@code
\usecounter{enumiv}%
\let\p@enumiv\@empty
\renewcommand\theenumiv{\@arabic\c@enumiv}}%
\sloppy
\clubpenalty4000
\@clubpenalty \clubpenalty
\widowpenalty4000%
\sfcode`\.\@m}
{\def\@noitemerr
{\@latex@warning{Empty `thebibliography' environment}}%
\endlist}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PART
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\if@web
\renewcommand\part{%
\clearpage
\if@twocolumn
\onecolumn
\@tempswatrue
\else
\@tempswafalse
\fi
\secdef\@part\@spart}

\def\@endpart{\if@tempswa\twocolumn\fi\vspace*{30\p@}\par}
\else
\def\@endpart{\vfil\newpage
\if@twoside\if@openright\null\thispagestyle{empty}\newpage\fi\fi
\if@tempswa\twocolumn\fi}
\fi

\renewcommand\appendix{\setcounter{chapter}{0}\setcounter{section}{0}


\part{\appendixname}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SECTIONING
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{titlesec}
\if@web
\titleformat{\section}[frame]{\bf\sf\LARGE}{\small Section \thesection}{0pt}{}
\titleformat{\subsection}[frame]{\bf\sf\large}{\small SubSection \thesubsection}{0pt}{}
\titleformat{\subsubsection}[frame]{\bf\sf}{\small SubSubSection \thesubsubsection}{0pt}{}
\else
\titleformat{\section}[frame]{\bf\LARGE}{\small Section \thesection}{0pt}{}
\titleformat{\subsection}[frame]{\bf\large}{\small SubSection \thesubsection}{0pt}{}
\titleformat{\subsubsection}[frame]{\bf}{\small SubSubSection \thesubsubsection}{0pt}{}
\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% TITLE PAGE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{fancybox,color,eso-pic,graphicx,calc}
\shadowsize=2pt
\newcommand{\intro}[1]{\def\@intro{#1}}
\newcommand{\subtitle}[1]{\def\@subtitle{#1}}
\newcommand{\backpic}[1]{\def\@backpic{#1}}
\renewcommand\maketitle{
\begin{titlepage}
    \color{white}
    \ifx\@backpic\@empty
    \let\@backpic=\relax
    \else
    \AddToShipoutPictureBG*{\includegraphics[width=\paperwidth ,height=\paperheight]{\@backpic}}
    \fi
    \sffamily
    \vspace*{10mm}
    \begin{center}
        \bfseries\parbox{14cm}{\centering
        \centering\parbox{13.7cm}{\Huge \@title{\ifx\@subtitle\@empty\else\large\\\vspace*{5mm}\@subtitle\fi} }\\\vspace*{5mm}\large \@author \\\vspace*{5mm} Compiled at\space \today}
    \end{center}
    \vspace*{10mm}
    \shadowbox{\parbox{8cm}{\@intro}}
\end{titlepage}
\setcounter{footnote}{0}%
\vspace*{20mm}
\global\let\maketitle\relax
\addcontentsline{toc}{chapter}{Titlepage}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LOSTOF
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\tableofcontents{


\chapter{Table of Contents}\@starttoc{toc}}
\renewcommand\listoffigures{


\chapter{\listfigurename}\@starttoc{lof}}
\renewcommand\listoftables{


\chapter{\listtablename}\@starttoc{lot}}
\endinput
