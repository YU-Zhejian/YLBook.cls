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
%% Preparation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1999/12/01]\ProvidesClass{ylbook}[2020/08/04 v2 YLBook]

\RequirePackage{times}
\RequirePackage{url}
\RequirePackage{iftex}

\newif\if@chinese \@chinesefalse
\DeclareOption{chinese}{\@chinesetrue}
\newif\if@web \@webfalse
\DeclareOption{web}{\@webtrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass{book}

\renewcommand{\cleardoublepage}{
    \clearpage
    \if@twoside
        \ifodd
            \c@page
        \else
            \hbox{}\thispagestyle{empty}\newpage
            \if@twocolumn
                \hbox{}\thispagestyle{empty}\newpage
            \fi
        \fi
    \fi
}

\if@chinese\RequirePackage{xeCJK}\RequireXeTeX\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% MARGINS	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\if@twoside
    \setlength\oddsidemargin{-0.5in}
    \setlength\evensidemargin{0.5in}
\else
    \setlength\oddsidemargin{0in}
    \setlength\evensidemargin{0in}
\fi
\setlength\marginparwidth{0pt}
\setlength\marginparsep{0pt}

\setlength\parindent{2em}
\RequirePackage{indentfirst}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% WEB
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\if@web
    \renewcommand\familydefault{\sfdefault}
    \@mainmattertrue\pagenumbering{arabic}
\else
    \renewcommand\frontmatter{\@mainmatterfalse\pagenumbering{roman}}
    \renewcommand\mainmatter{\@mainmattertrue\pagenumbering{arabic}}
    \renewcommand\backmatter{\@mainmatterfalse\pagenumbering{roman}}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Chinese
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\if@chinese
    \renewcommand \thepart {第 \@Roman\c@part}
    \renewcommand \thechapter {\@arabic\c@chapter}
    \renewcommand\contentsname{目录}
    \renewcommand\listfigurename{图片目录}
    \renewcommand\listtablename{表格目录}
    \renewcommand\bibname{参考书目}
    \renewcommand\indexname{索引}
    \renewcommand\figurename{图}
    \renewcommand\tablename{表}
    \renewcommand\partname{部分}
    \renewcommand\chaptername{章}
    \renewcommand\appendixname{Appendix}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Title
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{titlesec}
\if@chinese
	\titleformat{\section}[frame]{\LARGE}{\small 第 \thesection 节}{0pt}{}
	\titleformat{\subsection}[frame]{\large}{\small  第\thesubsection 小节}{0pt}{}
	\titleformat{\subsubsection}[frame]{}{\small 第\thesubsubsection 小小节}{0pt}{}
\else
	\titleformat{\section}[frame]{\bf\sf\LARGE}{\small Section \thesection}{0pt}{}
	\titleformat{\subsection}[frame]{\bf\sf\large}{\small SubSection \thesubsection}{0pt}{}
	\titleformat{\subsubsection}[frame]{\bf\sf}{\small SubSubSection \thesubsubsection}{0pt}{}
\fi
