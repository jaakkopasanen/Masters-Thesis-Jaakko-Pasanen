%%
%% This is file `tutthesis.cls',
%% This contains add-ons for report.cls file of the LaTeX base system.
%% Author: Sami Paavilainen (16 October 2006)
%% --------------------------------------------------------------
%% 
%% It may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%    http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2003/12/01 or later.
%% 
%% Modified: Erno Salminen, 2014-08-15, 
%%  - translated comments to English
%%  - includes package lstlistings for software codes, 
%%  - include packages hyperref and url for cross-references
%%  - page headers are not in uppercase anymore
%%  - minor tweaks


\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{tutthesis}
              [2014/07/28 v0.5 Extension to basic LaTeX document class 'report']

% Load the basic template 'report.cls'. 
\LoadClassWithOptions{report}


% TUT specific packages:
% \RequirePackage[T1]{fontenc} 
% \RequirePackage[utf8]{inputenc}% includes scandinavian letters
\RequirePackage{graphicx}        % for figures
\RequirePackage{psfrag}          % for editing ps files
\RequirePackage{subfigure}       % parallel small figures a,b,c...
\RequirePackage{wrapfig}         % put text around the fig
\RequirePackage{fancyhdr}        % prettier paging, http://www.ctan.org/tex-archive/macros/latex/contrib/fancyhdr/fancyhdr.pdf
\RequirePackage{supertabular}    % tables over 1 page
\RequirePackage{rotating}        % rotate tables adn figures
\RequirePackage{amsmath}         % mathematics
\RequirePackage{setspace}        % line spacing

\usepackage[font=small,it, labelsep=space]{caption} % Figure caption text font and size, 
% Option labelse0=space removes colon, i.e. Figure 1.1 instead of Figure 1.1:
\usepackage{hyperref}       % pdf links to e.g. figures and citations
\usepackage{url}            % web links (URL)


% Package documentation
% ftp://ctan.tug.org/tex-archive/macros/latex/contrib/subfig/subfig.pdf


%
% Title page commands
%

% Create new types with 1 parameter (like \author} to print the basic
% info into title and abstract pages. At sign @denotes internal
% variable in Latex.
\def\titleB#1{\gdef\@titleB{#1}}
\def\@titleB{\@latex@warning@no@line{No \noexpand\titleB given}}

\def\thesistype#1{\gdef\@thesistype{#1}}
\def\@thesistype{\@latex@warning@no@line{No \noexpand\thesistype given}}

\def\examiner#1{\gdef\@examiner{#1}}
\def\@examiner{\@latex@warning@no@line{No \noexpand\examiner given}}

% Layout the title on 1st page (name, title, thesis type) in
% sans-serif font
\renewcommand\maketitle{
  \noindent
      {\bf\large \textsf{\MakeUppercase{\@author}}}\\
      {\bf\large \textsf{\MakeUppercase{\@title}}}\\
      \\
      \textsf{\@thesistype}
}



%
% TUT specific layout and font sizes
%
\setlength\textwidth{15cm}  % 15*24cm text area leaves 6cm horiz margins and 5.7cm vertical
\setlength\textheight{24cm} % 

\setlength\topmargin{0.0cm} % inner margins
\setlength\voffset{-1.25cm} % outer vertical   margins
\setlength\hoffset{0cm}     % outer horizontal margins
\setlength\oddsidemargin{1cm}  % inner margins for odd  pages
\setlength\evensidemargin{1cm} % inner margins for even pages
\setlength\brokenpenalty{1000} 
\renewcommand{\baselinestretch}{1.2}

\setlength\headheight{15pt} % 
\setlength\headsep{0.8cm}   % space below header
\setlength\footskip{30pt}   % space above the footnote
\newlength\chapterspace
%\setlength\chapterspace{0.0cm}
\setlength\chapterspace{0.4cm}
\newcommand\chapterheadbefore{26pt}
\newcommand\chapterheadafter{42pt}
\newcommand\chapfigname{\thechapter}

% Paragraphs should be either indented or have vertical space (skip)
% between them. You can select: (0.0cm + 12pt) or (0.5cm + 0pt)
\setlength\parindent{0.0cm} % change to 0 or 0.5cm if needed
\setlength\parskip{12pt}    % change to 0pt or 12pt if needed


% Optional: Try to prevent large figures appearing by themselves
% without any text.
% http://dcwww.camd.dtu.dk/~schiotz/comp/LatexTips/LatexTips.html Be
% careful not to make \floatpagefraction larger than \topfraction
\renewcommand{\topfraction}{0.85}        % default 0.7
\renewcommand{\textfraction}{0.1}        % default 0.2
\renewcommand{\floatpagefraction}{0.75}



%
% Redefine the spacing and layout for headers (chapter, section,
% subsection...). This part copied from
% http://tex.loria.fr/ctan-doc/macros/latex/base/classes.pdf
%
\renewcommand\chapter{
  % Start chapter from new page. 'Openright' can be used together with 'twoside' mode
  \if@openright
  \cleardoublepage
  \else
  \clearpage
  \fi 
  \thispagestyle{plain} %
  \global\@topnum\z@    % no floats on top of page
  \@afterindentfalse    % do not indent the next text line
  \secdef\@chapter\@schapter
}
\def\@chapter[#1]#2{
  \ifnum \c@secnumdepth >\m@ne
  \refstepcounter{chapter}%
  \typeout{\@chapapp\space\thechapter.}   %
  \addcontentsline{toc}{\chaptertocstyle} %
                  {\protect\numberline{\chaptertocstr}#1} %
                  \else
                  \addcontentsline{toc}{\chaptertocstyle}{\chaptertocstr} %
                  \fi
                  \chaptermark{#1}%
                  \addtocontents{lof}{\protect\addvspace{10\p@}} %
                  \addtocontents{lot}{\protect\addvspace{10\p@}} %
                  \if@twocolumn
                  \@topnewpage[\@makechapterhead{#2}]%
                  \else
                  \@makechapterhead{#2}%
                  \@afterheading
                  \fi
}
\def\@makechapterhead#1{%
  \vspace*{\chapterheadbefore}%
          {\parindent \z@ \raggedright \normalfont
            \ifnum \c@secnumdepth >\m@ne
            \bf\textsf{\Large{\tutchapter}} % Chapter number
            \fi
            \hspace*{\chapterspace}
            \bf\Large \textsf{\MakeUppercase{%
                #1
            }}\par                         % chapter title
            \vspace{\chapterheadafter}%    % add vertical space
}}
\def\@schapter#1{
  \if@twocolumn
  \@topnewpage[\@makeschapterhead{#1}]%
  \else
  \@makeschapterhead{#1}%
  \@afterheading
  \fi
}
\def\@makeschapterhead#1{%
  \vspace*{-22pt}%
          {\parindent \z@ \raggedright 
            \bf\Large \textsf{\MakeUppercase{#1}}\par      % chapter* title
            \vspace{12pt}%                                 % add vertical space
}}
\renewcommand\section{\@startsection {section}{1}{\z@}%
  {-1.8ex  \@plus -1ex \@minus -.2ex}%
  {2.3ex \@plus.2ex \@minus \parskip}%
  {\noindent \bf\large\textsf}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
  {-1.8ex\@plus -1ex \@minus -.2ex}%
  {2.3ex \@plus .2ex \@minus \parskip}%
  {\noindent \bf\large\textsf}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
  {-3.25ex\@plus -1ex \@minus -.2ex}%
  {1.5ex \@plus .2ex}%
  {\noindent \normalfont\normalsize\bfseries}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
  {3.25ex \@plus1ex \@minus.2ex}%
  {-1em}%
  {\normalfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
  {3.25ex \@plus1ex \@minus .2ex}%
  {-1em}%
  {\normalfont\normalsize\bfseries}}




%
% Set the numbering styles for chapters, figures, tables and equations
%
\newcommand\chaptertocstyle{chapter}
\newcommand\chaptertocstr  {\thechapter.}
\newcommand\tutchapter     {\thechapter.}
\renewcommand\thechapter      {\@arabic\c@chapter}
\renewcommand\thesection      {\thechapter.\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection \.@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}

\renewcommand \thefigure{
  \ifnum \c@chapter>\z@ \chapfigname.\fi \@arabic\c@figure}
\captionsetup[figure]{labelfont={bf,it},textfont={it}}
\captionsetup[subfigure]{labelfont=bf,textfont=normalfont,singlelinecheck=off,justification=raggedright}


\renewcommand \thetable{
  \ifnum \c@chapter>\z@ \chapfigname.\fi \@arabic\c@table}
\captionsetup[table]{labelfont={bf,it},textfont={it}}

\renewcommand\theequation{
  \ifnum \c@chapter>\z@ \chapfigname.\fi \@arabic\c@equation}
% To get plain running equation numbers - (1)(2)(3)... - use
% \renewcommand\theequation{\@arabic\c@equation}. You can modify the
% figure and table commands similarly.

 

%
% Define the layour for the table of contents (toc) and its possible
% header types
%
\renewcommand\tableofcontents{%
  % TOC in single column even if article otherwise has 'twocolumn' mode
  \if@twocolumn
  \@restonecoltrue\onecolumn
  \else
  \@restonecolfalse
  \fi

  \chapter*{\MakeUppercase{\contentsname}}  % Heading in CAPS
  \@mkboth {} {}                            % a) No page headers
  %\@mkboth {\contentsname} {\contentsname} % b) Page headers appear as written    
  
  \@starttoc{toc}                           % Create the actual TOC
  \if@restonecol\twocolumn\fi

}

% Command dottectocline has 3 params: header level, indentation, numwidth. 
\renewcommand*\l@chapter      {\baselineskip 0.20in\@dottedtocline{1}{0.0em}{1.5em}}
\renewcommand*\l@section      {\baselineskip 0.15in\@dottedtocline{2}{1.5em}{2.3em}}
\renewcommand*\l@subsection   {\baselineskip 0.15in\@dottedtocline{3}{2.5em}{3.2em}}
\renewcommand*\l@subsubsection{\@dottedtocline{4}{6.5em}{4.1em}}
\renewcommand*\l@paragraph    {\@dottedtocline{5}{9.5em}{5em}}
\renewcommand*\l@subparagraph {\@dottedtocline{6}{11.5em}{6em}}
\newcommand*\l@appendix       {\baselineskip 0.20in\@dottedtocline{1}{0.0em}{3.8em}}



%
% Define an own type for listing the special terms and symbols
% Usage: \item [PC] personal computer
%
\newenvironment*{termlist}
{\begin{list}{}{
      \setlength{\itemsep}{-5pt} % Optional: Put these lines little bit closer to each other
      \setlength{\labelwidth}{7em}
      \setlength{\itemindent}{0em}
      \setlength{\leftmargin}{7em}
      \setlength{\labelsep}{0em}
      \renewcommand*{\makelabel}[1]
                    {\normalfont ##1\hfil}}}
{\end{list}}



%
% Codes and pseudocodes are best hanbdled with package 'lstlistings'
% http://texdoc.net/texmf-dist/doc/latex/listings/listings.pdf
% We'll define two styles: code listing and console
%
\usepackage{listings} 
\usepackage{color}
\definecolor{gray95}{gray}{.95}
\renewcommand\lstlistingname{Program} % or {Ohjelma} in Finnish
\renewcommand\lstlistlistingname{List of Programs}
\captionsetup[lstlisting]{labelfont={bf,it},textfont={it}}

% Use this for (pseudo)code
\lstdefinestyle{a1listing} { 
  numbers        =left,                             % select either 'left' or 'none'
  language       =C,                                % C, Java, Matlab, VHDL, XML, HTML...
  %basicstyle    =\small\ttfamily,                  % small teletype font
  basicstyle     =\footnotesize\ttfamily,           % even smaller teletype font
  emphstyle      =\color[rgb]{0.0, 0.0, 0.5}\bf,    % blue + bold
  keywordstyle   =\bf,                              % bold
  commentstyle   =\color[rgb]{0.2, 0.2, 0.2}\textit,% dark gray + italic
  stringstyle    =\color[rgb]{0.2, 0.2, 0.2},       % dark gray 
  showstringspaces=false                            % don't print special symbol for white space
  backgroundcolor=\color{white}                     % white or gray95,
  frame          =lrtb,                 % frame is on (l)eft, (r)ight, (t)op, and (b)ottom
  framerule      =0.1pt,                            % widht of box edge line: 0pt, 0.5pt, 1pt
  linewidth=     \textwidth,                        % whole column wide (misleading term...)
  xleftmargin=   0.6cm                              % leave space for line numbering
}

% Use this for fonsole listings, for example $cd /bin; ls -la
\lstdefinestyle{console} 
{ 
  numbers        =none, 
  basicstyle     =\footnotesize\ttfamily, % \small\ttfamily, 
  showstringspaces=false                  % don't print special symbol for white space
  backgroundcolor=\color{gray95}, 
  frame          =lrtb,       % =left,rigth,top,bottom
  framerule      =0pt,        % 0p5, 0.5pt, 
  linewidth      =\textwidth, % whole column wide
  xleftmargin=   0.6cm        % indent a little
}

% You can also define the keywords and other properties of an arbitrary
% language
\lstdefinelanguage{myownlanguage}
{morekeywords={system, application, service, task},
  sensitive=false,
  morecomment=[s]{<!--}{-->},
  morestring=[b]",
}

%
% Set header ja footer properties for pages 
%

% Set the page headers. Chapters and sections can define so called
% leftmark and rightmark, i.e. which mean the current location inside
% the document. Usually the chapter number and name, like
% '1. Introduction'. These marks can be used in headers.
%
% For theses with over 80 pages, use option 'twoside' �for
% documentclass.  This part is copied from classes.pdf
% http://tex.loria.fr/ctan-doc/macros/latex/base/classes.pdf 
%Latex' internal Constants: @ne = One = 1.0, \m@one = minus one =
% -1.0, \z@ = zero = 0.0 or 0pt
%
\if@twoside
% Define how to print the chapter or section name on top of page (twoside mode)
\def\ps@headings{%
  \let\@mkboth\markboth
  \let\@oddfoot\@empty
  \let\@evenfoot\@empty
  % Comment out the next two 2 to get rid of page headers
  \def\@evenhead{\thepage\hfil\slshape\leftmark}    % even page (left) shows chapter name
  \def\@oddhead{{\slshape\rightmark}\hfil\thepage}  % odd page (right) shows section name

  \def\chaptermark##1{%
    % Print as written
    \markboth {
        \ifnum \c@secnumdepth >\m@ne
        \@chapapp\ \tutchapter \ % Inlcude chapter number (if it exists)
        \fi
        ##1}{}                   % Set the leftmark only (leave rightmark empty)
  }                  
  \def\sectionmark##1{%
    \markright {
      \ifnum \c@secnumdepth >\z@ 
      \thesection. \ % Inlcude section number (if it exists)
      \fi
      ##1}           % Set the rightmark (leave leftmark 'as is'??)
  }
  % Set the rightmark only (leave leftmark 'as is' ???)
  %    % Print in CAPS
  %    \markboth {\MakeUppercase{%
  %        \ifnum \c@secnumdepth >\m@ne
  %        \@chapapp\ \tutchapter \ % Chapter's name on even pages (but not on chapter's first)
  %        \fi
  %        ##1}}{}}%
  %  \def\sectionmark##1{%
  %    \markright {\MakeUppercase{%
  %        \ifnum \c@secnumdepth >\z@
  %        \thesection. \ % Section name on odd pages (e.g. 2.3)
  %        \fi
  %        ##1}}}
}         

\else
% Define how to print the chapter name on top of page (oneside mode)
\def\ps@headings{%
  \let\@mkboth\markboth
  \let\@oddfoot\@empty
  % Comment out the next line to get rid of page headers
  \def\@oddhead{{\slshape\rightmark}\hfil\thepage}% % Chapter's name on each page (one-sided printing)

  \def\chaptermark##1{%
    % Print as written
    \markright {
        \ifnum \c@secnumdepth >\m@ne
        \@chapapp\ \tutchapter \  % Inlcude chapter number (if it exists)
        \fi
        ##1}                      % Set the rightmark (leave leftmark 'as is'??)
  }

  % Added by ES, to get headers without uppercase
  \def\sectionmark##1{%
    \markright {
      \ifnum \c@secnumdepth >\z@ 
      \thesection. \ % Inlcude section number (if it exists)
      \fi
      ##1}
  }

  %    % Print in CAPS
  %    \markright {\MakeUppercase{%
  %        \ifnum \c@secnumdepth >\m@ne
  %        \@chapapp\ \tutchapter \ %% Chapter's name on each page (one-sided printing)
  %        \fi
  %        ##1}}}
}
\fi



\pagestyle{fancyplain}
\rhead{\thepage}
\chead{}
\lhead{}
\lfoot{}
\cfoot{}
\rfoot{}
\renewcommand{\headrulewidth}{0pt} % 0pt removes the horiz. line



%                                      
% Define semicolon between multiple citations, e.g. [1; 2] instead of comma (,)
% ES (2014-06-18) Removed this nonsense
%
%\def\@citex[#1]#2{%
%  \let\@citea\@empty
%  \@cite{\@for\@citeb:=#2\do
%    {\@citea\def\@citea{;\penalty\@m\ }%
%     \edef\@citeb{\expandafter\@firstofone\@citeb}%
%     \if@filesw\immediate\write\@auxout{\string\citation{\@citeb}}\fi
%     \@ifundefined{b@\@citeb}{\mbox{\reset@font\bfseries ?}%
%       \G@refundefinedtrue
%       \@latex@warning
%         {Citation `\@citeb' on page \thepage \space undefined}}%
%       {\csname b@\@citeb\endcsname}}}{#1}}

%


%%
%% End of file `tutthesis.cls'.
