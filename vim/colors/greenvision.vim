" Vim color file - greenvision
" Generated by http://bytefluent.com/vivify 2017-02-10
set background=dark
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

set t_Co=256
let g:colors_name = "greenvision"

"hi IncSearch -- no settings --
"hi SignColumn -- no settings --
"hi CTagsMember -- no settings --
"hi CTagsGlobalConstant -- no settings --
"hi Ignore -- no settings --
hi Normal guifg=#00a900 guibg=#000000 guisp=#000000 gui=NONE ctermfg=34 ctermbg=NONE cterm=NONE
"hi CTagsImport -- no settings --
"hi Search -- no settings --
"hi CTagsGlobalVariable -- no settings --
"hi SpellRare -- no settings --
"hi EnumerationValue -- no settings --
"hi Float -- no settings --
"hi Union -- no settings --
"hi EnumerationName -- no settings --
"hi SpellCap -- no settings --
"hi SpellLocal -- no settings --
"hi DefinedName -- no settings --
"hi LocalVariable -- no settings --
"hi SpellBad -- no settings --
"hi CTagsClass -- no settings --
"hi clear -- no settings --
hi WildMenu guifg=#00cb00 guibg=#000000 guisp=#000000 gui=NONE ctermfg=40 ctermbg=NONE cterm=NONE
hi SpecialComment guifg=#00d700 guibg=#001200 guisp=#001200 gui=NONE ctermfg=40 ctermbg=22 cterm=NONE
hi Typedef guifg=#1fb631 guibg=#000000 guisp=#000000 gui=NONE ctermfg=34 ctermbg=NONE cterm=NONE
hi Title guifg=#09ab00 guibg=#000000 guisp=#000000 gui=bold ctermfg=34 ctermbg=NONE cterm=bold
hi Folded guifg=#00bf00 guibg=#001200 guisp=#001200 gui=NONE ctermfg=34 ctermbg=22 cterm=NONE
hi PreCondit guifg=#00ac5c guibg=#000000 guisp=#000000 gui=NONE ctermfg=35 ctermbg=NONE cterm=NONE
hi Include guifg=#00ac5c guibg=#000000 guisp=#000000 gui=NONE ctermfg=35 ctermbg=NONE cterm=NONE
hi TabLineSel guifg=#00f000 guibg=#002a00 guisp=#002a00 gui=bold ctermfg=10 ctermbg=22 cterm=bold
hi StatusLineNC guifg=#005500 guibg=#001000 guisp=#001000 gui=NONE ctermfg=22 ctermbg=22 cterm=NONE
hi NonText guifg=#008700 guibg=#001000 guisp=#001000 gui=NONE ctermfg=28 ctermbg=22 cterm=NONE
hi DiffText guifg=#00aa00 guibg=#004400 guisp=#004400 gui=underline ctermfg=34 ctermbg=22 cterm=underline
hi ErrorMsg guifg=#000000 guibg=#00ff00 guisp=#00ff00 gui=bold ctermfg=NONE ctermbg=10 cterm=bold
hi Debug guifg=#00d700 guibg=#001200 guisp=#001200 gui=NONE ctermfg=40 ctermbg=22 cterm=NONE
hi PMenuSbar guifg=#00dc00 guibg=#001c00 guisp=#001c00 gui=NONE ctermfg=40 ctermbg=22 cterm=NONE
hi Identifier guifg=#50d930 guibg=#000000 guisp=#000000 gui=NONE ctermfg=113 ctermbg=NONE cterm=NONE
hi SpecialChar guifg=#00d700 guibg=#001200 guisp=#001200 gui=NONE ctermfg=40 ctermbg=22 cterm=NONE
hi Conditional guifg=#1fb631 guibg=#000000 guisp=#000000 gui=NONE ctermfg=34 ctermbg=NONE cterm=NONE
hi StorageClass guifg=#1fb631 guibg=#000000 guisp=#000000 gui=NONE ctermfg=34 ctermbg=NONE cterm=NONE
hi Todo guifg=#000000 guibg=#00ed00 guisp=#00ed00 gui=NONE ctermfg=NONE ctermbg=10 cterm=NONE
hi Special guifg=#00d700 guibg=#001200 guisp=#001200 gui=NONE ctermfg=40 ctermbg=22 cterm=NONE
hi LineNr guifg=#007900 guibg=#000600 guisp=#000600 gui=NONE ctermfg=2 ctermbg=22 cterm=NONE
hi StatusLine guifg=#00ff00 guibg=#001000 guisp=#001000 gui=bold ctermfg=10 ctermbg=22 cterm=bold
hi Label guifg=#1fb631 guibg=#000000 guisp=#000000 gui=NONE ctermfg=34 ctermbg=NONE cterm=NONE
hi PMenuSel guifg=#00f300 guibg=#002200 guisp=#002200 gui=NONE ctermfg=10 ctermbg=22 cterm=NONE
hi Delimiter guifg=#00d700 guibg=#001200 guisp=#001200 gui=NONE ctermfg=40 ctermbg=22 cterm=NONE
hi Statement guifg=#2fc626 guibg=#000000 guisp=#000000 gui=NONE ctermfg=40 ctermbg=NONE cterm=NONE
hi Comment guifg=#008220 guibg=#000000 guisp=#000000 gui=NONE ctermfg=2 ctermbg=NONE cterm=NONE
hi Character guifg=#1fc700 guibg=#001c00 guisp=#001c00 gui=NONE ctermfg=40 ctermbg=22 cterm=NONE
hi Number guifg=#1fc700 guibg=#001c00 guisp=#001c00 gui=NONE ctermfg=40 ctermbg=22 cterm=NONE
hi Boolean guifg=#2fc626 guibg=#000000 guisp=#000000 gui=NONE ctermfg=40 ctermbg=NONE cterm=NONE
hi Operator guifg=#1fb631 guibg=#000000 guisp=#000000 gui=NONE ctermfg=34 ctermbg=NONE cterm=NONE
hi CursorLine guifg=#1ec700 guibg=#001c00 guisp=#001c00 gui=NONE ctermfg=40 ctermbg=22 cterm=NONE
hi TabLineFill guifg=#00ea00 guibg=#000000 guisp=#000000 gui=NONE ctermfg=40 ctermbg=NONE cterm=NONE
hi Question guifg=#009f00 guibg=#000000 guisp=#000000 gui=NONE ctermfg=34 ctermbg=NONE cterm=NONE
hi WarningMsg guifg=#000000 guibg=#00ff00 guisp=#00ff00 gui=NONE ctermfg=NONE ctermbg=10 cterm=NONE
hi VisualNOS guifg=NONE guibg=#002700 guisp=#002700 gui=NONE ctermfg=NONE ctermbg=22 cterm=NONE
hi DiffDelete guifg=#000000 guibg=#005500 guisp=#005500 gui=NONE ctermfg=NONE ctermbg=22 cterm=NONE
hi ModeMsg guifg=#00ea00 guibg=#000900 guisp=#000900 gui=NONE ctermfg=40 ctermbg=22 cterm=NONE
hi CursorColumn guifg=#1ec700 guibg=#001c00 guisp=#001c00 gui=NONE ctermfg=40 ctermbg=22 cterm=NONE
hi Define guifg=#00ac5c guibg=#000000 guisp=#000000 gui=NONE ctermfg=35 ctermbg=NONE cterm=NONE
hi Function guifg=#50d930 guibg=#000000 guisp=#000000 gui=NONE ctermfg=113 ctermbg=NONE cterm=NONE
hi FoldColumn guifg=#00b900 guibg=#000300 guisp=#000300 gui=NONE ctermfg=34 ctermbg=22 cterm=NONE
hi PreProc guifg=#00ac5c guibg=#000000 guisp=#000000 gui=NONE ctermfg=35 ctermbg=NONE cterm=NONE
hi Visual guifg=NONE guibg=#001500 guisp=#001500 gui=NONE ctermfg=NONE ctermbg=22 cterm=NONE
hi MoreMsg guifg=#00e700 guibg=#001000 guisp=#001000 gui=bold ctermfg=40 ctermbg=22 cterm=bold
hi VertSplit guifg=#000600 guibg=#001f00 guisp=#001f00 gui=NONE ctermfg=22 ctermbg=22 cterm=NONE
hi Exception guifg=#1fb631 guibg=#000000 guisp=#000000 gui=NONE ctermfg=34 ctermbg=NONE cterm=NONE
hi Keyword guifg=#1fb631 guibg=#000000 guisp=#000000 gui=NONE ctermfg=34 ctermbg=NONE cterm=NONE
hi Type guifg=#1fb631 guibg=#000000 guisp=#000000 gui=NONE ctermfg=34 ctermbg=NONE cterm=NONE
hi DiffChange guifg=#00a900 guibg=#002200 guisp=#002200 gui=NONE ctermfg=34 ctermbg=22 cterm=NONE
hi Cursor guifg=#000000 guibg=#00ff00 guisp=#00ff00 gui=bold ctermfg=NONE ctermbg=10 cterm=bold
hi Error guifg=#000000 guibg=#00d000 guisp=#00d000 gui=NONE ctermfg=NONE ctermbg=40 cterm=NONE
hi PMenu guifg=#00bf00 guibg=#000a00 guisp=#000a00 gui=NONE ctermfg=34 ctermbg=22 cterm=NONE
hi SpecialKey guifg=#008000 guibg=#002300 guisp=#002300 gui=bold ctermfg=2 ctermbg=22 cterm=bold
hi Constant guifg=#1fc700 guibg=#001c00 guisp=#001c00 gui=NONE ctermfg=40 ctermbg=22 cterm=NONE
hi Tag guifg=#00d700 guibg=#001200 guisp=#001200 gui=NONE ctermfg=40 ctermbg=22 cterm=NONE
hi String guifg=#1ec700 guibg=#000000 guisp=#000000 gui=NONE ctermfg=40 ctermbg=NONE cterm=NONE
hi PMenuThumb guifg=NONE guibg=#007900 guisp=#007900 gui=NONE ctermfg=NONE ctermbg=2 cterm=NONE
hi MatchParen guifg=#304300 guibg=#00fe00 guisp=#00fe00 gui=bold ctermfg=58 ctermbg=10 cterm=bold
hi Repeat guifg=#1fb631 guibg=#000000 guisp=#000000 gui=NONE ctermfg=34 ctermbg=NONE cterm=NONE
hi Directory guifg=#009330 guibg=#000000 guisp=#000000 gui=NONE ctermfg=28 ctermbg=NONE cterm=NONE
hi Structure guifg=#1fb631 guibg=#000000 guisp=#000000 gui=NONE ctermfg=34 ctermbg=NONE cterm=NONE
hi Macro guifg=#00ac5c guibg=#000000 guisp=#000000 gui=NONE ctermfg=35 ctermbg=NONE cterm=NONE
hi Underlined guifg=#00b400 guibg=#000000 guisp=#000000 gui=underline ctermfg=34 ctermbg=NONE cterm=underline
hi DiffAdd guifg=#00bf00 guibg=#002200 guisp=#002200 gui=NONE ctermfg=34 ctermbg=22 cterm=NONE
hi TabLine guifg=#00f400 guibg=#000a00 guisp=#000a00 gui=NONE ctermfg=10 ctermbg=22 cterm=NONE
hi cursorim guifg=#00ff00 guibg=#000000 guisp=#000000 gui=bold ctermfg=10 ctermbg=NONE cterm=bold
hi pythonbuiltin guifg=#839496 guibg=NONE guisp=NONE gui=NONE ctermfg=66 ctermbg=NONE cterm=NONE
hi phpstringdouble guifg=#e2e4e5 guibg=NONE guisp=NONE gui=NONE ctermfg=254 ctermbg=NONE cterm=NONE
hi htmltagname guifg=#e2e4e5 guibg=NONE guisp=NONE gui=NONE ctermfg=254 ctermbg=NONE cterm=NONE
hi javascriptstrings guifg=#e2e4e5 guibg=NONE guisp=NONE gui=NONE ctermfg=254 ctermbg=NONE cterm=NONE
hi htmlstring guifg=#e2e4e5 guibg=NONE guisp=NONE gui=NONE ctermfg=254 ctermbg=NONE cterm=NONE
hi phpstringsingle guifg=#e2e4e5 guibg=NONE guisp=NONE gui=NONE ctermfg=254 ctermbg=NONE cterm=NONE
