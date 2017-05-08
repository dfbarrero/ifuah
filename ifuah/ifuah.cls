%% Ikerkuntza operatiboa irakasgaiaren dokumentazioa prestatzeko formatua

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{ifuah}[2017/04/03 v0.1]

\LoadClassWithOptions{article}[2017/04/03]

\RequirePackage{graphicx}
\RequirePackage{color}
\RequirePackage{etoolbox}

% DEFINICION DE LOS TAMAÑOS DE LA HOJA

\paperheight 297mm
\paperwidth  210mm
\setlength{\pdfpagewidth}{\paperwidth}
\setlength{\pdfpageheight}{\paperheight}
\textwidth 0.81\paperwidth   
\textheight 0.75\paperheight
\voffset -38mm
\hoffset -5mm
\topmargin 15mm
\oddsidemargin 0mm
\evensidemargin 0mm
\marginparwidth 30mm
\marginparsep 0mm
\headsep 25mm
\headheight 20mm
\@ifundefined{footheight}{\newdimen\footheight}{}% this is for LaTeX2e
\footheight 25mm               % Height of box containing running foot.
\@ifundefined{footsep}{\newdimen\footsep}{}% this is for LaTeX2e
\footsep 20mm               % Height of box containing running foot.

\@twosidefalse 
\@mparswitchfalse


% Department
\DeclareOption{aut}{}

\DeclareOption{aut}
   {\def\@ifuahdept{Departamento de Autom\'atica}
    \def\@ifuahdeptlogo{logos/logoaut}}

\DeclareOption{cc}
   {\def\@ifuahdept{Departamento de C. Computaci\'on}
    \def\@ifuahdeptlogo{logos/logocc}}

%\def\@campus{Polytechnic School}
%\def\@campusa{Eskola Politeknikoa}
%\def\@campuse{Escuela Polit'ecnica}

%\DeclareOption{gipuzkoa}{}

%\DeclareOption{external}
%   {\def\@campus{University Campus}
%    \def\@campusEs{Campus Universitario}
%    \def\@campusa{Kampoko Kampusa}}
%\DeclareOption{bizkaia}
%   {\def\@campus{CAMPUS DE VIZKAYA}
%    \def\@campusa{BIZKAIKO CAMPUSA}}
%\DeclareOption{araba}
%   {\def\@campus{CAMPUS DE ALAVA}
%    \def\@campusa{ARABAKO CAMPUSA}}
    
% es
\DeclareOption{es}
   {\renewcommand\abstractname{Resumen} 
    \renewcommand\refname{Bibliograf\'ia}
    \renewcommand\figurename{Figura}
    \renewcommand\tablename{Tabla}
    \renewcommand\today{{\number\day} de\space\ifcase\month\or
    Enero\or Febrero\or Marzo\or Abril\or
    Mayo\or Junio\or Julio\or Agosto\or
    Septiembre\or Noviembre\or Diciembre
    \fi~de {\number\year}}
    \def\@ifuahlecturerlabel{Profesor(a): }
    \def\@ifuahyearlabel{A\~no: }
    \def\@ifuahtellabel{Tel\'efono: }
    \def\@ifuahmaillabel{E-mail: }
    \def\@ifuahprogramlabel{Titulaci\'on: }
    \def\@ifuahcourselabel{Asignatura: }
    \def\@ifuahcountry{Espa\~na}}
% en
\DeclareOption{en}{
    \def\@ifuahlecturerlabel{Lecturer: }
    \def\@ifuahyearlabel{Year: }
    \def\@ifuahtellabel{Telephone: }
    \def\@ifuahmaillabel{E-mail: }
    \def\@ifuahprogramlabel{Program: }
    \def\@ifuahcourselabel{Course: }
    \def\@ifuahcountry{Spain}}

\ProcessOptions

% COMMAND DEFINITIONS

%\def\departamentua#1{\gdef\@departamentua{#1}}
%\def\@departamentua{Compt Sci Dept}

%\def\logoDept#1{\gdef\@logoDept{#1}}
%\def\@logoDept{UAHCSDept}

%\def\fakultatea#1{\gdef\@fakultatea{#1}}
%\def\@fakultatea{Politechnic School}

\def\ifuahcourse#1{\gdef\@ifuahcourse{#1}}
\def\@ifuahcourse{Default course}

\def\ifuahyear#1{\gdef\@ifuahyear{#1}}
\def\@ifuahyear{}

\def\ifuahprogram#1{\gdef\@ifuahprogram{#1}}
\def\@ifuahprogram{Default degree}

\def\ifuahlecturer#1{\gdef\@ifuahlecturer{#1}}
\def\@ifuahlecturer{}

\def\ifuahtel#1{\gdef\@ifuahtel{#1}}
\def\@ifuahtel{}

\def\ifuahmail#1{\gdef\@ifuahmail{#1}}
\def\@ifuahmail{}

\def\ifuahaddrs#1{\gdef\@ifuahaddrs{#1}}
\def\@ifuahaddrs{Ctra Madrid-Barcelona, km 33,6\\ 28871 Alcal\'a de Henares, Madrid}
\def\@helbidea{
     \begin{tabular}[b]{rrr@{}}
     \@ifuahdept  \\
     %\@campus \\
     %\textcolor[rgb]{0.3,0.3,0.3}{\@campus} \\
     \@ifuahaddrs, \@ifuahcountry
    \end{tabular}
}

\def\@ifuahcoursehead{
  \fontfamily{phv}\selectfont
  \begin{tabular}[b]{r}
  \@ifuahcourse %\\
  %\textcolor[rgb]{0.3,0.3,0.3}{\@ifuahyear} \\
  \end{tabular}
}
\def\@ifuahcoursetitle{
   \fontfamily{phv}\selectfont
   \begin{tabular}[b]{c}
   \@ifuahcourse %\\
   %\textcolor[rgb]{0.3,0.3,0.3}{\@ifuahyear} \\
   \end{tabular}
}

% DEFINICION DE LOS DOS TIPOS DE ENCABEZADO / PIE (PRIMERA PAGINA Y SIGUIENTES)

\def\ps@iohead{
     \def\@oddhead{\parbox{\textwidth}{
     %\hspace{-10mm}
     \includegraphics[width=3cm,keepaspectratio=true]{logos/01_logo-vA_negro.pdf}\hfill
     \@ifuahcoursehead
     %\hspace{-10mm} 
     }}%
     \def\@oddfoot{{\parbox{\textwidth}{\centering \thepage}}}%
     \let\evenhead\@evenfoot
     \let\@evenfoot\@oddfoot
}

\def\ps@ioheadfirst{
     \def\@oddhead{}%
     \def\@oddfoot{{\parbox{\textwidth}{\scriptsize
      \fontfamily{phv}\selectfont
      \begin{tabular}[b]{ll}	
    	\ifdefempty{\@ifuahprogram}{}{\@ifuahprogramlabel & \@ifuahprogram \\}
    	\ifdefempty{\@ifuahcourse}{}{\@ifuahcourselabel & \@ifuahcourse \\}
    	\ifdefempty{\@ifuahyear}{}{\@ifuahyearlabel & \@ifuahyear \\}
    	\ifdefempty{\@ifuahlecturer}{}{\@ifuahlecturerlabel & \@ifuahlecturer \\}
    	\ifdefempty{\@ifuahtel}{}{\@ifuahtellabel & \@ifuahtel \\}
    	\ifdefempty{\@ifuahmail}{}{\@ifuahmaillabel & \@ifuahmail}
     \end{tabular}
     \hfill
     \@helbidea}}}%
     \let\evenhead\@evenfoot
     \let\@evenfoot\@oddfoot
}

%REDEFINICION DEL COMANDO maketitle PARA QUE NO SE CARGUE EL ESTILO DE LA PRIMERA PAGINA

\renewcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{ioheadfirst}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}

% CREACION DE LA PRIMERA PAGINA

\def\@maketitle{%
\enlargethispage{-10mm}
  \newpage
  \null
\vskip -30mm
%\hspace{-10mm}
\begin{minipage}{1.0\textwidth}
\hrule
\vskip 1mm
\raisebox{-0.5\height}{\includegraphics[height=15mm,keepaspectratio=true]{logos/01_logo-vA_negro.pdf}}  %,width=45mm,keepaspectratio=true
\hfill\hspace{-5cm} % dfbarrero: Place here the uni logo width to center the title
\raisebox{-0.5\height}{\Large\@ifuahcoursetitle}
\hfill
\raisebox{-0.5\height}{\includegraphics[height=12mm,keepaspectratio=true]{\@ifuahdeptlogo}} %{\@fakultatea}} width=45mm, 
\vskip 1mm
\hrule
\end{minipage}
\vskip 5mm%
  \begin{center}%
  \let \footnote \thanks
    {\LARGE \@title \par}%
    %\vskip 1.5em%


    \ifdefempty{\@author}{}{
        {\large
        \lineskip .5em%
        \begin{tabular}[t]{c}%
        \@author
        \end{tabular}\par
        }%
    }

    \ifdefempty{\@date}{}{
        \vskip 1em
        {\large \@date}
    }
  \end{center}%
  \par
  \vskip 1.5em
}

\pagestyle{iohead}

%end of file isgreport.cls
