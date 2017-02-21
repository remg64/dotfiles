" Vim Syntax File
"
" Language:    OPL
" Maintainers: Prause
" Created:     May 01 2011

if version < 600
   syn clear
elseif exists("b:current_syntax")
  finish
endif

syntax case match
syn sync minlines=50

syntax keyword oplModelKeyword     minimize sum abs subject to forall execute for new in maximize using CP LP all and assert constraints CPLEX cumulFunction DBConnection DBExecute DBRead DBUpdate diff div else false from in if include infinity intensity inter interval invoke key main max maxint min mod not optional or ordered piecewise prepare prod pwlFunction reversed sequence setof SheetConnection SheetRead SheetWrite size sorted stateFunction stepFunction stepwise symdiff true tuple types union with allDifferent allMinDistance allowedAssignements alternative alwaysConstant alwaysEqual alwaysIn alwaysNoState append asSet before card ceil count cumulFunctionValue disToInt dual element endAtEnd endAtStart endBeforeEnd endBeforeStart endEval endOf exp first floatValue floor forbiddenAssignements forbidEnd forbidExtent forbidStart frac ftoi heightAtEnd heightAtStart intValue inverse item last length lengthEval lengthOf lex lg ln log matchAt maxl minl next nextc noOverlap numberOfSegments ord pack pow presenceOf prev prevc pulse rand reducedCost round segmentEnd segmentStart segmentValue sgn sizeEval sizeOf slack span sqrt srand standardDeviation startAtEnd startAtStart startBeforeEnd startBeforeStart startEval startOf stateFunctionValue step stepAtEnd stepAtStart synchronize trunc

syntax keyword oplType             int float dvar var boolean range string dexpr float+ int+


syntax region  oplRegionComment    fold start=/\/\*/ end=/\*\// contains=oplTODO
syntax match   oplLineComment      "//.*" contains=oplTODO ",@Spell
syntax keyword oplTODO             FIXME TODO fixme todo Fixme FixMe Todo ToDo XXX xxx contained

syntax match   oplNumber           /\<\d\+\>/
syntax match   oplNumber           /\<\d\+\.\d\+\>/
syntax match   oplNumber           /\<\d\+\.\d\+e-\d\+\>/
syntax region oplString start=/\v"/ skip=/\v\\./ end=/\v"/

syntax match   oplConstraint       "\<[a-zA-Z][_$a-zA-Z0-9]*:" skipwhite
syntax match   oplConstant         "\<[A-Z]\+\>"

"""" Highlights

highlight link oplRegionComment    Comment
highlight link oplLineComment      Comment
highlight link oplTODO             TODO

highlight link oplConstant         Constant
highlight link oplType             Type
highlight link oplNumber           Number
highlight link oplString           String
highlight link oplConstraint       Identifier

highlight link oplModelKeyword     Keyword

let b:current_syntax = "opl"
