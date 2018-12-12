%%%
%% thesis.cls (pLaTeX2e)
%%  for the Thesis of Department of Electronics and Control Engineering,
%%  National Institute of Technology, Kitakyushu College, 2018-.
%% E-mail: tfukuda@kct.ac.jp
\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{thesis}
  [2018/12/11 v1.0 for Thesis]

\newif\if@enable@uptex \@enable@uptexfalse
\ifx\ucs\@undefined\else
 \ifnum\ucs"3000="3000
  \@enable@uptextrue
 \fi
\fi

\newdimen\@JQ
\if@enable@uptex
 \@JQ=0.769362pt
\else
 \@JQ=0.7392507pt
\fi
\newdimen\@Q
 \@Q=0.71144pt
\newdimen\@EM
 \@EM=.03125em

\def\kenc@JYn{\if@enable@uptex JY2\else JY1\fi}
\def\kenc@JTn{\if@enable@uptex JT2\else JT1\fi}

\newif\if@thesis
\@thesisfalse

\newif\if@midterm
\@midtermfalse

\DeclareOption{thesis}{
  \@midtermfalse\@thesistrue%
  \gdef\hd@type{卒業論文}\gdef\tl@type{論\hskip1zw 文}\gdef\@type{P}
  }
\DeclareOption{midterm}{
  \@midtermtrue\@thesistrue%
  \gdef\hd@type{中間発表}\gdef\tl@type{論\hskip1zw 文}\gdef\@type{P}
 }

\def\ieicej@warning{\ClassWarningNoLine{ieicej}}




\newcounter{@thesis}
\newcommand{\@ptsize}{}
\newif\if@restonecol
\hour\time \divide\hour by 60\relax
\@tempcnta\hour \multiply\@tempcnta 60\relax
\minute\time \advance\minute-\@tempcnta
\newif\if@enablejfam \@enablejfamtrue
\newif\if@mathrmmc \@mathrmmcfalse
\DeclareOption{thesis}{\setcounter{@thesis}{1}%
  \@thesistrue
  \setlength\paperheight {297mm}%
  \setlength\paperwidth  {210mm}}
\DeclareOption{midterm}{\setcounter{@thesis}{1}%
  \@thesistrue
  \@midtermtrue
  \setlength\paperheight {297mm}%
  \setlength\paperwidth  {210mm}}
\DeclareOption{b5paper}{\setcounter{@thesis}{4}%
  \setlength\paperheight {257mm}
  \setlength\paperwidth  {182mm}}
\DeclareOption{10pt}{\renewcommand{\@ptsize}{0}}
\DeclareOption{11pt}{\renewcommand{\@ptsize}{1}}
\DeclareOption{12pt}{\renewcommand{\@ptsize}{2}}
\DeclareOption{tombow}{%
  \tombowtrue \tombowdatetrue
  \setlength{\@tombowwidth}{.1mm}%
  \@bannertoken{%
     \jobname\space:\space\number\year/\number\month/\number\day
      (\number\hour:\number\minute)}
  \maketombowbox}
\DeclareOption{tombo}{%
  \tombowtrue \tombowdatefalse
  \setlength{\@tombowwidth}{.1mm}%
  \maketombowbox}
\DeclareOption{mentuke}{%
  \tombowtrue \tombowdatefalse
  \setlength{\@tombowwidth}{\z@}%
  \maketombowbox}
\DeclareOption{tate}{\AtBeginDocument{\tate\message{《縦組モード》}}}
\DeclareOption{oneside}{\@twosidefalse}
\DeclareOption{twoside}{\@twosidetrue}
\DeclareOption{onecolumn}{\@twocolumnfalse}
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{fleqn}{%\input{fleqn.clo}
 \ieicej@warning{fleqn is loaded by this class file}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}}

\DeclareOption{disablejfam}{\@enablejfamfalse}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\ExecuteOptions{b5paper,twoside,twocolumn,final}
\ProcessOptions\relax

%% pdf and ps papersize

\if@enable@uptex
 \DeclareFontShape{JY2}{mc}{m}{n}{%
     <5> <6> <7> <8> <9> <10> %sgen*min
     <10.95><12><14.4><17.28><20.74><24.88> upjisr-h
     <-> upjisr-h
     }{}
 \DeclareFontShape{JY2}{gt}{m}{n}{%
     <5> <6> <7> <8> <9> <10> %sgen*goth
     <10.95><12><14.4><17.28><20.74><24.88> upjisg-h
     <-> upjisg-h
     }{}
\else
 \DeclareFontShape{JY1}{mc}{m}{n}{%
     <5> <6> <7> <8> <9> <10> %sgen*min
     <10.95><12><14.4><17.28><20.74><24.88> jis
     <-> jis
     }{}
 \DeclareFontShape{JY1}{gt}{m}{n}{%
     <5> <6> <7> <8> <9> <10> %sgen*goth
     <10.95><12><14.4><17.28><20.74><24.88> jisg
     <-> jisg
     }{}
\fi
\DeclareFontShape{\kenc@JYn}{mc}{bx}{n}{<->ssub*gt/m/n}{}
\DeclareFontShape{\kenc@JYn}{gt}{bx}{n}{<->ssub*gt/m/n}{}
\DeclareFontShape{\kenc@JYn}{mc}{m}{it}{<->ssub*mc/m/n}{}
\DeclareFontShape{\kenc@JYn}{mc}{m}{sc}{<->ssub*mc/m/n}{}
\DeclareFontShape{\kenc@JYn}{mc}{m}{sl}{<->ssub*mc/m/n}{}
\DeclareFontShape{\kenc@JYn}{mc}{bx}{it}{<->ssub*gt/m/n}{}
\DeclareFontShape{\kenc@JYn}{gt}{m}{it}{<->ssub*gt/m/n}{}
\DeclareFontShape{\kenc@JYn}{gt}{bx}{it}{<->ssub*gt/m/n}{}
\DeclareFontShape{\kenc@JTn}{mc}{bx}{n}{<->ssub*gt/m/n}{}
\DeclareFontShape{\kenc@JTn}{gt}{bx}{n}{<->ssub*gt/m/n}{}
\DeclareFontShape{\kenc@JTn}{mc}{m}{it}{<->ssub*mc/m/n}{}
\DeclareFontShape{\kenc@JTn}{mc}{m}{sc}{<->ssub*mc/m/n}{}
\DeclareFontShape{\kenc@JTn}{mc}{m}{sl}{<->ssub*mc/m/n}{}
\DeclareFontShape{\kenc@JTn}{mc}{bx}{it}{<->ssub*gt/m/n}{}
\DeclareFontShape{\kenc@JTn}{gt}{m}{it}{<->ssub*gt/m/n}{}
\DeclareFontShape{\kenc@JTn}{gt}{bx}{it}{<->ssub*gt/m/n}{}

%% from /usr/local/teTeX/share/texmf/tex/latex/base/ot1cmr.fd
\DeclareFontShape{OT1}{cmr}{m}{n}%
     {%
      <-6>cmr5%
      <6-7>cmr6%
      <7-8>cmr7%
      <8-9>cmr8%
      <9-10>cmr9%
      <10-12>cmr10%
      <12-17>cmr12%
      <17->cmr17%
      }{}
\DeclareFontShape{OT1}{cmr}{m}{sl}%
     {%
      <-9>cmsl8%
      <9-10>cmsl9%
      <10-12>cmsl10%
      <12->cmsl12%
      }{}
\DeclareFontShape{OT1}{cmr}{m}{it}%
     {%
      <-8>cmti7%
      <8-9>cmti8%
      <9-10>cmti9%
      <10-12>cmti10%
      <12->cmti12%
      }{}
\DeclareFontShape{OT1}{cmr}{m}{sc}%
     {%
      <->cmcsc10%
      }{}
\DeclareFontShape{OT1}{cmr}{m}{ui}
     {%
      <->cmu10%
      }{}
\DeclareFontShape{OT1}{cmr}{b}{n}
     {%
      <->cmb10%
      }{}
\DeclareFontShape{OT1}{cmr}{bx}{n}
     {%
      <-6>cmbx5%
      <6-7>cmbx6%
      <7-8>cmbx7%
      <8-9>cmbx8%
      <9-10>cmbx9%
      <10-12>cmbx10%
      <12->cmbx12%
      }{}
\DeclareFontShape{OT1}{cmr}{bx}{sl}
     {%
      <->cmbxsl10%
      }{}
\DeclareFontShape{OT1}{cmr}{bx}{it}
     {%
      <->cmbxti10%
      }{}
\DeclareFontShape{OT1}{cmr}{bx}{ui}
     {%
      <->sub*cmr/m/ui
      }{}

%%%%%%
%% /usr/local/teTeX/share/texmf-dist/tex/latex/base/ot1cmtt.fd
% \DeclareFontFamily{OT1}{cmtt}{\hyphenchar \font\m@ne}
\DeclareFontShape{OT1}{cmtt}{m}{n}%
     {%
      <5><6><7><8>cmtt8<9>cmtt9%
      <10><10.95>cmtt10%
      <12><14.4><17.28><20.74><24.88>cmtt12%
      <->cmtt10%
      }{}
%%%%%% make sure subst shapes are available
\DeclareFontShape{OT1}{cmtt}{m}{it}
     {%
      <5><6><7><8><9>%
      <10><10.95><12><14.4><17.28><20.74><24.88>cmitt10%
      <->cmitt10%
      }{}
\DeclareFontShape{OT1}{cmtt}{m}{sl}
     {%
      <5><6><7><8><9>%
      <10><10.95><12><14.4><17.28><20.74><24.88>cmsltt10%
      <->cmsltt10%
      }{}
\DeclareFontShape{OT1}{cmtt}{m}{sc}
     {%
      <5><6><7><8><9>%
      <10><10.95><12><14.4><17.28><20.74><24.88>cmtcsc10%
      <->cmtcsc10%
      }{}

%% from /usr/local/share/texmf/tex/latex/base/omlcmm.fd
% \DeclareFontFamily{OML}{cmm}{\skewchar\font127 }
\DeclareFontShape{OML}{cmm}{m}{it}
    { <5> <6> <7> <8> <9> gen * cmmi
      <10><10.95>cmmi10
%     <12><14.4><17.28><20.74><24.88>cmmi12
      <12->cmmi12
      <->cmmi10
      }{}
\DeclareFontShape{OML}{cmm}{b}{it}{%
      <5> <6> <7> <8> <9> gen * cmmib
%     <10> <10.95> <12> <14.4> <17.28> <20.74> <24.88> cmmib10
      <10-> cmmib10
      <->cmmib10
      }{}
\DeclareFontShape{OML}{cmm}{bx}{it}
   {<-> ssub * cmm/b/it}{}

%% from /usr/local/share/texmf/tex/latex/base/omscmsy.fd
% \DeclareFontFamily{OMS}{cmsy}{\skewchar\font48 }
\DeclareFontShape{OMS}{cmsy}{m}{n}{%
      <5> <6> <7> <8> <9> <10> gen * cmsy
%     <10.95> <12> <14.4> <17.28> <20.74> <24.88> cmsy10
      <10.95-> cmsy10
      <-> cmsy10
      }{}
\DeclareFontShape{OMS}{cmsy}{b}{n}{%
      <5> <6> <7> <8> <9> gen * cmbsy
%     <10> <10.95> <12> <14.4> <17.28> <20.74> <24.88>cmbsy10
      <10-> cmbsy10
      <-> cmbsy10
      }{}

%% from /usr/local/share/texmf/tex/latex/base/ulasy.fd
\DeclareFontFamily{U}{lasy}{}
\DeclareFontShape{U}{lasy}{m}{n}{ <5> <6> <7> <8> <9> gen * lasy
      <10> <10.95> <12> <14.4> <17.28> <20.74> <24.88>lasy10
      <-> lasy10}{}
\DeclareFontShape{U}{lasy}{b}{n}{ <-10> ssub * lasy/m/n
     <10> <10.95> <12> <14.4> <17.28> <20.74> <24.88>lasyb10
      <-> lasyb10}{}

%% from /usr/local/share/texmf/tex/latex/amsfonts/umsa.fd
\DeclareFontFamily{U}{msa}{}
\DeclareFontShape{U}{msa}{m}{n}{
  <5> <6> <7> <8> <9> gen * msam
  <10> <10.95> <12> <14.4> <17.28> <20.74> <24.88> msam10
  <-> msam10
  }{}

%% from /usr/local/share/texmf/tex/latex/amsfonts/umsb.fd
\DeclareFontFamily{U}{msb}{}
\DeclareFontShape{U}{msb}{m}{n}{
  <5> <6> <7> <8> <9> gen * msbm
  <10> <10.95> <12> <14.4> <17.28> <20.74> <24.88> msbm10
  <-> msbm10
  }{}

\xspcode`+=3
\xspcode`\%=3
\xspcode`^^80=3
\xspcode`^^81=3
\xspcode`^^82=3
\xspcode`^^83=3
\xspcode`^^84=3
\xspcode`^^85=3
\xspcode`^^86=3
\xspcode`^^87=3
\xspcode`^^88=3
\xspcode`^^89=3
\xspcode`^^8a=3
\xspcode`^^8b=3
\xspcode`^^8c=3
\xspcode`^^8d=3
\xspcode`^^8e=3
\xspcode`^^8f=3
\xspcode`^^90=3
\xspcode`^^91=3
\xspcode`^^92=3
\xspcode`^^93=3
\xspcode`^^94=3
\xspcode`^^95=3
\xspcode`^^96=3
\xspcode`^^97=3
\xspcode`^^98=3
\xspcode`^^99=3
\xspcode`^^9a=3
\xspcode`^^9b=3
\xspcode`^^9c=3
\xspcode`^^9d=3
\xspcode`^^9e=3
\xspcode`^^9f=3
\xspcode`^^a0=3
\xspcode`^^a1=3
\xspcode`^^a2=3
\xspcode`^^a3=3
\xspcode`^^a4=3
\xspcode`^^a5=3
\xspcode`^^a6=3
\xspcode`^^a7=3
\xspcode`^^a8=3
\xspcode`^^a9=3
\xspcode`^^aa=3
\xspcode`^^ab=3
\xspcode`^^ac=3
\xspcode`^^ad=3
\xspcode`^^ae=3
\xspcode`^^af=3
\xspcode`^^b0=3
\xspcode`^^b1=3
\xspcode`^^b2=3
\xspcode`^^b3=3
\xspcode`^^b4=3
\xspcode`^^b5=3
\xspcode`^^b6=3
\xspcode`^^b7=3
\xspcode`^^b8=3
\xspcode`^^b9=3
\xspcode`^^ba=3
\xspcode`^^bb=3
\xspcode`^^bc=3
\xspcode`^^bd=3
\xspcode`^^be=3
\xspcode`^^bf=3
\xspcode`^^c0=3
\xspcode`^^c1=3
\xspcode`^^c2=3
\xspcode`^^c3=3
\xspcode`^^c4=3
\xspcode`^^c5=3
\xspcode`^^c6=3
\xspcode`^^c7=3
\xspcode`^^c8=3
\xspcode`^^c9=3
\xspcode`^^ca=3
\xspcode`^^cb=3
\xspcode`^^cc=3
\xspcode`^^cd=3
\xspcode`^^ce=3
\xspcode`^^cf=3
\xspcode`^^d0=3
\xspcode`^^d1=3
\xspcode`^^d2=3
\xspcode`^^d3=3
\xspcode`^^d4=3
\xspcode`^^d5=3
\xspcode`^^d6=3
\xspcode`^^d7=3
\xspcode`^^d8=3
\xspcode`^^d9=3
\xspcode`^^da=3
\xspcode`^^db=3
\xspcode`^^dc=3
\xspcode`^^dd=3
\xspcode`^^de=3
\xspcode`^^df=3
\xspcode`^^e0=3
\xspcode`^^e1=3
\xspcode`^^e2=3
\xspcode`^^e3=3
\xspcode`^^e4=3
\xspcode`^^e5=3
\xspcode`^^e6=3
\xspcode`^^e7=3
\xspcode`^^e8=3
\xspcode`^^e9=3
\xspcode`^^ea=3
\xspcode`^^eb=3
\xspcode`^^ec=3
\xspcode`^^ed=3
\xspcode`^^ee=3
\xspcode`^^ef=3
\xspcode`^^f0=3
\xspcode`^^f1=3
\xspcode`^^f2=3
\xspcode`^^f3=3
\xspcode`^^f4=3
\xspcode`^^f5=3
\xspcode`^^f6=3
\xspcode`^^f7=3
\xspcode`^^f8=3
\xspcode`^^f9=3
\xspcode`^^fa=3
\xspcode`^^fb=3
\xspcode`^^fc=3
\xspcode`^^fd=3
\xspcode`^^fe=3
\xspcode`^^ff=3


 \renewcommand{\normalsize}{%
  \@setfontsize\normalsize\@ixpt{20.5\@Q}%
  \kanjiskip\z@ \@plus .1zw \@minus .05zw
  \abovedisplayskip 9\p@ \@plus 3\p@ \@minus 4\p@
  \abovedisplayshortskip \z@ \@plus 2.5\p@
  \belowdisplayshortskip 5\p@ \@plus 2\p@ \@minus 2\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}
 \normalsize
 \setbox0\hbox{\char\euc"A1A1}% "
 \setlength\Cht{\ht0}
 \setlength\Cdp{\dp0}
 \setlength\Cwd{\wd0}
 \setlength\Cvs{\baselineskip}
 \setlength\Chs{\wd0}

 \newcommand{\small}{%
  \@setfontsize\small\@viiipt{18\@Q}%
  \kanjiskip\z@ \@plus .1zw \@minus .05zw
  \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
  \abovedisplayshortskip \z@ \@plus\p@
  \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
  \def\@listi{\leftmargin\leftmargini
              \topsep 3\p@ \@plus \p@ \@minus \p@
              \parsep 1\p@ \@plus \p@ \@minus \p@
              \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip}

 \newcommand{\footnotesize}{%
  \@setfontsize\footnotesize\@viipt{16\@Q}%
  \kanjiskip\z@ \@plus .1zw \@minus .05zw
  \abovedisplayskip 5\p@ \@plus 1.5\p@ \@minus 3\p@
  \abovedisplayshortskip \z@ \@plus\p@
  \belowdisplayshortskip 2.5\p@ \@plus \p@ \@minus 1.5\p@
  \def\@listi{\leftmargin\leftmargini
              \topsep 2\p@ \@plus\p@ \@minus\p@
              \parsep 1\p@ \@plus\p@ \@minus\p@
              \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip}

 \newcommand{\scriptsize}{\@setfontsize\scriptsize\@vipt\@viiipt}
 \newcommand{\tiny}{\@setfontsize\tiny\@vpt\@vipt}
 \newcommand{\large}{\@setfontsize\large\@xpt{22\@Q}}
 \newcommand{\Large}{\@setfontsize\Large\@xipt{27\@Q}}
 \newcommand{\LARGE}{\@setfontsize\LARGE\@xiipt{33\@Q}}
 \newcommand{\huge}{\@setfontsize\huge\@xivpt{25}}
 \newcommand{\Huge}{\@setfontsize\Huge\@xviipt{30}}

  \newcommand{\Small}{\@setfontsize\Small\@viiipt{16\@Q}%
   \kanjiskip\z@ \@plus .1zw \@minus .05zw
  }

 \headheight 12\@Q %% 11H
 \headsep    6.25mm
 %\headheight \z@
 %\headsep    \z@
 \topskip    1\Cht
 \footskip   9.5mm
 \maxdepth .5\topskip
 \if@enable@uptex
  \textwidth 57\Cwd %（a4で左右15mmくらいの余白をとる）
 \else
  \textwidth 58\Cwd %（a4で左右15mmくらいの余白をとる）
 \fi
 %\@settopoint\textwidth
 \textheight 49\Cvs
 \advance \textheight \topskip
 \advance \textheight .15mm
 %\@settopoint\textheight

\if@twocolumn
  \setlength\marginparsep{5mm}
\else
  \setlength\marginparsep{5mm}
\fi
\setlength\marginparpush{5pt}

%\iftombow
\topmargin\paperheight
\advance \topmargin -\textheight
\advance \topmargin -\headheight
\advance \topmargin -\headsep
\advance \topmargin -\footskip
\divide \topmargin \tw@
\advance \topmargin -1.25mm
\advance \topmargin -1in
%\@settopoint\topmargin
\oddsidemargin\paperwidth
\advance \oddsidemargin -\textwidth
\divide \oddsidemargin \tw@
\advance \oddsidemargin -1in
%\@settopoint\oddsidemargin
\evensidemargin\oddsidemargin
%\@settopoint\evensidemargin
%\fi

\marginparwidth 20mm
%\@settopoint\marginparwidth

 \setlength\footnotesep{2.8mm}
\setlength{\skip\footins}{1\Cvs plus .9\Cvs \@minus .3\Cvs}
\setlength\intextsep   {1\Cvs \@plus .75\Cvs \@minus .25\Cvs}
\setlength\floatsep    {1\Cvs \@plus .75\Cvs \@minus .25\Cvs}
\setlength\dblfloatsep {1\Cvs \@plus .75\Cvs \@minus .25\Cvs}
\setlength\textfloatsep{1.5\Cvs \@plus .75\Cvs \@minus .25\Cvs}
\setlength\dbltextfloatsep{1.5\Cvs \@plus .75\Cvs \@minus .25\Cvs}

\setlength\@fptop{0\p@ \@plus 1fil}
\setlength\@fpsep{8\p@ \@plus 2fil}
\setlength\@fpbot{0\p@ \@plus 1fil}
\setlength\@dblfptop{0\p@ \@plus 1fil}
\setlength\@dblfpsep{8\p@ \@plus 2fil}
\setlength\@dblfpbot{0\p@ \@plus 1fil}
\setlength\partopsep{2\p@ \@plus 1\p@ \@minus 1\p@}

\def\@listi{\leftmargin\leftmargini
  \parsep  4\p@ \@plus2\p@ \@minus\p@
  \topsep  8\p@ \@plus2\p@ \@minus4\p@
  \itemsep 4\p@ \@plus2\p@ \@minus\p@}
\let\@listI\@listi
\@listi
\def\@listii{\leftmargin\leftmarginii
   \labelwidth\leftmarginii \advance\labelwidth-\labelsep
   \topsep\z@ \@plus\p@ \@minus\p@
   \parsep\z@ \@plus\p@ \@minus\p@
   \itemsep\parsep}
\def\@listiii{\leftmargin\leftmarginiii
   \labelwidth\leftmarginiii \advance\labelwidth-\labelsep
   \topsep\z@ \@plus\p@ \@minus\p@
   \parsep\z@
   \partopsep\z@ \@plus\z@ \@minus\p@
   \itemsep\topsep}
\def\@listiv {\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep}
\def\@listv  {\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep}
\def\@listvi {\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep}

 \columnsep 2zw
\columnseprule 0\p@
\lineskip 2\p@ 
\normallineskip 2\p@
\renewcommand{\baselinestretch}{}
\parskip\z@    %% 0\p@ \@plus \p@
\parindent 1zw %% 1\Cwd

\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{6}
\setcounter{bottomnumber}{5}
\setcounter{totalnumber}{11}
\setcounter{dbltopnumber}{5}
\renewcommand{\topfraction}{.95}
\renewcommand{\bottomfraction}{.95}
\renewcommand{\textfraction}{.05}
\renewcommand{\floatpagefraction}{.05}
\renewcommand{\dbltopfraction}{.95}
\renewcommand{\dblfloatpagefraction}{.05}

 \let\@Rtop\relax\let\@Ltop\relax\let\@Rbot\relax\let\@Lbot\relax



\def\FiscalYear#1{%
 \gdef\@FiscalYear{#1}%
}

\def\@FiscalYear{}

\if@midterm
  \def\hd@type{中間発表}
  \def\@ProceedingsOf{\@FiscalYear　北九州工業高等専門学校　電子制御工学科　卒業研究　中間発表要旨集}
\else
  \def\hd@type{卒業論文}
  \def\@ProceedingsOf{\@FiscalYear　北九州工業高等専門学校　電子制御工学科　卒業研究　論文集}
\fi

\def\Sissue#1{\gdef\@Sissue{#1}}
\def\@Sissue{}


\let\head@font\relax
\DeclareFixedFont{\KFfoot}{\kenc@JYn}{gt}{m}{n}{10\@JQ}
\def\foot@font{\Small\sffamily\KFfoot}
\def\nombre@font{\Small\sffamily}
%% P (paper)
\def\t@typefont@P{%
 \Huge\baselineskip\z@ %% 24\@JQ
}
%% L (letter)
\let\t@typefont@L\huge
\def\head@type#1{
  {\t@typefont@L #1}%
}


\def\ps@IEICEJ{\let\@mkboth\@gobbletwo
 \def\@oddfoot{\@Lbot\hfil
  {\nombre@font \thepage}
  \hfil\@Rbot}%
 \def\@evenfoot{\@Lbot\hfil
  {\nombre@font \thepage}
  \hfil\@Rbot}
 \def\@oddhead{\@Ltop
  \rlap{\hbox to \textwidth{\smash{\rule[-1.75mm]{\textwidth}{0.25mm}}}}
   {\Small\head@font \@ProceedingsOf}\hfil%
  \@Rtop}%

 \def\@evenhead{\@Ltop
  \rlap{\hbox to \textwidth{\smash{\rule[-1.75mm]{\textwidth}{0.25mm}}}}\hfil%
  \odd@header
  \@Rtop}%
}




\def\odd@header{%
   \setbox\@tempboxb\hbox{\Small\head@font\def\\{\unskip\ignorespaces}%
   \hd@type ／\kern\z@\hd@title}%
    \ifdim \wd\@tempboxb > \textwidth
     \ieicej@warning{header is too long. make it shorter. 
      ^^J\@spaces For example, \string\title[header title]{title}}%
    \fi
   \box\@tempboxb
}




\def\ps@empty{%
 \def\@oddhead{\@Ltop\hfil\@Rtop}%
 \let\@evenhead\@oddhead
 \def\@oddfoot{\@Lbot\hfil\@Rbot}%
 \let\@evenfoot\@oddfoot
 \let\@mkboth\@gobbletwo
}

 \def\ps@plain{\let\@mkboth\@gobbletwo
   \let\ps@jpl@in\ps@plain

 \def\@oddhead{\@Ltop
  \rlap{\hbox to \textwidth{\smash{\rule[-1.75mm]{\textwidth}{0.25mm}}}}
   {\Small\head@font \@ProceedingsOf}\hfil%
  \@Rtop}%


   %\def\@oddhead{\@Ltop\hfil\@Rtop}%
   \def\@oddfoot{\@Lbot\hfil {\nombre@font \thepage} \hfil\@Rbot}% \hfil
   \let\@evenhead\@oddhead
   \let\@evenfoot\@oddfoot}

\def\jtitle{\@ifnextchar[% ]
 {\d@jtitle}{\s@jtitle}}
\def\d@jtitle[#1]#2{\gdef\hd@title{#1}\gdef\@jtitle{#2}}
\def\s@jtitle#1{\gdef\hd@title{#1}\gdef\@jtitle{#1}}
\def\@jtitle{}
\def\hd@title{}

\def\etitle#1{\gdef\@etitle{#1}}
\def\@etitle{}

\def\@fnsymbol#1{\ifcase#1 \or % \ensuremath{
 \dagger\or
 {\dagger}{\dagger}\or
 {\dagger}{\dagger}{\dagger}\or
 {\dagger}{\dagger}{\dagger}{\dagger}\or
 {\dagger}{\dagger}{\dagger}{\dagger}{\dagger}\or
 {\dagger}{\dagger}{\dagger}{\dagger}{\dagger}{\dagger}\or
 {\dagger}{\dagger}{\dagger}{\dagger}{\dagger}{\dagger}{\dagger}\or
 {\dagger}{\dagger}{\dagger}{\dagger}{\dagger}{\dagger}{\dagger}{\dagger}\or
 {\dagger}{\dagger}{\dagger}{\dagger}{\dagger}{\dagger}%
  {\dagger}{\dagger}{\dagger}\or
 *\or {*}{*}\or {*}{*}{*}\or {*}{*}{*}{*}\or 
  {*}{*}{*}{*}{*}\or {*}{*}{*}{*}{*}{*}\or %% ((((((((((((((((((((
 a)\or b)\or c)\or d)\or e)\or f)\or g)\or h)\or i)\or j)\or
 k)\or l)\or m)\or n)\or o)\or p)\or q)\or r)\or s)\or t)\else
  \@ctrerr\fi}% }
%% mathTimePlus redefines \@fnsymbol. 
\let\ieicej@fnsymbol\@fnsymbol

\newtoks\@authorlist
\newcount\@authorcnt
\newcount\@alcnt
\newcount\p@alcnt
 \p@alcnt=9\relax
\newcount\@totalnumber
\newdimen\authornamesep
 \authornamesep\z@
%% \authornamesep1zw

\def\authorlist#1{%
\if@thesis
\@authorlist={#1}\the\@authorlist
\else
\fi
}

\def\authorentry{\@ifnextchar[% ]
 {\TR@ae}{\N@ae}}

\def\N@ae#1#2#3{\@ifnextchar[% ]
 {\@aeP{#1}{#2}{#3}}%
 {\@ae{#1}{#2}{#3}}}

\def\TR@ae[#1]#2#3#4{\@ifnextchar[% ]
 {\TR@aeP[#1]{#2}{#3}{#4}}%
 {\TR@aeNP[#1]{#2}{#3}}}





\def\fmt@Jan#1#2{%
 \expandafter\def\csname EICMN@name\number\@authorcnt\endcsname{#1 #2}%
 \setbox\@tempboxb\hbox{\spaceskip=100mm #1 #2}%
 \ifdim \wd\@tempboxb < 100mm
  \ieicej@warning{Author's name "#1" doesn't have a space}%
  \def\@tempname{#1}%
  \def\@tempb##1\@nil{##1}%
  \protected@edef\@authorname{\expandafter\@tempb\@tempname \@nil}%
 \else
  \setbox\@tempboxb\hbox{#1}%
  \ifdim \wd\@tempboxb > 7zw
   \def\@tempb##1 ##2\@nil{##1\hskip\authornamesep ##2}%
  \else
   \def\@tempb##1 ##2\@nil{\leavevmode\hbox to 7zw{##1\hfil ##2}}%
  \fi
   \def\@tempname{#1 #2}%
   \protected@edef\@authorname{\expandafter\@tempb\@tempname \@nil}%
 \fi
}

\def\TR@aeNP[#1]#2#3{%
 \@tempcnta\z@
 \advance \@authorcnt \@ne
 \def\al@none{0}%
 \fmt@Jan{#2}{#3}%
 \expandafter\protected@xdef\csname @Jauthorname\number\@authorcnt\endcsname{%
  \@authorname\kern\z@（指導教員　#1）
 }
 \global\@totalnumber=\@authorcnt
}


\newcount\@spcnt
\newcount\alignorder
 \alignorder=5\relax

\def\fmt@Jauthorlist{%
 \@tempcnta=\alignorder
 \@tempcntb=\alignorder\advance \@tempcntb \@ne
  \ifnum \@totalnumber < \@tempcntb
   \expandafter\def\csname sp\number\alignorder\endcsname{\relax}%
  \else
   \advance \@tempcntb \alignorder
   \ifnum \@totalnumber < \@tempcntb
    \expandafter\def\csname sp\number\alignorder\endcsname{\cr}%
     \advance \@tempcnta \alignorder
    \expandafter\def\csname sp\number\@tempcnta\endcsname{\relax}%
   \else
    \advance \@tempcntb \alignorder
    \ifnum \@totalnumber < \@tempcntb
     \expandafter\def\csname sp\number\alignorder\endcsname{\cr}%
      \advance \@tempcnta \alignorder
     \expandafter\def\csname sp\number\@tempcnta\endcsname{\cr}%
      \advance \@tempcnta \alignorder
     \expandafter\def\csname sp\number\@tempcnta\endcsname{\relax}%
    \else
     \advance \@tempcntb \alignorder
     \ifnum \@totalnumber < \@tempcntb
      \expandafter\def\csname sp\number\alignorder\endcsname{\cr}%
	\advance \@tempcnta \alignorder
      \expandafter\def\csname sp\number\@tempcnta\endcsname{\cr}%
	\advance \@tempcnta \alignorder
      \expandafter\def\csname sp\number\@tempcnta\endcsname{\cr}%
	\advance \@tempcnta \alignorder
      \expandafter\def\csname sp\number\@tempcnta\endcsname{\relax}%
     \else
      \advance \@tempcntb \alignorder
      \ifnum \@totalnumber < \@tempcntb
	\expandafter\def\csname sp\number\alignorder\endcsname{\cr}%
	 \advance \@tempcnta \alignorder
	\expandafter\def\csname sp\number\@tempcnta\endcsname{\cr}%
	 \advance \@tempcnta \alignorder
	\expandafter\def\csname sp\number\@tempcnta\endcsname{\cr}%
	 \advance \@tempcnta \alignorder
	\expandafter\def\csname sp\number\@tempcnta\endcsname{\cr}%
	 \advance \@tempcnta \alignorder
	\expandafter\def\csname sp\number\@tempcnta\endcsname{\relax}%
      \else
	\advance \@tempcntb \alignorder
	\ifnum \@totalnumber < \@tempcntb
	 \expandafter\def\csname sp\number\alignorder\endcsname{\cr}%
	  \advance \@tempcnta \alignorder
	 \expandafter\def\csname sp\number\@tempcnta\endcsname{\cr}%
	  \advance \@tempcnta \alignorder
	 \expandafter\def\csname sp\number\@tempcnta\endcsname{\cr}%
	  \advance \@tempcnta \alignorder
	 \expandafter\def\csname sp\number\@tempcnta\endcsname{\cr}%
	  \advance \@tempcnta \alignorder
	 \expandafter\def\csname sp\number\@tempcnta\endcsname{\cr}%
	  \advance \@tempcnta \alignorder
	 \expandafter\def\csname sp\number\@tempcnta\endcsname{\relax}%
	\else
	 \advance \@tempcntb \alignorder
	 \expandafter\def\csname sp\number\alignorder\endcsname{\cr}%
	  \advance \@tempcnta \alignorder
	 \expandafter\def\csname sp\number\@tempcnta\endcsname{\cr}%
	  \advance \@tempcnta \alignorder
	 \expandafter\def\csname sp\number\@tempcnta\endcsname{\cr}%
	  \advance \@tempcnta \alignorder
	 \expandafter\def\csname sp\number\@tempcnta\endcsname{\cr}%
	  \advance \@tempcnta \alignorder
	 \expandafter\def\csname sp\number\@tempcnta\endcsname{\cr}%
	  \advance \@tempcnta \alignorder
	 \expandafter\def\csname sp\number\@tempcnta\endcsname{\cr}%
	  \advance \@tempcnta \alignorder
	 \expandafter\def\csname sp\number\@tempcnta\endcsname{\cr}%
	\fi
      \fi
     \fi
    \fi
   \fi
  \fi
}

 \def\@outputJauthorlist{%
  \fmt@Jauthorlist
  \@authorcnt\z@
   \loop\ifnum \@authorcnt < \@totalnumber
    \advance \@authorcnt \@ne
    \advance \@spcnt \@ne
    \@ifundefined{sp\number\@spcnt}%
     {\expandafter\def\csname sp\number\@spcnt\endcsname{\hskip\Pauthorsep}}{}%
    \let\cr\@par
    \protected@xdef\@tempx{\@tempx
     \mbox{\csname @Jauthorname\number\@authorcnt\endcsname}%
      \csname sp\number\@spcnt\endcsname}%
   \repeat
  \@tempx
 }

\def\@tempx{}

\def\breakauthorline#1{%
 \@for\@breakauthor:=#1\do{%
  \expandafter\gdef\csname @breakauthorline\@breakauthor\endcsname{\\}
 }%
  \@authorcnt\z@
  \loop\ifnum \@authorcnt < \@totalnumber
   \advance \@authorcnt \@ne
    \@ifundefined{@breakauthorline\number\@authorcnt}%
    {\expandafter\gdef\csname @breakauthorline\number\@authorcnt\endcsname
     {\relax}}{\relax}%
  \repeat
}

\newcount\totalnumberm@ne



\def\Jorganization#1{#1}
\def\Jdepartment#1{#1}
\def\Jaddress#1{#1}

\def\Edepartment#1{#1}
\def\Eorganization#1{#1}
\let\Eaddress\Jaddress

\newcount\chk@alcnt
\newcount\chk@p@alcnt

\newbox\eabstractbox
\newbox\ekeywordbox
\def\eabstract{\global\setbox\eabstractbox=\hbox\bgroup
  \large
  {\bfseries Abstract\hskip1zw}\ignorespaces}
\def\endeabstract{\egroup}

\def\ekeyword{\global\setbox\ekeywordbox=\hbox\bgroup
  \large
  {\bfseries Key words\hskip1zw}\ignorespaces}
\def\endekeyword{\egroup}

\newdimen\Pauthorsep
 \Pauthorsep 7.5mm % 15Qx2zw

\def\titlepagebaselinestretch#1{\gdef\@titlepagebaselinestretch{#1}}
\titlepagebaselinestretch{1}

\def\jsubtitle#1{\gdef\@jsubtitle{#1}}
\def\@jsubtitle{}
\def\esubtitle#1{\gdef\@esubtitle{#1}}
\def\@esubtitle{}





 \def\maketitle{\par

   \thispagestyle{plain}
  \begingroup 
  \ifnum \chk@alcnt < \@alcnt
    \ieicej@warning{information of \string\affiliate\space is not assigned}%
   \fi
   \advance \p@alcnt -9\relax
   \ifnum \chk@p@alcnt < \p@alcnt
    \ieicej@warning{information of \string\paffiliate\space is not assigned}%
   \fi
   \def\@fnsymbol##1{\ifcase##1 \or
    \dag\or
    \dag\dag\or
    \dag\dag\dag\or
    \dag\dag\dag\dag\or
    \dag\dag\dag\dag\dag\or
    \dag\dag\dag\dag\dag\dag\or
    \dag\dag\dag\dag\dag\dag\dag\or
    \dag\dag\dag\dag\dag\dag\dag\dag\or
    \dag\dag\dag\dag\dag\dag\dag\dag\dag\or
    *\or {*}{*}\or {*}{*}{*}\or {*}{*}{*}{*}\or {*}{*}{*}{*}{*}\or
     {*}{*}{*}{*}{*}{*}\else\@ctrerr\fi\relax}%
   \def\thefootnote{\fnsymbol{footnote}}%
   \if@twocolumn
    \twocolumn[\@maketitle]%
   \else
    \ieicej@warning{I don't recommend onecolumn option,
      ^^J\space\space because of no compatibility with thesis option}%
    \@maketitle
   \fi
  \endgroup
   \let\maketitle\relax
   \let\@maketitle\relax
   \gdef\@affiliate{}\gdef\p@affiliate{}
   \gdef\@jtitle{}\gdef\@etitle{}
   \gdef\@jsubtitle{}\gdef\@esubtitle{}
   \let\affiliate\relax\let\paffiliate\relax
   \@authorlist={}%
   \let\jkeyword\relax\let\jabstract\relax
   \let\ekeyword\relax\let\eabstract\relax
   \let\@outputJauthorlist\relax\let\@outputEauthorlist\relax
   \let\@aeP\relax
   \let\@ae\relax
   \let\TR@ae\relax
   \let\N@ae\relax
   \let\TR@aeP\relax
   \let\TR@aeNP\relax
   \let\breakauthorline\relax
   \@authorcnt \z@
   \loop\ifnum \the\@authorcnt < \the\@totalnumber
    \advance \@authorcnt \@ne
     \expandafter\let\csname @Jauthorname\number\@authorcnt\endcsname\relax
     %\expandafter\let\csname @Eauthorname\number\@authorcnt\endcsname\relax
   \repeat
 }


%% タイトルのレイアウト

 \def\@maketitle{%
  \setbox\@tempboxa\vbox{%
   \centering
   \begin{minipage}{137.5mm}
    \def\baselinestretch{\@titlepagebaselinestretch}%
    \hskip8mm
    \vskip\baselineskip
    \bgroup
     \centering
     {\fontsize{16}{23}\selectfont\bfseries
      \@jtitle\par
     }%
     \vskip.25\baselineskip
     \ifx\@jsubtitle\empty
     \else
      {\huge
       \@jsubtitle\par
      }%
      \vskip.25\baselineskip
     \fi
     {\fontsize{16}{23}\selectfont\bfseries
      \@etitle\par
     }%
     \vskip.25\baselineskip
     \ifx\@esubtitle\empty
     \else
      {\huge
       \@esubtitle\par
      }%
      \vskip.25\baselineskip
     \fi
     {\LARGE
       \@outputJauthorlist\par
     }%
     \vskip.5\baselineskip

     \vskip.25\baselineskip
     \hfill\box\jabstractbox\par
     \vskip\baselineskip
     \hfill\box\jkeywordbox
     \vskip\baselineskip
    \egroup
 %%
%    \vskip1.5\baselineskip
%    \bgroup
%     \centering
%     {\fontsize{16}{23}\selectfont
%      \@etitle\par
%     }%
%     \vskip.25\baselineskip
%     \ifx\@esubtitle\empty
%     \else
%      {\huge
%       \@esubtitle\par
%      }%
%      \vskip.25\baselineskip
%     \fi
%     {\LARGE
%      \hyphenpenalty=10000\relax
%      \@outputEauthorlist\par
%     }%
%    \egroup
%    \bgroup\large
%     \leavevmode \unhbox\eabstractbox\par
%     \nointerlineskip
%     \vskip\baselineskip
%     \vskip-1zh
%     \vskip0pt
%     \leavevmode \unhbox\ekeywordbox
%    \egroup
    \vskip\baselineskip

   \end{minipage}%

  }%
  \@tempdima\ht\@tempboxa
  \advance \@tempdima \dp\@tempboxa
  \ifdim \@tempdima>\textheight
   \ieicej@warning{The title page is too high. 
      ^^J\space\space You can adjust the height of a title page
      ^^J\space\space by changing \string\titlepagebaselinestretch\space 
		      in preamble.
      ^^J\space\space For example, \string\titlepagebaselinestretch{0.9}}%
   {\parindent\z@
    \vtop to \z@{%
     \vbox to \textheight{%
      \unvbox\@tempboxa
     }\vss
    }%
   }\par
   \clearpage
  \else
   \divide \@tempdima \Cvs
   \@tempcnta=\@tempdima
   \advance \@tempcnta \@ne
   \vbox to \@tempcnta\Cvs{%
    \box\@tempboxa\vss
   }%
  \fi
 }

 \newbox\jabstractbox
 \newbox\jkeywordbox

 \def\jabstract{\global\setbox\jabstractbox\hbox\bgroup
 \begin{minipage}[t]{137.5mm}
 \Small{\bfseries 概要：
 }\ignorespaces}
 \def\endjabstract{\end{minipage}\egroup}

\def\jkeyword{\global\setbox\jkeywordbox\hbox\bgroup
 \begin{minipage}[t]{137.5mm}
 \Small{\bfseries キーワード：}\ignorespaces}
 \def\endjkeyword{\end{minipage}\egroup}



% \def\jabstract{\global\setbox\jabstractbox\hbox\bgroup
%   \large
%   {\bfseries 概要：\hskip1zw}\ignorespaces}
%   \def\endjabstract{\egroup}

% \def\jkeyword{\global\setbox\jkeywordbox\hbox\bgroup
%   \large
%   {\bfseries キーワード：\hskip1zw}\ignorespaces}
% \def\endjkeyword{\egroup}



 \let\abstract\jabstract
 \let\endabstract\endjabstract
 \let\keyword\jkeyword
 \let\endkeyword\endjkeyword


\setcounter{secnumdepth}{5}
\newcounter{section}
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]
\newcounter{subparagraph}[paragraph]
\renewcommand{\thesection}{\@arabic\c@section.}
\renewcommand{\thesubsection}{\thesection\,\@arabic\c@subsection}
\renewcommand{\thesubsubsection}{%
   \thesubsection.\,\@arabic\c@subsubsection}
\renewcommand{\theparagraph}{% (
 \@alph\c@paragraph\,)}
\renewcommand{\thesubparagraph}{% (
 \@roman\c@subparagraph\,)}

\def\@afterheading{%
 \global\@nobreaktrue
 \everypar{%
  \if@nobreak
   \global\@nobreakfalse
   \clubpenalty \z@
    \if@afterindent
    \else
     {\setbox\z@=\lastbox}%
    \fi
  \else
   \clubpenalty\@clubpenalty
   \everypar{}%
  \fi}%
}

%% \@startsection{NAME}{LEVEL}{INDENT}{BEFORESKIP}{AFTERSKIP}{STYLE}
\def\@startsection#1#2#3#4#5#6{\if@noskipsec \leavevmode \fi
  \par \@tempskipa #4\relax
  \@afterindenttrue
  \ifdim \@tempskipa <\z@ \@tempskipa -\@tempskipa \@afterindentfalse\fi
  \if@nobreak
   \everypar{}%
  \else
   %\addpenalty\@secpenalty
  \fi
  \ifdim\@tempskipa>\z@
   \vskip-\prevdepth \prevdepth\z@
   \vskip\Cvs
   \advance\@tempskipa-\Cvs
   \vspace*{\@tempskipa}%
  \fi
 \@ifstar{\@ssect{#3}{#4}{#5}{#6}}{\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}}

%% \@sect{NAME}{LEVEL}{INDENT}{BEFORESKIP}{AFTERSKIP}{STYLE}[ARG1]{ARG2}
\def\@sect#1#2#3#4#5#6[#7]#8{%%
 \ifnum #2>\c@secnumdepth
  \let\@svsec\@empty
 \else
  \refstepcounter{#1}%
  \protected@edef\@svsec{\@seccntformat{#1}\relax}%
 \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa<\z@
   \def\@svsechd{%
     #6{\hskip #3\relax
     \@svsec #8}}%
  \else
   \begingroup
    #6{%
      \@hangfrom{\hskip #3\relax{\csname #2@font\endcsname \@svsec}}%
       \interlinepenalty\@M \@secjidori{#8}\@@par
      }%
   \endgroup
  \fi
 \@xsect{#5}}

%% \@ssect{INDENT}{BEFORESKIP}{AFTERSKIP}{STYLE}{ARG} ==
\def\@ssect#1#2#3#4#5{%
 \@tempskipa #3\relax
 \ifdim \@tempskipa<\z@
  \def\@svsechd{#4{\hskip #1\relax #5}}%
 \else
  \begingroup
   #4{%
    \@hangfrom{\hskip #1}%
     \interlinepenalty\@M \@secjidori{#5}\@@par
     }%
  \endgroup
 \fi
 \@xsect{#3}}

\def\@xsect#1{%
  \@tempskipa #1\relax
  \ifdim \@tempskipa<\z@
    \@nobreakfalse
    \global\@noskipsectrue
    \everypar{%
      \if@noskipsec
        \global\@noskipsecfalse
       {\setbox\z@\lastbox}%
        \clubpenalty\@M
        \begingroup \@svsechd \endgroup
        \unskip
        \@tempskipa #1\relax
        \hskip -\@tempskipa
        \pagebreak[2]%
      \else
        \clubpenalty \@clubpenalty
        \everypar{}%
      \fi}%
  \else
    \par \nobreak
    \vskip \@tempskipa
    \@afterheading
  \fi
  \ignorespaces}

\def\@secjidori#1{%
 \def\@tempfn{}%
 \def\@tempfncnt{}%
 \bgroup
  \def\footnote{\@ifnextchar[% ]
   {\@ignorefn}{\@ignorefn[]}}%
  \long\def\@ignorefn[##1]##2{\gdef\@tempfncnt{##1}\gdef\@tempfn{##2}}%
  \global\setbox\@tempboxb\hbox{\inhibitglue #1}%
 \egroup
  \ifdim \wd\@tempboxb>4.5zw
   \leavevmode\inhibitglue #1%
  \else
   \def\@makefnmark{\smash{\kern0pt\hbox to \z@{%
    $^{\mbox{\tiny \kern-.5zw （注\@thefnmark{}）\kern-.5zw}}$\hss}}}%
   \kanjiskip\z@ \@plus 1fill \@minus 1fill\xkanjiskip=\kanjiskip
   \hbox to 5zw{\inhibitglue #1\hfil}%
   \ifx\@tempfn\empty\else
    \ifx\@tempfncnt\empty\footnotetext{\@tempfn}\else
     \footnotetext[\@tempfncnt]{\@tempfn}
    \fi\fi
  \fi
}

\@namedef{3@font}{\bfseries}
\def\@seccntformat#1{\csname the#1\endcsname\hskip1zw}

 \def\sec@font{\bfseries\mathversion{bold}\baselineskip20.5\@Q}

\newcommand{\section}{\@startsection{section}{1}{1zw}%
   {.5\Cvs}% \@plus.1mm \@minus.1mm
   {.5\Cvs}% \@plus.1mm \@minus.1mm
   {\reset@font\Large\sec@font}}
 \newcommand{\subsection}{\@startsection{subsection}{2}{1zw}%
   {\z@}% \@plus.1mm \@minus.1mm
   {\z@}% \@plus.1mm \@minus.1mm
   {\reset@font\normalsize\bfseries\mathversion{bold}}}
 \newcommand{\subsubsection}{\@startsection{subsubsection}{3}{1zw}%
   {\z@}% \@plus.1mm \@minus.1mm
   {\z@}% \@plus.1mm \@minus.1mmu
   {\reset@font\normalsize}}
\newcommand{\paragraph}{\@startsection{paragraph}{4}{1zw}%
   {\z@}% \@plus.1mm \@minus.1mm
   {\z@}% \@plus.1mm \@minus.1mm
   {\reset@font\normalsize}}
\newcommand{\subparagraph}{\@startsection{subparagraph}{5}{1zw}%
   {\z@}% \@plus.1mm \@minus.1mm
   {\z@}% \@plus.1mm \@minus.1mm
   {\reset@font\normalsize}}

\newcommand{\appendix}{\par
 \renewcommand{\section}{\@startsection{section}{1}{\z@}
  {.5\Cvs}% \@plus.1mm \@minus.1mm
  {.5\Cvs}% \@plus.1mm \@minus.1mm
  {\centering\Large\sec@font}}%
 \section*{付録}
  \renewcommand{\section}{\@startsection{section}{1}{1zw}
   {\z@}% \@plus.1mm \@minus.1mm
   {\z@}% \@plus.1mm \@minus.1mm
   {\normalsize\bfseries\mathversion{bold}}}%
 \setcounter{section}{0}%
 \setcounter{subsection}{0}%
 \setcounter{equation}{0}%
 \setcounter{figure}{0}%
 \setcounter{table}{0}%
 \def\theequation{\protect\mbox{A$\cdot$\@arabic\c@equation}}%
 \def\thefigure{A$\cdot$\,\@arabic\c@figure}%
 \def\thetable{A$\cdot$\,\@arabic\c@table}%
}

\if@twocolumn
  \setlength\leftmargini {2zw}%
\else
  \setlength\leftmargini {2zw}%
\fi
\setlength\leftmarginii  {2zw}%
\setlength\leftmarginiii {2zw}%
\setlength\leftmarginiv  {2zw}%
\if@twocolumn
  \setlength\leftmarginv {1zw}%
  \setlength\leftmarginvi{1zw}%
\else
  \setlength\leftmarginv {1zw}%
  \setlength\leftmarginvi{1zw}%
\fi
\setlength  \labelsep  {1zw}%
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty \z@ % -\@lowpenalty
\@endparpenalty   \z@ % -\@lowpenalty
\@itempenalty     \z@ % -\@lowpenalty

%% from latex.ltx
\def\@item[#1]{%
  \if@noparitem
    \@donoparitem
  \else
    \if@inlabel
      \indent \par
    \fi
    \ifhmode
      \unskip\unskip \par
    \fi
    \if@newlist
      \if@nobreak
        \@nbitem
      \else
        \addpenalty\@beginparpenalty
        \addvspace\@topsep
        \addvspace{-\parskip}%
      \fi
    \else
      \addpenalty\@itempenalty
      \addvspace\itemsep
    \fi
    \global\@inlabeltrue
  \fi
  \everypar{%
    \@minipagefalse
    \global\@newlistfalse
    \if@inlabel
      \global\@inlabelfalse
      {\setbox\z@\lastbox
       \ifvoid\z@
         \kern-\itemindent
       \fi}%
      \box\@labels
      \penalty\z@
    \fi
    \if@nobreak
      \@nobreakfalse
      \clubpenalty\z@ % \@M --> \z@
    \else
      \clubpenalty \@clubpenalty
      \everypar{}%
    \fi}%
  \if@noitemarg
    \@noitemargfalse
    \if@nmbrlist
      \refstepcounter\@listctr
    \fi
  \fi
  \sbox\@tempboxa{\makelabel{#1}}%
  \global\setbox\@labels\hbox{%
    \unhbox\@labels
    \hskip \itemindent
    \hskip -\labelwidth
    \hskip -\labelsep
    \ifdim \wd\@tempboxa >\labelwidth
      \box\@tempboxa
    \else
      \hbox to\labelwidth {\unhbox\@tempboxa}%
    \fi
    \hskip \labelsep}%
}

\renewcommand{\theenumi}{\@arabic\c@enumi}
\renewcommand{\theenumii}{\@alph\c@enumii}
\renewcommand{\theenumiii}{\@roman\c@enumiii}
\renewcommand{\theenumiv}{\@Alph\c@enumiv}
\newcommand{\labelenumi}{\kern-.5zw （\,\theenumi\,）\kern-.5zw}
\newcommand{\labelenumii}{\kern-.5zw （\,\theenumii\,）\kern-.5zw}
\newcommand{\labelenumiii}{\theenumiii.}
\newcommand{\labelenumiv}{\theenumiv.}
\renewcommand{\p@enumii}{\theenumi}
\renewcommand{\p@enumiii}{\theenumi(\theenumii)}
\renewcommand{\p@enumiv}{\p@enumiii\theenumiii}

\renewenvironment{enumerate}
  {%
   \ifnum \@enumdepth >3\relax\@toodeep\else
    \advance\@enumdepth\@ne
    \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
    \list{\csname label\@enumctr\endcsname}{%
     \leftmargin\z@
     \labelwidth2zw
     \labelsep1zw
     \itemindent4zw
     \listparindent1zw
     \topsep\z@\parsep\z@\partopsep\z@\itemsep\z@
     %\clubpenalty\z@
     \usecounter{\@enumctr}%
     \def\makelabel##1{\hss\llap{##1}}}%
    \fi}{\endlist}

\newcommand{\labelitemi}{\leavevmode
 \raise.125zh\hbox to 1zw{\hss \textbullet\hss}}
\newcommand{\labelitemii}{{\normalfont\bfseries\textendash}}
\newcommand{\labelitemiii}{\textasteriskcentered}
\newcommand{\labelitemiv}{\textperiodcentered}

\renewenvironment{itemize}
  {%
   \ifnum \@itemdepth >3\relax\@toodeep\else
    \advance\@itemdepth\@ne
    \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
    %%\expandafter
    \list{\csname \@itemitem\endcsname}{%
     \topsep\z@\parsep\z@\partopsep\z@\itemsep\z@
     \leftmargin\z@
     \labelwidth1zw
     \labelsep1zw
     \itemindent3zw
     \listparindent1zw
     %\clubpenalty\z@
     \def\makelabel##1{\hss\llap{##1}}}%
    \fi}{\endlist}

\def\descriptionlabel#1{\hspace\labelsep #1}
\newenvironment{description}{%
 \list{}{%
  \leftmargin\z@
  \labelsep1zw
  \labelwidth\z@
  \itemindent-\leftmargin
  \listparindent1zw
  \topsep\z@\parsep\z@\partopsep\z@\itemsep\z@
  \let\makelabel\descriptionlabel}}{\endlist}

\newskip\@hlskip
\@hlskip.5\Cvs \@plus 1mm \@minus .5mm

\newenvironment{verse}
  {\let\\\@centercr
   \list{}{\itemsep\z@
           \topsep\@hlskip\parsep\z@\partopsep\z@
           \itemindent -1zw
           \listparindent\itemindent
           \rightmargin\leftmargin \advance\leftmargin 1zw}%
           \item\relax}{\endlist}

\newenvironment{quotation}
  {\list{}{\listparindent 1zw
           \itemindent\listparindent
           \rightmargin\leftmargin
           \topsep\@hlskip\parsep\z@\partopsep\z@
           }%
           \item\relax}{\endlist}

\newenvironment{quote}
  {\list{}{%
           \topsep\@hlskip\parsep\z@\partopsep\z@
           \rightmargin\leftmargin}%
           \item\relax}{\endlist}

\gdef\tabbing{\lineskip \z@skip\let\>\@rtab\let\<\@ltab\let\=\@settab
     \let\+\@tabplus\let\-\@tabminus\let\`\@tabrj\let\'\@tablab
     \let\\=\@tabcr
     \@hightab\@firsttab
     \global\@nxttabmar\@firsttab
     \dimen\@firsttab\@totalleftmargin
     \global\@tabpush\z@ \global\@rjfieldfalse
     \topsep\@hlskip \parsep\z@\partopsep\z@
     \trivlist \item\relax
     \if@minipage\else\vskip\parskip\fi
     \setbox\@tabfbox\hbox{%
       \rlap{\hskip\@totalleftmargin\indent\the\everypar}}%
     \def\@itemfudge{\box\@tabfbox}%
     \@startline\ignorespaces}

\newdimen\verbatimleftmargin
  \verbatimleftmargin\z@
\newdimen\verbatimbaselineskip
  \verbatimbaselineskip\Cvs
\def\verbatimsize{\normalsize}

\def\@verbatim{%
 \topsep\z@\partopsep\z@\parsep\z@\itemsep\z@
 \trivlist \item\relax
  \if@minipage\else
   \vskip\baselineskip
   \vskip-\verbatimbaselineskip
  \fi
  \leftskip\@totalleftmargin
  \if@minipage\else
   \advance \leftskip by \verbatimleftmargin
  \fi
  \rightskip\z@skip
  \parindent\z@\parfillskip\@flushglue\parskip\z@skip
  \@@par
  \@tempswafalse
  \def\par{%
    \if@tempswa
      \leavevmode \null \@@par\penalty\interlinepenalty
    \else
      \@tempswatrue
      \ifhmode\@@par\penalty\interlinepenalty\fi
    \fi}%
  \let\do\@makeother \dospecials
  \obeylines 
   \verbatimsize \baselineskip\verbatimbaselineskip
   \ttfamily \@noligs
  \everypar \expandafter{\the\everypar \unpenalty}%
}

%% from latex.ltx
%%  v1.3
\def\@item[#1]{% 
  \if@noparitem
    \@donoparitem
  \else
    \if@inlabel
      \indent \par
    \fi
    \ifhmode
      \unskip\unskip \par
    \fi
    \if@newlist
      \if@nobreak
        \@nbitem
      \else
        \addpenalty\@beginparpenalty
        \addvspace\@topsep
        \addvspace{-\parskip}%
      \fi
    \else
      \addpenalty\@itempenalty
      \addvspace\itemsep
    \fi
    \global\@inlabeltrue
  \fi
  \everypar{%
    \@minipagefalse
    \global\@newlistfalse
    \if@inlabel
      \global\@inlabelfalse
      {\setbox\z@\lastbox
       \ifvoid\z@
         \kern-\itemindent
       \fi}%
      \box\@labels
      \penalty\z@
    \fi
    \if@nobreak
      \@nobreakfalse
      \clubpenalty\z@ %\@M --> \z@ 
    \else
      \clubpenalty \@clubpenalty
      \everypar{}%
    \fi}%
  \if@noitemarg
    \@noitemargfalse
    \if@nmbrlist
      \refstepcounter\@listctr
    \fi
  \fi
  \sbox\@tempboxa{\makelabel{#1}}%
  \global\setbox\@labels\hbox{%
    \unhbox\@labels
    \hskip \itemindent
    \hskip -\labelwidth
    \hskip -\labelsep
    \ifdim \wd\@tempboxa >\labelwidth
      \box\@tempboxa
    \else
      \hbox to\labelwidth {\unhbox\@tempboxa}%
    \fi
    \hskip \labelsep}%
  \ignorespaces\inhibitglue
}

\newcounter{figure}
\renewcommand{\thefigure}{\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure}
\def\fnum@efigure{Fig.\,\thefigure}
\newenvironment{figure}
               {\@floatenv
                \capwidth\hsize\ecapwidth\hsize
                \abovecaptionskip1mm\belowcaptionskip\z@\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@floatenv\capwidth.66\textwidth\ecapwidth.66\textwidth
                \abovecaptionskip1mm\belowcaptionskip\z@\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}
\renewcommand{\thetable}{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename~\thetable}
\def\fnum@etable{Table~\thetable}
\newenvironment{table}
               {\@floatenv
                \capwidth\hsize\ecapwidth\hsize
                \abovecaptionskip\z@\belowcaptionskip3pt\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@floatenv\capwidth.66\textwidth\ecapwidth.66\textwidth
                \abovecaptionskip\z@\belowcaptionskip3pt\@dblfloat{table}}
               {\end@dblfloat}
\def\@floatboxreset {%
        \reset@font
        \small\tabcolsep.5zw
        \@setminipage
}
\def\@floatenv{\let\center\Center}

\def\Center{\topsep\z@\parsep\z@\partopsep\z@\itemsep\z@
 \trivlist \centering\item\relax}
\def\endCenter{\endtrivlist}

\long\def\@caption#1[#2]#3{\par
 \begingroup
  \@parboxrestore
  \if@minipage
   \@setminipage
  \fi
   \small
   \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
 \endgroup}

\newlength\abovecaptionskip
\newlength\belowcaptionskip

\newbox\@tempboxb
\newdimen\capwidth
\newdimen\ecapwidth

\long\def\@makecaption#1#2{%
 \vskip\abovecaptionskip
 \setbox\@tempboxa\hbox{#1\hskip1zw\shortstack[l]{#2}}%
 \@tempdima\ht\@tempboxa \advance \@tempdima \dp\@tempboxa
 \setbox\@tempboxb\hbox{#1\hskip1zw}%
 \ifdim \@tempdima > \baselineskip
  \ifdim \wd\@tempboxa > \capwidth
   \hfil\parbox[t]{\capwidth}{\hangindent\wd\@tempboxb 
    #1\hskip1zw #2}\vskip2\@Q
  \else
   \hfil\parbox[t]{\wd\@tempboxa}{\hangindent\wd\@tempboxb 
    #1\hskip1zw #2}\vskip2\@Q
  \fi
 \else
  \ifdim \wd\@tempboxa > \capwidth
   \hfil\parbox[t]{\capwidth}{\hangindent\wd\@tempboxb 
    #1\hskip1zw #2}\vskip2\@Q
  \else
   \setbox\@tempboxb\hbox{#2}%
   \ifdim \wd\@tempboxb < 4.5zw
    \hbox to\hsize{\hfil #1\hskip1zw\kintou{5zw}{#2}\hfil}%
   \else
    \hbox to\hsize{\hfil\box\@tempboxa\hfil}%
   \fi
  \fi
 \fi
 \vspace{\belowcaptionskip}\par
}

\long\def\ecaption#1{%
 \vspace{-\belowcaptionskip}%
 \small
 \setbox\@tempboxa\hbox{\csname fnum@e\@captype\endcsname\hskip1zw
  \shortstack[l]{#1}}%
 \@tempdima\ht\@tempboxa \advance \@tempdima \dp\@tempboxa
 \setbox\@tempboxb\hbox{\csname fnum@e\@captype\endcsname\hskip1zw}%
 \ifdim \@tempdima > \baselineskip
  \ifdim \wd\@tempboxa > \ecapwidth
   \hfil\parbox[t]{\ecapwidth}{\hangindent\wd\@tempboxb 
    \csname fnum@e\@captype\endcsname\hskip1zw #1}\par
  \else
   \hfil\parbox[t]{\wd\@tempboxa}{\hangindent\wd\@tempboxb 
    \csname fnum@e\@captype\endcsname\hskip1zw #1}\par
  \fi
 \else
  \ifdim \wd\@tempboxa > \ecapwidth
   \hfil\parbox[t]{\ecapwidth}{\hangindent\wd\@tempboxb
    \csname fnum@e\@captype\endcsname\hskip1zw #1}\par
  \else
   \hbox to\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
 \fi
 \vspace{\belowcaptionskip}\par
}

\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{.5zw}
\setlength\arrayrulewidth{.1mm}
\setlength\doublerulesep{\z@}
\setlength\tabbingsep{\labelsep}

\skip\@mpfootins = \skip\footins
\setlength\fboxsep{.5zw}
\setlength\fboxrule{.1mm}
\renewcommand{\theequation}{\@arabic\c@equation}

\if@enablejfam
 \if@compatibility\else
   \DeclareSymbolFont{mincho}{\kenc@JYn}{mc}{m}{n}
   \DeclareSymbolFontAlphabet{\mathmc}{mincho}
   \SetSymbolFont{mincho}{bold}{\kenc@JYn}{gt}{m}{n}
   \jfam\symmincho
   \DeclareMathAlphabet{\mathgt}{\kenc@JYn}{gt}{m}{n}
 \fi
 \if@mathrmmc
   \AtBeginDocument{%
    \reDeclareMathAlphabet{\mathrm}{\mathrm}{\mathmc}
    \reDeclareMathAlphabet{\mathbf}{\mathbf}{\mathgt}
   }%
 \fi
\else
 \DeclareRobustCommand{\mathmc}{%
   \@latex@error{Command \noexpand\mathmc invalid with\space
      `disablejfam' class option.}\@eha
 }
 \DeclareRobustCommand{\mathgt}{%
   \@latex@error{Command \noexpand\mathgt invalid with\space
      `disablejfam' class option.}\@eha
 }
\fi

\DeclareOldFontCommand{\mc}{\normalfont\mcfamily}{\mathmc}
\DeclareOldFontCommand{\gt}{\normalfont\gtfamily}{\mathgt}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*{\cal}{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*{\mit}{\@fontswitch\relax\mathnormal}

\newdimen\bibindent
\setlength\bibindent{1.5em}
\newcommand{\newblock}{\hskip .11em\@plus.33em\@minus.07em}

\newenvironment{thebibliography}[1]
 {%
 \def\subsection{\@startsection{subsection}{2}{\z@}% }{
  {\z@}%     \@plus 1mm \@minus .1mm
  {.15\Cvs}% \@plus 1mm \@minus .1mm
  {\centering\bfseries}}%
 \subsection*{\refname}%
 \small\baselineskip15\@Q
   \list{\@biblabel{\@arabic\c@enumiv}}%
        {\settowidth\labelwidth{\@biblabel{\hspace*{2zw}}}%
         \topsep\z@\parsep\z@\partopsep\z@\itemsep\z@
         \leftmargin3zw
         \labelsep1zw
         \@openbib@code
         \usecounter{enumiv}%
         \let\p@enumi\@empty
         \renewcommand\theenumiv{\@arabic\c@enumiv}}%
   \sloppy
   \clubpenalty\z@
   \widowpenalty\z@
   \@clubpenalty\clubpenalty
   \sfcode`\.\@m}
  {\def\@noitemerr
    {\@latex@warning{Empty `thebibliography' environment}}%
   \endlist}
\def\@biblabel#1{[#1]}
\let\@openbib@code\@empty

%% paper, electronicsletter
\newenvironment{biography}{\par
 \raggedbottom
 {\small \@uketsuke}\par
 \nointerlineskip
 \vskip17mm
 \parindent\z@
 \leftskip8\@Q
 \small\baselineskip15\@Q
 \global\let\@uketsuke\relax
}{\par}

\newcounter{profile}
\def\profile{%
 \@ifstar\np@profile{\@ifnextchar[%% ]
 {\pic@profile}{\stepcounter{profile}%
  \pic@profile[a\theprofile.\ieicej@in@ext]}}}% 


 \renewenvironment{biography}{\relax}{\relax}
 \long\def\pic@profile[#1]#2#3#4{}
 \long\def\np@profile#1#2#3{}

\renewcommand{\footnoterule}{%
  \kern-3\p@
  \hrule height .1mm width \columnwidth
  \kern 2.715\p@}

\def\@makefnmark{\smash{\kern\z@$^{\mbox{\tiny \kern-.5zw
  （注\kern.1zw\@thefnmark{}）\kern-.5zw}}$\kern\z@}}

\newcommand\@makefntext[1]{\parindent1zw
 \noindent\hbox{\kern-.5zw
  （注\kern.1zw\@thefnmark{}）\kern-.5zw\hbox to 1zw{\hss ：\hss}}#1}

\def\thefootnote{\@arabic\c@footnote}
\def\thempfootnote{\@fnsymbol\c@mpfootnote}

\newdimen\mathindent
\AtEndOfClass{\mathindent1zw}% \leftmargini
\renewcommand\[{\relax
                \ifmmode\@badmath
                \else
                 \parsep  4\p@ \@plus2\p@ \@minus\p@
                 \topsep  8\p@ \@plus2\p@ \@minus4\p@
                 \itemsep 4\p@ \@plus2\p@ \@minus\p@
                  \begin{trivlist}%
                    \@beginparpenalty\predisplaypenalty
                    \@endparpenalty\postdisplaypenalty
                    \item[]\leavevmode
                    \hb@xt@\linewidth\bgroup $\m@th\displaystyle %$
                      \hskip\mathindent\bgroup
                \fi}
\renewcommand\]{\relax
                \ifmmode
                      \egroup $\hfil% $
                    \egroup
                  \end{trivlist}%
                \else \@badmath
                \fi}
\renewenvironment{equation}%
    {\@beginparpenalty\predisplaypenalty
     \@endparpenalty\postdisplaypenalty
     \refstepcounter{equation}%
     \parsep  4\p@ \@plus2\p@ \@minus\p@
     \topsep  8\p@ \@plus2\p@ \@minus4\p@
     \itemsep 4\p@ \@plus2\p@ \@minus\p@
     \trivlist \item[]\leavevmode
       \hb@xt@\linewidth\bgroup $\m@th% $
         \displaystyle
         \hskip\mathindent}%
        {$\hfil % $
         \displaywidth\linewidth\hbox{\@eqnnum}%
       \egroup
     \endtrivlist}
\renewenvironment{eqnarray}{%
    \stepcounter{equation}%
    \parsep  4\p@ \@plus2\p@ \@minus\p@
    \topsep  8\p@ \@plus2\p@ \@minus4\p@
    \itemsep 4\p@ \@plus2\p@ \@minus\p@
    \def\@currentlabel{\p@equation\theequation}%
    \global\@eqnswtrue\m@th
    \global\@eqcnt\z@
    \tabskip\mathindent
    \let\\=\@eqncr
    \setlength\abovedisplayskip{\topsep}%
    \ifvmode
      \addtolength\abovedisplayskip{\partopsep}%
    \fi
    \addtolength\abovedisplayskip{\parskip}%
    \setlength\belowdisplayskip{\abovedisplayskip}%
    \setlength\belowdisplayshortskip{\abovedisplayskip}%
    \setlength\abovedisplayshortskip{\abovedisplayskip}%
    $$\everycr{}\halign to\linewidth% $$
    \bgroup
      \hskip\@centering
      $\displaystyle\tabskip\z@skip{##}$\@eqnsel&%
      \global\@eqcnt\@ne \hskip.8\arraycolsep \hfil${##}$\hfil&%
      \global\@eqcnt\tw@ \hskip.8\arraycolsep
        $\displaystyle{##}$\hfil \tabskip\@centering&%
      \global\@eqcnt\thr@@
        \hb@xt@\z@\bgroup\hss##\egroup\tabskip\z@skip\cr}%
      {\@@eqncr
    \egroup
    \global\advance\c@equation\m@ne$$% $$
    \@ignoretrue
    }
%%\endinput
%%
%% End of file `fleqn.clo'.

\def\@eqnnum{{\normalfont \normalcolor (\theequation)\hspace*{3mm}}}

\def\@begintheorem#1#2{%
 \settowidth{\labelwidth}{\kern-.5zw ［#1\ #2］\kern-.5zw}
 \begin{description}
  \item[\@thmlbracket #1\ #2\@thmrbracket]}

\def\@opargbegintheorem#1#2#3{%
 \begin{description}
  \item[\@thmlbracket #1\ #2\@thmrbracket （#3）\kern-.5zw]}%%
\def\@endtheorem{\end{description}}

\def\thmbracket#1#2{%
 \gdef\@thmlbracket{\leavevmode\<#1}%
 \gdef\@thmrbracket{#2\<}}
\thmbracket{［}{］}
\def\@thmcountersep{}

\def\ack{\par{\bfseries 謝辞}\hskip1zw}

\newif\if西暦 \西暦false
\def\西暦{\西暦true}
\def\和暦{\西暦false}
\def\today{{%
  \iftdir
    \if西暦
      \kansuji\number\year 年
      \kansuji\number\month 月
      \kansuji\number\day 日
    \else \@tempcnta\year
      \advance\@tempcnta-1988 平成
      \ifnum \@tempcnta =1 元\else\kansuji\number\@tempcnta\fi 年
      \kansuji\number\month 月\kansuji\number\day 日
    \fi
  \else
    \if西暦
      \number\year\, 年\hspace{.5em}\nobreak
      \number\month\, 月\hspace{.5em}\nobreak
      \number\day\, 日
    \else \@tempcnta\year
      \advance\@tempcnta-1988 平成
      \ifnum \@tempcnta =1 元\else\number\@tempcnta\fi
        \, 年\hspace{.5em}\nobreak
      \number\month\, 月\hspace{.5em}\nobreak\number\day\, 日
    \fi
  \fi}}
%%\newcommand{\prepartname}{第}
%%\newcommand{\postpartname}{部}
%%\newcommand{\contentsname}{目 次}
%%\newcommand{\listfigurename}{図 目 次}
%%\newcommand{\listtablename}{表 目 次}
\newcommand{\refname}{参考文献}
%%\newcommand{\indexname}{索 引}
\newcommand{\figurename}{図}
\newcommand{\tablename}{表}
%%\newcommand{\appendixname}{付 録}
%%\newcommand{\abstractname}{概 要}

%% from citesort.sty (by Donald Arseneau 1989), a little customized
\newcount\@minsofar
\newcount\@min
\newcount\@cite@temp
\def\@citex[#1]#2{%
\if@filesw \immediate \write \@auxout {\string \citation {#2}}\fi
\@tempcntb\m@ne \let\@h@ld\relax \def\@citea{}%
\@min\m@ne%
\@cite{%
  \@for \@citeb:=#2\do {\@ifundefined {b@\@citeb}%
    {\@h@ld\@citea\@tempcntb\m@ne{\bfseries ?}%
    \@warning {Citation `\@citeb ' on page \thepage \space undefined}}%
{\@minsofar\z@ \@for \@scan@cites:=#2\do {%
  \@ifundefined{b@\@scan@cites}%
    {\@cite@temp\m@ne}
    {\@cite@temp\number\csname b@\@scan@cites \endcsname \relax}%
\ifnum\@cite@temp > \@min% select the next one to list
    \ifnum\@minsofar = \z@
      \@minsofar\number\@cite@temp
      \edef\@scan@copy{\@scan@cites}\else
    \ifnum\@cite@temp < \@minsofar
      \@minsofar\number\@cite@temp
      \edef\@scan@copy{\@scan@cites}\fi\fi\fi}\@tempcnta\@min
  \ifnum\@minsofar > \z@ % some more
    \advance\@tempcnta\@ne
    \@min\@minsofar
    \ifnum\@tempcnta=\@minsofar %   Number follows previous--hold on to it
      \ifx\@h@ld\relax
        \edef \@h@ld{\@citea\csname b@\@scan@copy\endcsname}%
      \else \edef\@h@ld{\ifmmode{]〜[}\else]〜[\fi
       \csname b@\@scan@copy\endcsname}%
      \fi
    \else \@h@ld\@citea\csname b@\@scan@copy\endcsname
          \let\@h@ld\relax
  \fi % no more
\fi}%
\def\@citea{],\penalty\@highpenalty\,[}}\@h@ld}{#1}}
%% end of citesort.sty

\def\@cite#1#2{\leavevmode\unskip
  \ifnum\lastpenalty=\z@\penalty\@highpenalty\fi% highpenalty before
  \,[{\multiply\@highpenalty 3 #1%             % triple-highpenalties within
      \if@tempswa,\penalty\@highpenalty\ #2\fi % and before note.
    }]\spacefactor\@m}

\def\onelineskip{\par\vspace{1\baselineskip}\par}
\def\halflineskip{\par\vspace{.5\baselineskip}\par}

\DeclareRobustCommand\ddash{\hbox to 2zw{---\hss ---}}% \let\doubledash\ddash
\def\FRAC#1#2{\leavevmode\kern-.1em
  \raise.5ex\hbox{\the\scriptfont0 #1}\kern-.1em
  /\kern-.15em\lower.25ex\hbox{\the\scriptfont0 #2}}
\DeclareRobustCommand\RN[1]{\uppercase\expandafter{\romannumeral#1}}

\DeclareRobustCommand\MARU[1]{\raisebox{0.1zh}{{%
 \leavevmode\ooalign{\hfil\lower.168ex\hbox{#1}\hfil\crcr\mathhexbox20D}}}}

\DeclareRobustCommand\kintou[2]{\leavevmode\hbox to #1{%
 \kanjiskip=\z@ plus 1fill minus 1fill\xkanjiskip=\kanjiskip #2}}

\DeclareRobustCommand\ruby[2]{\leavevmode
 \setbox0=\hbox{#1}\setbox1=\hbox{\tiny #2}%
 \ifdim\wd0>\wd1 \dimen0=\wd0 \else \dimen0=\wd1 \fi
 \hbox{\kanjiskip=\fill
 \vbox{\hbox to \dimen0{\tiny \hfil#2\hfil}%
  \nointerlineskip \hbox to \dimen0{\hfil#1\hfil}}}}

\def\QED{{\unskip\nobreak\hfil\penalty50
 \hskip1zw\hbox{}\nobreak\hfil \hbox{$\Box$\hskip1zw}
 \parfillskip\z@ \finalhyphendemerits\z@\par}}

\def\Hline{\noalign{\hrule height 0.4mm}}

\postbreakpenalty`（=10000
\prebreakpenalty`）=10000
\postbreakpenalty`［=10000
\prebreakpenalty`］=10000
\postbreakpenalty`〈=10000
\prebreakpenalty`〉=10000
\postbreakpenalty`【=10000
\prebreakpenalty`】=10000
\postbreakpenalty`〔=10000
\prebreakpenalty`〕=10000
\postbreakpenalty`『=10000
\prebreakpenalty`』=10000
\prebreakpenalty`"=10000 %"
\prebreakpenalty`℃=10000
\prebreakpenalty`　=10000
\prebreakpenalty`・=10000
\prebreakpenalty`〜=10000
\prebreakpenalty`ー=10000
\prebreakpenalty`？=10000
\prebreakpenalty`！=10000
\if@enable@uptex
 \postbreakpenalty16=10000
\else
 \postbreakpenalty"5C=10000 %"
\fi
\postbreakpenalty`【=10000
\prebreakpenalty`】=10000
\postbreakpenalty`〔=10000
\prebreakpenalty`〕=10000
\postbreakpenalty`『=10000
\prebreakpenalty`』=10000
\inhibitxspcode`〒=2
\inhibitxspcode`！=1

\def\sloppy{\tolerance9999\hbadness9999\hfuzz.5\p@ \vfuzz.5\p@}

\hbadness4000
\vbadness10001
\tolerance4000\pretolerance\m@ne
\clubpenalty\z@
\widowpenalty\z@

\AtBeginDocument{%
 %%
 \displaywidowpenalty\z@
 \interdisplaylinepenalty\z@
 \predisplaypenalty\z@
 \postdisplaypenalty\z@
 %% cmex7,8,9 を使わない
 \@ifundefined{cmex@opt}{%
  \DeclareFontFamily{OMX}{cmex}{}{}%
  \DeclareFontShape{OMX}{cmex}{m}{n}{%
   <->    cmex10
  }{}%
 }{%
  \ifnum\cmex@opt=7\relax
   \DeclareFontFamily{OMX}{cmex}{}{}%
   \DeclareFontShape{OMX}{cmex}{m}{n}{%
    <->    cmex10
   }{}%
  \fi
 }%
 %% amsmath
 \@ifpackageloaded{amsmath}%
  {\@mathmargin1zw \@plus\z@ \@minus\z@
   \multlinegap1zw
   \def\maketag@@@#1{\hbox{\m@th\normalfont #1}\hskip3mm}%
   \def\eqref#1{\textup{\tagform@{\ref{#1}}\unskip}}%
  }{}%
 %% amsthm.sty
 \@ifpackageloaded{amsthm}{%
  %% \thm@preskip=\topsep \thm@postskip=\thm@preskip と定義済み
  %% [] の中のパーレンを全角に/後ろのピリを削除/head の後ろを一字空きに
  \def\@thm#1#2#3{%
    \ifhmode\unskip\unskip\par\fi
    \normalfont
    \trivlist
    \let\thmheadnl\relax
    \let\thm@swap\@gobble
    \thm@notefont{\fontseries\mddefault\upshape}%
    %\thm@notefont{\bfseries}%
    %\thm@headpunct{.}% add period after heading
    \thm@headpunct{}% add period after heading
    %\thm@headsep 5\p@ plus\p@ minus\p@\relax
    \thm@headsep 1zw \@plus .15zw \@minus .25zw\relax
    \thm@space@setup
    #1% style overrides
    \@topsep\z@ % \thm@preskip               % used by thm head
    \@topsepadd\z@ % \thm@postskip           % used by \@endparenv
    \def\@tempa{#2}\ifx\@empty\@tempa
     \def\@tempa{\@oparg{\@begintheorem{#3}{}}[]}%
    \else
     \refstepcounter{#2}%
     \def\@tempa{\@oparg{\@begintheorem{#3}{\csname the#2\endcsname}}[]}%
    \fi
    \@tempa
  }%
  %\def\@endtheorem{\endtrivlist \@doendpe}% \@endpefalse void
  \def\th@plain{% style=plain
   \thm@headfont{}% \bfseries
   %\itshape % body font
  }%
  \def\th@remark{% style=remark
   \thm@headfont{}% \bfseries
   \normalfont % body font
   %\thm@preskip\topsep \divide\thm@preskip\tw@
   %\thm@postskip\thm@preskip
  }%
  %% 半角パーレンを全角に
  \def\thmhead@plain#1#2#3{%
   \@thmlbracket %%!!
   \thmname{#1}
   \thmnumber{\@ifnotempty{#1}{}\@upn{#2}}%
   \@thmrbracket %%!!
   \thmnote{{\the\thm@notefont （#3）\inhibitglue}}}%
  \let\thmhead\thmhead@plain
  %% \swapnumbers が展開されたとき有効に
  \def\swappedhead#1#2#3{%
    \@thmlbracket %%!!
    \thmnumber{#2}%
    \thmname{\@ifnotempty{#2}{}#1}%
    \@thmrbracket %%!!
    \thmnote{ {\the\thm@notefont （#3）\inhibitglue}}}%
  %% proof
  \def\proofname{\textbf{証明}}%
  \renewenvironment{proof}[1][\proofname]{\par
    \topsep\z@
    \pushQED{$\Box$}%
    \normalfont
    %\topsep6\p@\@plus6\p@\relax
    \labelsep1zw
    \trivlist
    \item[\hskip\labelsep
          %\itshape
      \textbf{#1\inhibitglue}\@addpunct{}]\ignorespaces
  }{%
    \popQED
    \endtrivlist\@endpefalse
  }%
 }{}%
 %% theorem.sty
 \@ifpackageloaded{theorem}{%
  \theoremstyle{plain}%
  \theorembodyfont{\normalfont}%
  \theoremheaderfont{\normalfont}% \bfseries
  %\def\theorem@headerfont{\bfseries}%
  \global\setlength\theorempreskipamount{\z@}%
  \global\setlength\theorempostskipamount{\z@}%
  \gdef\th@plain{\normalfont %\itshape
   \def\@begintheorem##1##2{%
    \labelsep1zw %\@plus .15zw \@minus .25zw
    \item[\hskip\labelsep\theorem@headerfont
     \@thmlbracket ##1\ ##2\@thmrbracket]}%
   \def\@opargbegintheorem##1##2##3{%
    \labelsep1zw %\@plus .15zw \@minus .25zw
    \item[\hskip\labelsep{\theorem@headerfont
     \@thmlbracket ##1\ ##2\@thmrbracket}（##3）\inhibitglue]}%
  }%
  %% \theoremstyle{break}
  \gdef\th@break{\normalfont %\slshape
   \def\@begintheorem##1##2{%
    \labelsep1zw %\@plus .15zw \@minus .25zw
    \item[\rlap{\vbox{\hbox{\hskip \labelsep
     \theorem@headerfont \@thmlbracket ##1\ ##2\@thmrbracket}%
     \hbox{\strut}}}]}%
   \def\@opargbegintheorem##1##2##3{%
    \labelsep1zw %\@plus .15zw \@minus .25zw
    \item[\rlap{\vbox{\hbox{\hskip \labelsep
     {\theorem@headerfont
     \@thmlbracket ##1\ ##2\@thmrbracket}（##3）\inhibitglue}%
     \hbox{\strut}}}]}}%
 }{}%
 %% cite.sty
 \@ifpackageloaded{cite}{%
  \renewcommand\citeform[1]{[#1]}%
  \renewcommand\citeleft{}%
  \renewcommand\citeright{}%
  \def\citedash{〜}%
  \mathchardef\citeprepenalty=\z@
  \mathchardef\citemidpenalty=\z@
  \mathchardef\citepunctpenalty=\z@
 }{}%
 %% float.sty
 \@ifpackageloaded{float}{%
   \renewcommand\float@endH{\@endfloatbox
     \vskip\intextsep
     \if@flstyle\setbox\@currbox\float@makebox\columnwidth\fi
     \box\@currbox
     \vskip-.5zh %% added
     \vskip\intextsep\relax}%
 }{}%
 %% eps/pdf
 \@ifundefined{ver@dvips.def}{\def\ieicej@in@ext{pdf}}{\def\ieicej@in@ext{eps}}%
 %% nidanfloat
 \@ifpackageloaded{nidanfloat}{%
  \renewcommand\dblbotfraction{0.9}% 0.5
  \setcounter{dblbotnumber}{4}% 2
 }{}%
 %% natbib.sty
 \@ifpackageloaded{natbib}{% version 8.31b
  \renewcommand\NAT@open{\inhibitglue （}%
  \renewcommand\NAT@close{）\inhibitglue}%
  \def\citeP{\begingroup
     \renewcommand\NAT@open{（}%
     \renewcommand\NAT@close{）}%
     \renewcommand\NAT@cmt{}%
     \NAT@swatrue\let\NAT@ctype\z@\NAT@partrue
     \@ifstar{\NAT@fulltrue\NAT@citetp}{\NAT@fullfalse\NAT@citetp}}%
  %%
  \@ifundefined{setcitestyle}{}{\setcitestyle{yysep={,~}}}% for v7.1 etc.
  \def\bibsection{\par
   \raggedbottom
   \centering\noindent{\bfseries\@secjidori{\refname}}}% 
  \def\bibfont{\small\baselineskip15\@Q}%
   \bibhang22H
  \bibsep\z@
 }{}%
 %% binary operator --> commented v3.1
 %\@ifpackageloaded{amssymb}{%
 % \let\leq\leqq
 % \let\geq\geqq
 % \let\le\leqq
 % \let\ge\geqq
 % \let\subseteq\subseteqq
 % \let\supseteq\supseteqq
 %}{%
 %\def\leq{\mathrel{\mathpalette\gl@align<}}\let\le\leq
 %\def\geq{\mathrel{\mathpalette\gl@align>}}\let\ge\geq
 %\def\gl@align#1#2{\lower.6ex\vbox{\baselineskip\z@skip\lineskip\z@
 % \ialign{$\m@th#1\hfil##\hfil$\crcr#2\crcr=\crcr}}}%
 %\def\subseteq{\rlap{\raisebox{.25ex}{$\subset$}}\raisebox{-1.1ex}{$=$}}%
 %\def\supseteq{\rlap{\raisebox{.25ex}{$\supset$}}\raisebox{-1.1ex}{$=$}}%
 %}%
 %\def\neq{\mathrel{\mathpalette\c@ncelass=}}%
 %\def\c@ncelass#1#2{\ooalign{$\hfil#1\mkern-.4mu|\hfil$\crcr$#1#2$}}%
 %\let\ne\neq
}

 \pagestyle{IEICEJ}
\pagenumbering{arabic}
\raggedbottom
\if@twocolumn
  \twocolumn
  \sloppy
   \raggedbottom
\else
  \onecolumn
\fi
\if@twoside
  \@mparswitchtrue
\else
  \@mparswitchfalse
\fi

\endinput
