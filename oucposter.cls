\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{geoposter}[2020/01/15 Geo's poster class for LaTeX]
\RequirePackage{xkeyval}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
% define important lengths
\newlength{\poster@height}
\setlength{\poster@height}{42cm}

\newlength{\poster@width}
\setlength{\poster@width}{36cm}

\newlength{\poster@bannerheight}
\setlength{\poster@bannerheight}{14cm}

\newlength{\poster@logoheight}
\setlength{\poster@logoheight}{5cm}

\newlength{\poster@margin}
\setlength{\poster@margin}{2cm}

% define important colors
\newcommand{\poster@bgcolor}{black}
\newcommand{\poster@fgcolor}{white}

%-------------------------------------------------------------------------------
% Declare options
%-------------------------------------------------------------------------------
\DeclareOptionX{bannerheight}{
	\setlength{\poster@bannerheight}{#1}
}

\DeclareOptionX{logoheight}{
	\setlength{\poster@logoheight}{#1}
}

\DeclareOptionX{width}{
	\setlength{\poster@width}{#1}
}

\DeclareOptionX{height}{
	\setlength{\poster@height}{#1}
}

\DeclareOptionX{margin}{
	\setlength{\poster@margin}{#1}
}

\DeclareOptionX{color}{
	\renewcommand{\poster@color}{#1}
}

\DeclareOptionX{inverttitle}{
	\renewcommand{\poster@foregroundcolor}{black}
}

\ProcessOptionsX
\LoadClass{article}

%-------------------------------------------------------------------------------
% Set up paper geometry
%-------------------------------------------------------------------------------
\RequirePackage[]{geometry}
\geometry{
  paperheight = \poster@height,
  paperwidth  = \poster@width,
  margin      = \poster@margin,
}
\setlength{\columnsep}{\poster@margin}

% %-------------------------------------------------------------------------------
% % Other required packages/definitions
% %-------------------------------------------------------------------------------
\RequirePackage{multicol} % multiple columns
\pagenumbering{gobble} % remove page numbers

% font size
\renewcommand{\Huge}{\fontsize{90}{45}\selectfont}
\renewcommand{\LARGE}{\fontsize{30}{45}\selectfont}
\renewcommand{\Large}{\fontsize{24}{30}\selectfont}
\renewcommand{\large}{\fontsize{20}{25}\selectfont}
\renewcommand{\normalsize}{\fontsize{15}{20}\selectfont}
\newcommand{\formularsize}{\fontsize{12}{15}\selectfont}
\renewcommand{\footnotesize}{\fontsize{10}{15}\selectfont}
\renewcommand{\small}{\fontsize{8}{10}\selectfont}
\renewcommand{\tiny}{\fontsize{6}{6}\selectfont}

% paragraph options
\setlength{\parindent}{0pt}
\newcommand{\defaultparskip}{0.5cm plus 0.5cm}
\setlength{\parskip}{\defaultparskip}

% headings
\RequirePackage{titlesec}
\titlespacing{\section}{0pt}{\parskip}{-0.8\parskip}
\titlespacing{\subsection}{0pt}{\parskip}{-0.8\parskip}
\titlespacing{\subsubsection}{0pt}{\parskip}{-0.8\parskip}

% % font
\RequirePackage{mathtools}
\RequirePackage{mathspec}
\defaultfontfeatures{Mapping=tex-text,Scale=MatchLowercase}
\setmainfont[]{Helvetica}
\newfontfamily{\bannerfont}{DIN Condensed}[WordSpace=1.2]

% %-------------------------------------------------------------------------------
% % Official colours
% %-------------------------------------------------------------------------------
\RequirePackage{xcolor}
\definecolor{white}{cmyk}{0.00,0.00,0.00,0.00}
\definecolor{black}{cmyk}{0.00,0.00,0.00,1.00}

% %-------------------------------------------------------------------------------
% % Make title/banner
% %-------------------------------------------------------------------------------
\RequirePackage{eso-pic} % defines \AddToShipoutPicture
\RequirePackage{authblk} % affiliations
\renewcommand*{\Affilfont}{\normalsize\normalfont}
\renewcommand*{\Authfont}{\normalsize\normalfont}
% % affiliations on one line
\renewcommand\AB@affilsepx{\hspace{0.5em}\protect\Affilfont}

\newcommand*{\email}[1]{
  \def\poster@email{#1}
}

% % set lengths
\newlength{\poster@bannertextheight}
\setlength{\poster@bannertextheight}{\poster@bannerheight}
\addtolength{\poster@bannertextheight}{-2.0\poster@margin}

\newlength{\poster@bannertextwidth}
\setlength{\poster@bannertextwidth}{\paperwidth}

\RequirePackage{picture}
\RequirePackage{changepage}
\RequirePackage[skins]{tcolorbox}

\usepackage{calc}
\newlength{\poster@logoth}
\setlength{\poster@logoth}{\paperheight - \heightof{OUC} - 2.7cm}
\newlength{\poster@logotw}
\setlength{\poster@logotw}{\paperwidth - \widthof{OUC} - 2cm}

\newlength{\poster@logoph}
\setlength{\poster@logoph}{\paperheight - \heightof{OUC} - 2.7cm}
\newlength{\poster@logopw}
\setlength{\poster@logopw}{\paperwidth - \widthof{OUC} - 5cm}

\newlength{\poster@clogoph}
\setlength{\poster@clogoph}{\paperheight - \heightof{OUC} - 2.7cm}
\newlength{\poster@clogopw}
\setlength{\poster@clogopw}{\paperwidth - \widthof{OUC} - 7.2cm}

\newcommand{\placetextbox}[3]{% \placetextbox{<horizontal pos>}{<vertical pos>}{<stuff>}
  \setbox0=\hbox{#3}% Put <stuff> in a box
  \AddToShipoutPictureFG*{% Add <stuff> to current page foreground
    \put(\LenToUnit{#1},\LenToUnit{#2}){\vtop{{\null}\makebox[0pt][c]{#3}}}%
  }%
}%



\renewcommand{\maketitle}{
	\vspace*{-2cm}
	\begin{adjustwidth}{-1cm}{-1cm}
	\begin{tcolorbox}[colback = black!100, colframe = black!100, arc = 0mm, outer arc = 0mm, height=5cm, top=1cm, left=1cm]
		\textcolor{white}{
			\vspace{0.2cm}
			\LARGE\bf\@title\\
			\hspace*{0.1cm}\vspace*{-0.2cm}\@author\\
			\textit{\poster@email}
			\placetextbox{\poster@logotw}{\poster@logoth}{\textcolor{white}{\Huge\bf\bannerfont OUC}}%
			\placetextbox{\poster@logopw}{\poster@logoph}{\includegraphics[width=2cm,height=2cm]{ouclogo}}%
			\placetextbox{\poster@clogopw}{\poster@clogoph}{\includegraphics[width=2cm,height=2cm]{otherlogo}}%
		}
	\end{tcolorbox}
	\end{adjustwidth}
}


\newenvironment{Figure}
  {\par\medskip\noindent\minipage{\linewidth}}
  {\endminipage\par\medskip}