" Vim syntax file
" Based on syntax file from Johan Nylander <http://www.abc.se/~nylander/>
" Language:     Nexus data format, PAUP and MrBayes commands.
" Maintainer:   Johan Viklund <johan.viklund@gmail.com>
" Last Change:  2012 Nov 06

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

syn case ignore

" Nexus TODO
syn keyword nexusTodo contained TODO

" #NEXUS title
syn keyword nexusTitle  NEXUS

" Nexus Blocks
syn keyword nexusBlockCommands  assumptions begin characters codons data distances end paup sets taxa trees mrbayes

" Nexus Data commands
syn keyword nexusDataCommands  dimensions format matrix translate tree options

" Nexus Data parameter
syn keyword nexusDataParameters  datatype equate gap interleave matchchar missing ntax nchar

" Nexus Data options
syn keyword nexusDataOptions  continuous  dna morphology rna protein restriction mixed standard

" PAUP Commands
syn keyword nexusPaupCommands  agree alltrees assume bandb base basefreqs boot bootstrap cd charpartition charset cleartrees condense constraints contree cstatus ctype del delete deroottrees describetrees dos dscores defaults dset edit exclude exe execute export exset filter factory fstatus gammaplot generatetrees gettrees hompart hsearch help include ingroup jackknife lake loadconstr lscores leave log lset lscores matrixrep mprsets nj outgroup pairdiff permute pscores pset puzzle quit randtrees rateset reconstruct restore revfilter reweight roottrees saveassum savedist savetrees set showanc showconstr showdist showmatrix showcharparts showratesets showtaxparts showtrees showusertypes sorttrees stardecomp surfcheck taxpartition taxset time tonexus treedist treeinfo treewts tstatus typeset undelete upgma usertype weights wts wtset

" Paup Parameters/Keyword
syn keyword nexusPaupParameters  adams addseq allsitesmean ancstates apolist append backbone base basefreq bseed breakties brlens charsperline chglist class cmlabels cmshoweq cmcolwid cmcstatus collapse conlevel constraints converse convexity crit criterion cutoffpct dcollapse deldupes diag displayout distance dstatus enforce estfreq excluded exset fd fdclasses fdfile fdonly fdtype file full fvalue grpfreq hennig homoplasy increase indices interleaved keep keepall labelnodes le50 linebreaks longfmt majrule maxtrees missdist monophyly mprsets mstaxa mulpars multrees ncat nchar negbrlen nowarn nreps nst objective ordphylip outroot patristic percent pinv pinvar plot power rates rclass removefreq replace reprate rmat rmatrix scorefile search semistrict shape showtree sitepartition sorttrees status strict subst swap tcompress treefile trees typeset unordphylip upbound usetreewts warnreset warntree warntsave wts wtset xout

" Paup Options/Option type
syn keyword nexusPaupOptions  abs allow altnexus ambequal asis barchart bincode both constant current custom cladogram dist doswindows equal empirical est estimate f81 f84 faststep freqpars furthest gamma gtr hennig heuristic hide histogram hky85 ignore infer internal jc k2p k3p kmaxmini like likelihood logdet lsfit lundberg macintosh maxbrlens maxmini me mean median midpoint minbrlen ml monophyl native neili nexus nj nni no none off only p paraphyl parsimony phylip phylogram prev previous prohibit proportional polytomy purge repeatcnt setabsval sets setzero show simple sitespec spr tabtext tbr tajnei tamnei terminal text ti total tratio tv uncertain unmodified unix upgma upholt user yes


" MrBayes Commands
syn keyword nexusMbCommands  about acknowledgments charset charstat citations comparetree constraint ctype databreaks delete deroot disclaimer exclude execute help include link log lset manual mcmc mcmcp outgroup pairs partition plot prset props quit report restore root set showmatrix showmodel showtree sump sumt taxastat taxset unlink usertree

" MrBayes Parameters
syn keyword nexusMbParameters  aamodelpr allchains allcomps ancstates append applyto autoclose brlens brlenspr b burnin burninfrac calctreeprobs code coding codoncatfreqs contype correlation coswitchpr covarion diagnfreq displaygeq extincionrates extinctionpr filename filename1 filename2 growthrate growthpr irreversible m3omegapr marglike match mcmcdiagn minpartfreq nbetacat nchains ngammacat ngen nowarn nowarnings nperts nruns nst nswaps ntrees nucmodel ny98omega3pr ny98omega1pr omega omegapr omegavar ordered ordertaxa outputname parsmodel parameter partition pinvar pinvarpr ploidy possel print printall printfreq printmax print printtofile ratecorrpr ratemult rates ratepr replace relburnin reweight revmat revmatpr samplefreq sampleprob savebrlens seed shape shapepr showtreeprobs siterates speciationpr speciationrates start startingtree statefreq statefreqpr stop stopval stoprule swapfreq swapseed switchrates symmetricbetapr table temp theta thetapr tratio tratiopr topology topologypr unordered

" MrBayes Options
syn keyword nexusMbOptions  4by4 adgamma all allcompat beta ciliates clock codon consistentwith constraints default diploid dir dirichlet doublet equal exp exponential fixed gamma halfcompat haploid invgamma infinity m3 metmt mycoplasma no noabsencesites normal nopresencesites ny98 perfect propinv random ratio scaled unconstrained uni uniform universal user var variable vertmt yeast yes

" Nexus Comments
syn region nexusComments start=/\[/  end=/\]/ contains=nexusComments

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_nexus_syntax_inits")
    if version < 508
        let did_nexus_syntax_inits = 1
        command -nargs=+ HiLink hi link <args>
    else
        command -nargs=+ HiLink hi def link <args>
    endif
    HiLink nexusTitle           Title
    HiLink nexusBlockCommands   Type
    HiLink nexusDataCommands    Identifier
    HiLink nexusPaupCommands    Identifier
    HiLink nexusMbCommands      Identifier
    HiLink nexusDataParameters  Constant
    HiLink nexusPaupParameters  Constant
    HiLink nexusMbParameters    Constant
    HiLink nexusDataOptions     Statement
    HiLink nexusPaupOptions     Statement
    HiLink nexusMbOptions       Statement
    HiLink nexusComments        Comment
    HiLink nexusTodo            Todo
    delcommand HiLink
endif

let b:current_syntax = "nexus"
