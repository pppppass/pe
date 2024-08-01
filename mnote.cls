\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mnote}[2024/07/31 0.1.0 Notes with margin class]

\newcommand\@mnote@fboxcolor{black}

\DeclareOption{sqdiam}{\newcommand\@mnote@opt@sqdiam{}}
\DeclareOption{noboxed}{\renewcommand\@mnote@fboxcolor{white}}
\DeclareOption{boxed}{\renewcommand\@mnote@fboxcolor{black}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions\relax

\LoadClass[12pt]{article}

\RequirePackage{geometry}

\geometry{margin=0.5in,left=3.0in,bottom=1.0in,marginparwidth=2.6667in}

\RequirePackage{tikz}

\AddToHook{shipout/background}{%
\begin{tikzpicture}[remember picture,overlay,shift=(current page.north west)]
\draw[red, thick] (2.5in, 0in) -- (2.5in, -11in);
\end{tikzpicture}
}

\RequirePackage{amsmath}
\RequirePackage{amssymb}

\allowdisplaybreaks

\RequirePackage{fontspec}
\RequirePackage{newpxtext}
\RequirePackage{eulerpx}

\linespread{1.08}

\renewcommand\maketitle{%
\newpage%
{\centering\@title\par}%
{\raggedleft\@author\par}%
{\raggedleft\@date\par}%
\leavevmode\par%
}

\RequirePackage{graphicx}

\DeclareMathSymbol{\amsbox}{\mathord}{AMSa}{"03}
\ifdefined\@mnote@opt@sqdiam%
\newcommand\amsdiamond{\rotatebox[origin=c]{45}{\amsbox}}%
\else%
\DeclareMathSymbol{\amsdiamond}{\mathord}{AMSa}{"06}%
\fi

\newcounter{numsect}
\newcounter{numthmsect}
\newcounter{numthmpaper}

\newcommand\newsection[1]{%
\ifnum\value{numsect}>0\newpage\fi%
\stepcounter{numsect}%
\setcounter{numthmsect}{0}%
\noindent\hspace{-0.5in}\llap{\S\arabic{numsect}. } \textbf{#1}%
\par
\leavevmode
\par
}

\newcommand\newsubsection[1]{%
\noindent\hspace{-0.5in}\llap{\dag\hspace{0.25em}} \textbf{#1}%
}

\newenvironment{question}{%
\stepcounter{numthmsect}%
\noindent\hspace{-0.5in}\llap{\rotatebox[origin=B]{45}{\arabic{numthmsect}\large?}\,} \textbf{Question \arabic{numthmsect}.}%
}{%
\par
}

\newenvironment{realitycheck}{%
\noindent\hspace{-0.5in}\llap{\rotatebox[origin=B]{45}{\large!} } \textbf{Reality check.}%
}{%
\par
}

\newenvironment{exercise}{%
\noindent\hspace{-0.5in}\llap{\rotatebox[origin=c]{45}{\large>}\,} \textbf{Exercise.}%
}{%
\par
}

\RequirePackage[greek,english]{babel}

\newenvironment{principle}{%
\stepcounter{numthmpaper}%
\noindent\hspace{-0.5in}\llap{\raisebox{0.75pt}{$\amsdiamond$}\greek{numthmpaper}. } \textbf{Principle \greek{numthmpaper}.}%
}{%
\par
}

\newenvironment{element}{%
\noindent\hspace{-0.5in}\llap{$\amsbox$ } \textbf{Element.}%
}{%
\par
}

\RequirePackage{moreenum}

\renewcommand*{\@single@greek}[1]{%
\ifcase#1\or\textalpha\or\textbeta\or\textgamma\or\textdelta\or\textvarepsilon\or\textzeta\or\texteta\or\texttheta\or\textiota\or\textkappa\or\textlambda\or\textmu\or\textnu\or\textxi\or\textomicron\or\textpi\or\textvarrho\or\textsigma\or\texttau\or\textupsilon\or\textphi\or\textchi\or\textpsi\or\textomega\else\@ctrerr\fi
}

\RequirePackage{fancyhdr}
\RequirePackage{datetime}

\pagestyle{fancy}
\fancyfoot[R]{\ddmmyydate\today}

\renewcommand\headrulewidth{0pt}

\RequirePackage{hyperref}

\hypersetup{colorlinks=true,urlcolor=blue}

\RequirePackage{pbox}
\RequirePackage{marginnote}
\RequirePackage{ragged2e}

\reversemarginpar

\newcommand*\@mnote@tmp@mdframed{mdframed}

\newcommand\margintext[2][1.8333in]{%
\ifx\@currenvir\@mnote@tmp@mdframed%
\marginnote{\fcolorbox{\@mnote@fboxcolor}{white}{\pbox[t]{#1}{\RaggedRight\footnotesize#2}}}%
\else
\marginpar{\fcolorbox{\@mnote@fboxcolor}{white}{\pbox[t]{#1}{\RaggedRight\footnotesize#2}}}%
\fi
}

\renewcommand*{\raggedrightmarginnote}{}
\renewcommand*{\raggedleftmarginnote}{\raggedright}

\AtBeginDocument{%
\setlength\abovedisplayskip{6pt plus 3pt minus 3pt}%
\setlength\abovedisplayshortskip{0pt plus 3pt}%
\setlength\belowdisplayskip{6pt plus 3pt minus 3pt}%
\setlength\belowdisplayshortskip{3pt plus 3pt minus 3pt}%
}

\setlength\headheight{15pt}