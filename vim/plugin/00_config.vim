" ============================================================================
" File:        00_config.vim
" Description: Vim settings
" Author:      Near Huscarl <near.huscarl@gmail.com>
" Last Change: Tue Aug 15 15:34:13 Novosibirsk Standard Time 2017
" Licence:     BSD 3-Clause license
" Note:        This is a personal vim config. therefore most likely not work 
"              on your machine
" ============================================================================

" This is basically a vimrc file with different name
" Put it into ~/.vim/plugin/ to control easier when using with git
" File name changed to 00_config.vim because vim files are sourced
" in alphabetical order

"[||[Basic Setup]

autocmd!

if !exists('os')
   if has('win32') || has('win64')
      let os = 'win'
   else
      let os = substitute(system('uname'), '\n', '', '')
   endif
endif

let mapleader = "\<Space>"
" LN
if g:os == 'win'
   let $MYVIMRC = $HOME.'\vimfiles\plugin\00_config.vim'
else
   let $MYVIMRC = $HOME.'/.vim/plugin/00_config.vim'
endif

set fileformat=unix
set t_Co=256                                       "More color
set encoding=utf-8                                 "Enable the use of icon or special char
scriptencoding utf-8                               "Need this for nerdtree to work properly
syntax on                                          "Color my code

filetype on
filetype plugin on
filetype indent on

if has('gui_running')
   try
      color flat
      " colorscheme gotham
   catch /E185/
      colorscheme evening
   endtry
else
   let g:solarized_termcolors=&t_Co
   let g:solarized_termtrans=1
   " color solarized8_dark
   color flat
endif

set hidden                                         "Make buffer hidden once modified

set ignorecase                                     "Ignore case when searching words
set smartcase                                      "Overwrite ignorecase if query contains uppercase
set incsearch                                      "Vim start searching while typing characters
set hlsearch                                       "Highlight all search matchs
set gdefault                                       "Substitute with flag g by default

set cursorline                                     "Highlight current line
set selection=exclusive                            "Cursor is positioned one character before in visual mode
set scrolloff=4                                    "Min lines at 2 ends where cursor start to scroll

set wildmenu                                       "Visual Autocomplete in cmd menu
set wildmode=list:longest,full
set wildchar=<A-e>
set completeopt=menu,longest
set complete-=i                                    "An attempt to make YCM faster

if has('GUI_running')
  " :put =&guifont
  if g:os == 'win'
     set guifont=Fura_Code_Light:h8:cANSI:qDRAFT,Andale_Mono:h10,Menlo:h10,Consolas:h10,Courier_New:h10
  else
     set guifont=DejaVu\ Sans\ Mono\ Bold\ 8
  endif
  set guioptions-=m                               "Remove menu bar
  set guioptions-=T                               "Remove toolbar
  set guioptions-=r                               "Remove right-hand scroll bar
  set guioptions-=L                               "Remove left-hand scroll bar
endif

set selectmode=mouse                               "Trigger select mode when using mouse
set nomousefocus                                   "Hover mouse wont trigger other pane
set backspace=indent,eol,start                     "Backspace behave like in other app
set confirm                                        "Confirm to quit when quit without save

set laststatus=2
if has('persistent_undo')                          "check if your vim version supports it
   set undofile                                    "turn on the feature
   " LN
   if g:os == 'win'
      set undodir=$HOME\vimfiles\undo                     "Location to store undo files
   else
      set undodir=$HOME/.vim/undo                     "Location to store undo files
   endif
   set undolevels=2000                             "Number of changes that can be undo
   set undoreload=5000                             "Number of max lines to be saved for undo
endif
" LN
if g:os == 'win'
   set directory=$HOME\vimfiles\swapfiles//
else
   set directory=$HOME/.vim/swapfiles//
endif
"Set directory for swap files
set autoindent                                     "Copy indent from current line when insert newline
set clipboard^=unnamed

set number                                         "Set line number on startup
set relativenumber                                 "Choose relave number to make moving between line easier
set numberwidth=2                                  "Number Column width

set nobackup                                       "No fucking backup
set showmatch                                      "Highlight matching parenthesis when make the other one
set showcmd                                        "Show command as you type

set textwidth=0                                    "No insert newline when max width reached
set wrapmargin=0                                   "Number of chars outside the width limit before wrapping (disable)
set formatoptions-=t                               "Keep textwidth setting in existing files
set wrap                                           "Turn off auto wrap
set showbreak=>>\                                  "Characters at the start of wrapped lines
if has('linebreak')
   set linebreak                                   "Wrap long lines at last words instead of the last characters
   set breakindent                                 "Keep the indent level after wrapping
endif

set synmaxcol=228                                  "Maximum column for syntax highlighting
set lazyredraw                                     "An attempt to make scrolling smoother

set tabstop=3                                      "Set how many columns a tab count for
set shiftwidth=3                                   "Set how many column is indented with >> and <<
set softtabstop=3                                  "How many column insert when press tab
set expandtab                                      "Convert tab into n corresponding space
set smarttab                                       "Insert tab according to shiftwidth
set backspace=2                                    "Backspace normal behaviour

set diffopt+=vertical                              "Open diff window in vertical split
set diffopt+=context:1000                          "No fold in diff mode

set noerrorbells                                   "Disable error beep
set novisualbell                                   "Disable flashing error
set t_vb=                                          "Disable error beep in terminal

if has('mksession')
   set sessionoptions-=options                     "Do not store settings and mappings in session
endif

set history=10000                                  "Set number of commands and search to be remembered
set grepprg=rg\ --vimgrep

set wildignore+=*.7z,*.bin,*.doc,*.docx,*.exe,*.ico,*.gif,*.jpg,*.jpeg,*.mp3,*.otf,*.pak,*.pdf
set wildignore+=*.png,*.ppt,*.pptx,*.rar,*.swp,*.sfdm,*.xls,*.xlsx,*.xnb,*.zip

if has('folding')
   set nofoldenable
endif

if has('GUI_running') && has('windows')
   set guitablabel=\[%N\]\ %t\ %M                  "Tabs only display file name rather than path+filename
endif
let @n = "0f>a\<CR>\<Esc>$F<i\<CR>\<Esc>j"         "Newline per tag if not
"||]
"[||[Mappings]

if g:os == 'linux' && !has('gui_running')
   " Fix alt key not working in gnome-terminal
   " if \e not work, replace with  (<C-v><C-[>)
   let charList = [
            \ 'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o',
            \ 'p','q','r','s','t','u','v','w','x','y','z','1','2','3','4',
            \ '5','6','7','8','9','0',',','.','/',';',"'",']','\','-','=']
   for char in charList
      exec "set <A-" .char. ">=\e" .char
      exec "imap \e" .char. " <A-" .char. ">"
   endfor
   exec "set <A-[>=<C-[>"
   exec "inoremap \e[ <C-[>"
endif

nnoremap <silent><Leader>S
         \ :source $MYVIMRC<Bar>
         \ :nohlsearch<CR><Bar>
         \ zi
nnoremap <Leader>tv
         \ :e $MYVIMRC<Bar>
         \ :CloseEmptyBuffer<CR>
" LN
if g:os == 'win'
   nnoremap <Leader>ta
            \ :e $HOME\desktop\.vimrc\AutoHotKey.ahk<Bar>
            \ :CloseEmptyBuffer<CR>
   nnoremap <Leader>tV
            \ :e $HOME\desktop\.vimrc\_vsvimrc<Bar>
            \ :CloseEmptyBuffer<CR>
   nnoremap <Leader>tc
            \ :e $HOME\Desktop\.vimrc\.cvimrc<Bar>
            \ :CloseEmptyBuffer<CR>
endif

"Movement
nnoremap ;   :|                                    "No need to shift ; anymore to enter command mode
nnoremap l   ;|                                    "Repeat latest f, F, t or T command (forward)
nnoremap h   ,|                                    "Repeat latest f, F, t or T command (backward)
nnoremap gh  h|                                    "Move 1 character to the right
nnoremap gl  l|                                    "Move 1 character to the left
nnoremap :   =|                                    "Indent + motion
nnoremap :: ==|                                    "Indent

vnoremap l  ;
vnoremap h  ,
vnoremap gh h
vnoremap gl l
vnoremap :  =
vnoremap :: ==


"Buffer
nnoremap <A-'> :bnext<CR>|                         "Go to the next buffer
nnoremap <A-;> :bprevious<CR>|                     "Go to the previous buffer
nnoremap <A-e> :enew<CR>|                          "Edit new buffer
nnoremap <Leader>q :bp <Bar>:bd #<CR>|             "Delete current buffer
nnoremap <Leader>x :e#<CR>|                        "Open last closed buffer (not really)

"Pane
nnoremap <A-m>     <C-w>w|                         "Cycle through panes
nnoremap <A-n>     <C-w>W|                         "Cycle through panes (backward)
nnoremap <A-r>     <C-w>r|                         "Rotate pane down/right
nnoremap <A-R>     <C-w>R|                         "Rotate pane up/left
nnoremap <Leader>L <C-w>L|                         "Move current pane to the far left
nnoremap <Leader>H <C-w>H|                         "Move current pane to the far right
nnoremap <Leader>K <C-w>K|                         "Move current pane to the very top
nnoremap <Leader>J <C-w>J|                         "Move current pane to the very bottom

"Tab
nnoremap <Leader><Tab> :tabnew<CR>|                "Make a new tab
nnoremap <A-,> :tabprevious<CR>|                   "Go to next tab
nnoremap <A-.> :tabnext<CR>|                       "Go to previous tab

nnoremap <silent><A--> :vert res -5<CR>|           "Decrease window width by 5
nnoremap <silent><A-=> :vert res +5<CR>|           "Increase window width by 5
nnoremap <silent><A-_> :resize -5<CR>|             "Decrease window height by 5
nnoremap <silent><A-+> :resize +5<CR>|             "Increase window height by 5

nnoremap <A-]> g<C-]>zz|                           "Jump to definition (Open tag list if there are more than 1 tag)
nnoremap <A-t> <C-t>zz|                            "Jump back between tag
" nnoremap <S-t> :tag<CR>zz|                         "Jump forward between tag
nnoremap <A-\> :OpenTagInVSplit<CR>zz|             "Open tag in vertical split
nnoremap ' `|                                      "' to jump to mark (line and column)
nnoremap ` '|                                      "` to jump to mark (line)
nnoremap j gj|                                     "j version that treat wrapped line as another line
nnoremap k gk|                                     "k version that treat wrapped line as another line
nnoremap 0 g0|                                     "0 version that treat wrapped line as another line
nnoremap $ g$|                                     "$ version that treat wrapped line as another line

if has('jumplist')
   nnoremap <A-o> <C-o>zz|                         "Jump back (include non-tag jump)
   nnoremap <S-o> <C-i>zz|                         "Jump forward (include non-tag jump)
   nnoremap <A-9> g;zz|                            "Jump backward
   nnoremap <A-0> g,zz|                            "Jump forward
endif

"Create a fold for the paragraph
nnoremap zp
         \ :set foldmethod=manual<CR><Bar>
         \ vapkzf<Bar>

"Diff Mappings
nnoremap <expr><silent> J near#utils#NmapJ()|                 "In diff mode: go to next change
nnoremap <expr><silent> K near#utils#NmapK()|                 "In diff mode: go to previous change
nnoremap <expr><silent> du near#utils#Nmap_du()|              "Update diff if it doesnt update automatically
nnoremap <expr><silent> q near#utils#Nmap_q()|                "Quit Key in diff

command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|copen 20|redraw!
nnoremap Kh :OpenHelpInTab<CR>|                    "Open help about the word under cursor
nnoremap Ka
         \ :grep! "<C-R><C-W>"<CR><Bar>
         \ :copen 20<CR>|                          "Find word under cursor in current working directory
nnoremap <Leader>a :Ag<Space>|                     "Ag search (just like grep but faster) (example: Ag <Query> /<Dir>)
nnoremap <Leader>cp :CtrlP<Space>|                 "CtrlP search

nnoremap zo zozz|                                  "Open fold and zz
nnoremap zc zczz|                                  "Close fold and zz
nnoremap za zazz|                                  "Toggle fold and zz
nnoremap zm zmzz|                                  "Toggle fold and zz
nnoremap z[ zo[z|                                  "Open fold, jump at the start and zz
nnoremap z] zo]z|                                  "Open fold, jump at the end and zz
nnoremap ]z ]zzz|                                  "jump at the end and zz
nnoremap [z [zzz|                                  "jump at the start and zz
nnoremap <Leader>z zMzvzz|                         "Open current fold and close all other fold outside

"Pair mappings
nnoremap ]t :tnext<CR>|                            "Go to next tag in the tag list
nnoremap [t :tprevious<CR>|                        "Go to next tag in the tag list
nnoremap ]c ]czz|                                  "Jump forward change and zz
nnoremap [c [czz|                                  "Jump backward change and zz
nnoremap ]q :cnext<CR>|                            "Jump to the next quickfix item
nnoremap [q :cprev<CR>|                            "Jump to the previous quickfix item
nnoremap ]Q :clast<CR>|                            "Jump to the previous quickfix item
nnoremap [Q :cfirst<CR>|                           "Jump to the previous quickfix item

"Add more control in insert mode
inoremap <A-9> <C-w>|                              "Delete previous word
inoremap <A-0> <Esc>lmaed`axi|                     "Delete next word
inoremap <A-Space> <BS>|                           "Delete 1 character
inoremap <A-;> <C-Left>|                           "Go to the previous word
inoremap <A-'> <C-Right>|                          "Go to the next word
inoremap <A-r> <C-r>|                              "Insert register ...
inoremap <A-m> <Esc>zzli|                          "Make current line the center of window
inoremap <S-Tab> <C-p>|                            "Go to previous selection in comepletion menu

inoremap <expr><A-n>   pumvisible() ? "\<Down>"        : "\<C-n>"
inoremap <expr><A-p>   pumvisible() ? "\<Up>"          : ""
inoremap <expr><A-j>   pumvisible() ? "\<C-x>\<Down>"  : "\<Down>"
inoremap <expr><A-k>   pumvisible() ? "\<C-x>\<Up>"    : "\<Up>"
inoremap <expr><A-h>   pumvisible() ? "\<C-x>\<Left>"  : "\<Left>"
inoremap <expr><A-l>   pumvisible() ? "\<C-x>\<Right>" : "\<Right>"
inoremap <expr><A-,>   pumvisible() ? "\<PageUp>"      : "\<Home>"
inoremap <expr><A-.>   pumvisible() ? "\<PageDown>"    : "\<End>"
inoremap <expr><A-e>   pumvisible() ? "\<C-y>"         : ""
inoremap <expr><A-u>   pumvisible() ? "\<C-x>"         : "\<Esc>0Di"

" |-------+-----------------------------------------------------+---------------------------------|
" |       |                               Pop up visible                                          |
" |-------+-----------------------------------------------------+---------------------------------|
" |  key  |                       on                            |              off                |
" |-------+-----------------------------------------------------+---------------------------------|
" | <A-n> | Select next match in completion menu                | Open completion menu            |
" | <A-p> | Select previous match in completion menu            |                                 |
" | <A-j> | Turn off completion menu and go down one line       | Go down one line                |
" | <A-k> | Turn off completion menu and go up one line         | Go up one line                  |
" | <A-h> | Turn off completion menu and go 1 char to the left  | Go 1 char to the left           |
" | <A-l> | Turn off completion menu and go 1 char to the right | Go 1 char to the right          |
" | <A-,> | Go up 1 page in completion menu                     | Go to the beginning of the line |
" | <A-.> | Go down 1 page in completion menu                   | Go to the end of the line       |
" | <A-e> | Choose match                                        |                                 |
" | <A-u> | Turn off completion menu                            | Delete current line             |
" |-------+-----------------------------------------------------+---------------------------------|

inoremap <A-r> <C-r>*|                             "Paste in insert mode

inoremap <A-i> <Esc><Right>|                       "Switch to normal mode from insert mode
vnoremap <A-i> <Esc>|                              "Switch to normal mode from visual mode
snoremap <A-i> <Esc>|                              "Switch to normal mode from select mode
cnoremap <A-i> <C-c>|                              "Switch to normal mode from command mode

"Visual mappings
nnoremap gV `[v`]|                                 "Visual select the last inserted text
vnoremap <silent> <A-k> 2<C-y>2k2<C-y>2k2<C-y>2k|  "Scroll 2 line above
vnoremap <silent> <A-j> 2<C-e>2j2<C-e>2j2<C-e>2j|  "Scroll 2 line below
vnoremap <silent> <A-l> 5<C-e>5j5<C-e>5j5<C-e>5j|  "Scroll 5 line above
vnoremap <silent> <A-h> 5<C-y>5k5<C-y>5k5<C-y>5k|  "Scroll 5 line below

vnoremap Kh y:OpenHelpInTab <C-r>"<CR>|           "Open help about the word under cursor
vnoremap Ka
         \ y:grep! "<C-R>""<CR><Bar>
         \ :copen 20<CR>|                          "Find word under cursor in current working directory
vnoremap <Leader>a y:Ag <C-r>"<Space>|             "Ag search (just like grep but faster)
vnoremap <Leader>c y:CtrlP <C-r>"<CR>|             "CtrlP search
vnoremap ; y:<C-r>"<CR>|                           "Execute selected command in visual block

nnoremap <A-v> <C-q>|                              "Visual block
vnoremap <A-v> <C-q>|                              "Visual block (Use to switch to VBlock from Visual)

"Command mode mappings
cnoremap <A-k> <C-r><C-w>|                         "Insert word under cursor
cnoremap <A-a> <C-r><C-a>|                         "Insert WORD under cursor
cnoremap <A-9> <C-w>|                              "Delete previous word
cnoremap <A-0> <C-Right><C-w><BS>|                 "Delete forward word (Work for 1 whitespace only)
cnoremap <A-Space> <BS>|                           "Delete 1 character
cnoremap <A-u> <End><C-u>|                         "Delete current line
cnoremap <A-;> <C-Left>|                           "Backward one word
cnoremap <A-'> <C-Right>|                          "Forward one nail word
cnoremap <A-n> <C-n>|                              "Go to the next command in history
cnoremap <A-p> <C-p>|                              "Go to the previous command in history
cnoremap <A-j> <C-n>|                              "Go to the next command in history
cnoremap <A-k> <C-p>|                              "Go to the previous command in history
cnoremap <A-h> <Left>|                             "Go to the left one character
cnoremap <A-l> <Right>|                            "Go to the right one character
cnoremap <A-,> <Home>|                             "Move to the beginning of the line
cnoremap <A-.> <End>|                              "Move to the end of the line
cnoremap <silent><A-y> <C-f>yy:q<CR>|              "Copy command content
cnoremap <A-r> <C-r>*|                             "Paste yanked text in command line

nnoremap { {zz|                                    "Jump between paragraph (backward) and zz
nnoremap } }zz|                                    "Jump between paragraph (forward) and zz
nnoremap % %zz|                                    "Jump between curly braces ("{", "}") and zz

"Replace Mappings
vnoremap <Leader>rf y:%s/<C-r>"/|                  "Replace in whole file with query is the selected word
vnoremap <Leader>rb y:bufdo %s/<C-r>"/|            "Replace across opening buffers with query is the selected word
vnoremap <Leader>rr 
         \y:.,.+s/<C-r>"/<Home>
         \<Right><Right><Right><Right>|            "Replace from current line to ... with query is the selected word
nnoremap <Leader>rf :%s/|                          "Replace in whole file
nnoremap <Leader>rb :bufdo %s/|                    "Replace across opening buffers
nnoremap <Leader>rr :.,.+s//<Left><Left><Left>|    "Replace from current line to ...

" Search mappings
nnoremap n nzz
nnoremap N Nzz

"Misc Mappings
nnoremap U :later 1f<CR>|                          "Go to the latest change
nnoremap <F8> mzggg?G`z|                           "Encrypted with ROT13, just for fun
nnoremap Q @q|                                     "Execute macro
vnoremap > >gv|                                    "Make indent easier
vnoremap < <gv|                                    "Make indent easier
nnoremap <leader>py :echom expand("%:p")<CR>|      "Echo current file path
nnoremap <A-u> <C-r>|                              "Redo
nnoremap <A-F1> :ToggleMenuBar<CR>|                "Toggle menu bar
nnoremap <Leader>N :nohlsearch<CR>|                "diable highlight result
nnoremap <A-Space> a<Space><Left><esc>|            "Insert a whitespace
nnoremap <Enter> o<Esc>|                           "Make new line
nnoremap Y y$|                                     "Make Y yank to endline (same behaviours as D or R)
nnoremap <C-w> :ToggleWrap<CR>|                     "Toggle wrap option
nnoremap <C-o> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
nnoremap - :w<CR>|                                 "Write changes
nnoremap <silent><Leader>tV :call near#utils#ToggleVerbose()<CR>

"Abbreviation
cabbrev vbnm verbose<Space>nmap
cabbrev vbim verbose<Space>imap
cabbrev vbvm verbose<Space>vmap
cabbrev vbcm verbose<Space>cmap

cabbrev cund  C:\Users\Near\Desktop<C-r>=s:Eatchar('\m\s\<Bar>/')<CR>
cabbrev dprf  D:\Program Files<C-r>=s:Eatchar('\m\s\<Bar>/')<CR>
cabbrev dprf8 D:\Program Files (x86)<C-r>=s:Eatchar('\m\s\<Bar>/')<CR>
cabbrev dprfp D:\Program Files\Github\plugged<C-r>=s:Eatchar('\m\s\<Bar>/')<CR>
cabbrev eprf  E:\Program Files<C-r>=s:Eatchar('\m\s\<Bar>/')<CR>
cabbrev eprf8 E:\Program Files (x86)<C-r>=s:Eatchar('\m\s\<Bar>/')<CR>

"Command definition
command! ToggleMenuBar                          call near#utils#ToggleMenuBar()
command! ToggleHeader                           call near#utils#ToggleHeader()
command! -nargs=? -complete=help OpenHelpInTab  call near#utils#OpenHelpInTab(<q-args>)
command! CloseEmptyBuffer                       call <SID>CloseEmptyBuffer()
command! -nargs=+ -complete=command RedirInTab  call near#utils#RedirInTab(<q-args>)
command! -nargs=+ ExistsInTab                   echo near#utils#ExistsInTab(<f-args>)
command! OpenTagInVSplit                        call near#utils#OpenTagInVSplit()
command! TrimWhitespace                         call near#utils#TrimWhitespace()
command! ToggleWrap                             call near#utils#ToggleWrap()
command! MakeSymlink                            call near#utils#MakeSymlink()
command! CscopeLoad                             call near#utils#CscopeLoad()
command! ToggleVerbose                          call near#utils#ToggleVerbose()
"||]
"[||[Vim-plug]
" LN
if g:os == 'win'
   let s:pluggedPath = '~\vimfiles\plugged'
else
   let s:pluggedPath = '~/.vim/plugged'
endif

call plug#begin(s:pluggedPath)
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

Plug 'haya14busa/incsearch.vim', {'on': [
         \ '<Plug>(incsearch-forward)',
         \ '<Plug>(incsearch-backward)',
         \ '<Plug>(incsearch-stay)',
         \ '<Plug>(incsearch-nohl-n)',
         \ '<Plug>(incsearch-nohl-N)',
         \ '<Plug>(incsearch-nohl-*)',
         \ '<Plug>(incsearch-nohl-#)',
         \ '<Plug>(incsearch-nohl-g*)',
         \ '<Plug>(incsearch-nohl-g#)'
         \ ]}
Plug 'bling/vim-bufferline'

Plug 'scrooloose/nerdtree', {'on': [
         \ 'NERDTreeTabsToggle',
         \ 'NERDTreeFind'
         \ ]}
Plug 'jistr/vim-nerdtree-tabs', {'on': [
         \ 'NERDTreeTabsToggle',
         \ 'NERDTreeFind'
         \ ]}

Plug 'vim-utils/vim-man', {'on': []}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch', {'on': [
         \ 'Delete',
         \ 'Unlink',
         \ 'Move',
         \ 'Rename',
         \ 'Chmod',
         \ 'Mkdir',
         \ 'Find',
         \ 'Locate',
         \ 'Wall',
         \ 'SudoWrite',
         \ 'SudoEdit'
         \ ]}

Plug 'xolox/vim-misc'
Plug 'xolox/vim-shell'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-session'

Plug 'vim-scripts/OmniCppComplete', {'for': 'cpp'}

Plug 'terryma/vim-smooth-scroll'

Plug 'tiagofumo/vim-nerdtree-syntax-highlight', {'on': [
         \ 'NERDTreeTabsToggle',
         \ 'NERDTreeFind'
         \ ]}
Plug 'octol/vim-cpp-enhanced-highlight', {'for': 'cpp'}
Plug 'pangloss/vim-javascript', {'on': []}
Plug 'flowtype/vim-flow'
Plug 'othree/html5.vim', {'on': []}
Plug 'altercation/vim-colors-solarized'
Plug 'dhruvasagar/vim-table-mode', {'on': 'TableModeToggle'}
Plug 'ap/vim-css-color'
Plug 'whatyouhide/vim-gotham'
Plug 'lifepillar/vim-solarized8'

Plug 'junegunn/limelight.vim',  {'on': 'Limelight!!'}
Plug 'junegunn/goyo.vim',       {'on': 'Goyo'}
Plug 'junegunn/vim-easy-align', {'on': '<Plug>(EasyAlign)'}

Plug 'tpope/vim-commentary', {'on': [
         \ '<Plug>Commentary',
         \ '<Plug>CommentaryLine'
         \ ]}
Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips', {'on': [
         \ 'UltiSnipsEdit',
         \ 'UltiSnipsEdit!'
         \ ]}
Plug 'mattn/emmet-vim', {'on': ['EmmetInstall']}
Plug 'jiangmiao/auto-pairs' ", {'on': []}
Plug 'tpope/vim-surround', {'on': [
         \ '<Plug>Ysurround',
         \ '<Plug>Dsurround',
         \ '<Plug>Csurround',
         \ '<Plug>CSurround',
         \ '<Plug>Ysurround',
         \ '<Plug>YSurround',
         \ '<Plug>Yssurround',
         \ '<Plug>YSsurround',
         \ '<Plug>YSsurround',
         \ '<Plug>VSurround',
         \ '<Plug>VgSurround'
         \ ]}
Plug 'Ron89/thesaurus_query.vim', {'on': [
         \ 'ThesaurusQueryReplaceCurrentWord',
         \ 'Thesaurus',
         \ 'ThesaurusQueryReplace'
         \ ]}

Plug 'shougo/neocomplete.vim', {'on': []}
Plug 'Shougo/neoinclude.vim',  {'on': []}
Plug 'Shougo/neco-syntax',     {'on': []}
Plug 'Shougo/neco-vim',        {'on': []}

Plug 'gioele/vim-autoswap'
Plug 'Konfekt/FastFold'

Plug 'NearHuscarl/gundo.vim', {'on': 'GundoToggle'}

Plug 'drmikehenry/vim-fontsize', {'on': [
         \ '<Plug>FontsizeInc',
         \ '<Plug>FontsizeDec'
         \ ]}
" Plug 'powerline/fonts'
call plug#end()

let g:plug_window = "vertical botright new"

nnoremap <Leader>pc :PlugClean<CR>|                    "Clean directory
nnoremap <Leader>pC :PlugClean!<CR>|                   "Clean directory
nnoremap <Leader>ps :PlugStatus<CR>|                   "Check plugin status
nnoremap <Leader>pd :PlugDiff<CR>|                     "Show changes between update
nnoremap <Leader>pi :PlugInstall<Space><C-d>|          "Install new plugin
vnoremap <Leader>pi y:PlugInstall<Space><C-r>"<CR>|    "Install plugin under cursor
nnoremap <Leader>pv :PlugUpgrade<CR>|                  "Update vim-plug
nnoremap <Leader>pu :PlugUpdate<Space><C-d>|           "Update other plugins
vnoremap <Leader>pu y:PlugUpdate<Space><C-r>"<CR>|     "Update plugin under cursor
"||]
"[||[Auto Pairs]
autocmd InsertEnter * :silent! all autopairs#AutoPairsTryInit()
let g:AutoPairsMoveCharacter      = ''
let g:AutoPairsShortcutJump       = ''
let g:AutoPairsShortcutToggle     = ''
let g:AutoPairsShortcutFastWrap   = ''
let g:AutoPairsShortcutBackInsert = ''
"||]
"[||[Smooth Scroll]
nnoremap <silent> <A-j> :call smooth_scroll#down(6, 0, 2)<CR>
nnoremap <silent> <A-k> :call smooth_scroll#up(6, 0, 2)<CR>
nnoremap <silent> <A-l> :call smooth_scroll#down(15, 0, 3)<CR>
nnoremap <silent> <A-h> :call smooth_scroll#up(15, 0, 3)<CR>
nnoremap <silent> H     :call smooth_scroll#up(40, 0, 10)<CR>
nnoremap <silent> L     :call smooth_scroll#down(40, 0, 10)<CR>
" LN
if g:os == 'win'
   let s:smoothScrollPath = '~\vimfiles\plugged\vim-smooth-scroll\autoload\smooth_scroll.vim'
else
   let s:smoothScrollPath = '~/.vim/plugged/vim-smooth-scroll/autoload/smooth_scroll.vim'
endif
if empty(glob(s:smoothScrollPath))
   nnoremap <silent><A-j> 3<C-e>3j
   nnoremap <silent><A-k> 3<C-y>3k
   nnoremap <silent><A-l> 10<C-e>10j
   nnoremap <silent><A-h> 10<C-y>10k
endif
"||]
"[||[FastFold]
let g:fastfold_fold_command_suffixes  = []
let g:fastfold_fold_movement_commands = []
let g:fastfold_skip_filetypes         = ['vim', 'py']
"||]
"[||[Fugitive]
nnoremap <Leader>gst :Gstatus<CR>|                 "Git status in vim!
nnoremap <Leader>ga  :Git add %:p<CR>|             "Git add in vim!
nnoremap <Leader>gbl :Gblame<CR>|                  "Git blame in vim!
nnoremap <Leader>gw  :Gwrite<CR>|                  "Git write in vim!
nnoremap <Leader>gr  :Gread<CR>|                   "Git read in vim!
nnoremap <Leader>gd  :Gdiff<CR>|                   "Git diff in vim!
nnoremap <Leader>gD  :Gdiff<Space><C-d>|           "Git diff in vim!
nnoremap <Leader>gpl :Gpull<CR>|                   "Git pull in vim!
nnoremap <Leader>gPL :Gpull<Space><C-d>|           "Git pull in vim!
nnoremap <Leader>gps :Gpush<CR>|                   "Git push in vim!
nnoremap <Leader>gPS :Gpush<Space><C-d>|           "Git push in vim!
nnoremap <Leader>gm  :Gmove<CR>|                   "Git move in vim!
nnoremap <Leader>gM  :Gmove<Space><C-d>|           "Git move in vim!
nnoremap <Leader>gc  :Gcommit<CR>|                 "Git commmit in vim!
nnoremap <Leader>gC  :Gcommit<Space><C-d>|         "Git commmit in vim!
nnoremap <Leader>gbr :Gbrowse<CR>|                 "Open current file on github
nnoremap <Leader>gBR :Gbrowse<Space><C-d>|         "Open current file on github
nnoremap <Leader>gg  :Ggrep! <C-r><C-w><CR><CR>|   "Find word under cursor in repo
nnoremap <Leader>gl
         \ :Glog!<CR><Bar>
         \ :bot copen<CR>|                         "Load all version before
nnoremap <Leader>gL  :Glog!<Space><C-d>|           "Load all version before
nnoremap <Leader>gsc :Glog! --grep= -- %<C-Left><C-Left><Left>| "Search for commit message
nnoremap <Leader>gsd :Glog! -S -- %<C-Left><C-Left><Left>|      "Search content in diffs history
nnoremap <silent><Leader>gh 
         \ :!"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "https://github.com/NearHuscarl/.vimrc/commits/master/_vimrc"<CR><CR>
"||]
"[||[fzf]
" Recommend: use with vim-rooter
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,html,config,py,conf,vim}"
  \ -g "{00_config,config}"
  \ -g "!{.git,node_modules,vendor}/*" '

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Conditional'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'PreProc'],
  \ 'info':    ['fg', 'String'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'String'],
  \ 'marker':  ['fg', 'PreProc'],
  \ 'spinner': ['fg', 'String'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzfOpt='--bind=
         \alt-k:up,
         \alt-j:down,
         \alt-i:abort,
         \alt-h:backward-char,
         \alt-l:forward-char,
         \alt-n:backward-word,
         \alt-m:forward-word,
         \alt-e:jump,
         \alt-v:toggle,
         \alt-t:kill-line'

command! -bang -nargs=* Grep
         \ call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, {'options': g:fzfOpt}, <bang>0)
command! -bang Colors
         \ call fzf#vim#colors({'options': g:fzfOpt}, <bang>0)
command! -bang -nargs=? -complete=dir Files
         \ call fzf#vim#files(<q-args>, {'options': g:fzfOpt}, <bang>0)
command! -bang -nargs=* History
         \ call fzf#vim#history({'options': g:fzfOpt}, <bang>0)
command! -bang Helptags
         \ call fzf#vim#helptags({'options': g:fzfOpt}, <bang>0)
command! -bang Tags
         \ call fzf#vim#tags(<q-args>, {'options': g:fzfOpt}, <bang>0)
command! -bang Maps
         \ call fzf#vim#maps(<q-args>, {'options': g:fzfOpt}, <bang>0)
command! -bang -nargs=* Lines
         \ call fzf#vim#lines({'options': g:fzfOpt}, <bang>0)
command! -bang -nargs=? -complete=buffer Buffers
         \ call fzf#vim#buffers({'options': g:fzfOpt}, <bang>0)

nnoremap gr :Grep<Space>
nnoremap <Leader>rg :Grep<CR>
nnoremap <Leader>e/ :Files /<CR>
nnoremap <Leader>er :Files<CR>         " when using with vim-rooter, search for files in root project folder
nnoremap <Leader>eh :Files $HOME<CR>
nnoremap <Leader>em :History<CR>
nnoremap <Leader>h  :Helptags<CR>
nnoremap <Leader>j  :Tags<CR>
nnoremap <Leader>m  :Maps<CR>
nnoremap <Leader>l  :Lines<CR>
nnoremap <Leader>b  :Buffers<CR>
"||]
"[||[vim-rooter]
let g:rooter_silent_chdir = 1
"||]
"[||[Gundo]
if has('python3') && !has('python')
   let g:gundo_prefer_python3 = 1
endif

nnoremap <Leader>u :GundoToggle<CR>
let gundo_map_move_older = ""
let gundo_map_move_newer = ""
let g:gundo_preview_height   = 11
let g:gundo_preview_bottom   = 1
let g:gundo_right            = 0
let g:gundo_help             = 0
let g:gundo_return_on_revert = 0
let g:gundo_auto_preview     = 1
"||]
"[||[Bufferline]
let g:bufferline_active_buffer_left  = '['
let g:bufferline_active_buffer_right = ']'
let g:bufferline_rotate              = 2
let g:bufferline_solo_highlight      = 1
"||]
"[||[Commentary]
map  gc  <Plug>Commentary
nmap gcc <Plug>CommentaryLine
nmap gCC gggcG
"||]
"[||[Syntax Highlight]
let g:NERDTreeHighlightFolders               = 1 " Enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName       = 1 " Highlights the folder name
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName    = 1
let g:NERDTreePatternMatchHighlightFullName  = 1
"||]
"[||[Easy Align]
vmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
let g:easy_align_ignore_groups = []       " Vim Align ignore comment by default
"||]
"[||[Easy Tag]
let g:easytags_opts = ['--exclude=*vim/plugged/']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_events = ['BufWritePost']
let g:easytags_auto_highlight = 0
"||]
"[||[Emmet]
let g:user_emmet_install_global = 0

autocmd InsertEnter *.html,*.css EmmetInstall
let g:user_emmet_mode='a'
let g:user_emmet_leader_key    = '<A-o>'
let g:user_emmet_next_key      = '<A-o>n'
let g:user_emmet_prev_key      = '<A-o>p'
let g:user_emmet_removetag_key = '<A-o>r'
"||]
"[||[Eunuch]
nnoremap <Leader>- :SudoWrite<CR>
"||]
"[||[Incsearch]
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

map n  <Plug>(incsearch-nohl-n)zz
map N  <Plug>(incsearch-nohl-N)zz
map *  <Plug>(incsearch-nohl-*)zz
map #  <Plug>(incsearch-nohl-#)zz
map g* <Plug>(incsearch-nohl-g*)zz
map g# <Plug>(incsearch-nohl-g#)zz
"||]
"[||[Fontsize]
let g:fontsize#defaultSize = 8
nmap <silent><A-Up>   <Plug>FontsizeInc
nmap <silent><A-Down> <Plug>FontsizeDec
"||]
"[||[Goyo]
let g:goyo_width  = 110
let g:goyo_height = 100
let g:goyo_enable = 0

nnoremap <silent>go :call near#utils#ToggleGoyo(goyo_enable)<CR>
"||]
"[||[Limelight]
nmap <silent>gLL ;Limelight!!<CR>
nmap gLl <Plug>(Limelight)|                  "Motion (normal mode)
xmap gLl <Plug>(Limelight)|                  "Motion (viusal mode)
let g:limelight_priority = -1                      "Do not overrule hlsearch
"||]
"[||[Session]
" LN
if g:os == 'win'
   let g:session_directory    = $HOME.'\vimfiles\session'
else
   let g:session_directory    = $HOME.'/.vim/session'
endif
let g:session_autoload     = 'no'
let g:session_autosave     = 'yes'
let g:session_autosave_to  = 'AutoSave'
let g:session_default_name = 'Default'

"OpenSession -> SessionOpen 
"ViewSession -> SessionView 
let g:session_command_aliases = 1

nnoremap <silent><Leader>so :call near#utils#SOpenLazyLoad()<CR>
nnoremap <silent><Leader>ss :call near#utils#SSaveLazyLoad()<CR>
nnoremap <silent><Leader>sS :call near#utils#SSAVELazyLoad()<CR>
nnoremap <silent><Leader>sc :call near#utils#SCloseLazyLoad()<CR>
nnoremap <silent><Leader>sd :call near#utils#SDeleteLazyLoad()<CR>
nnoremap <silent><Leader>sv :call near#utils#SViewLazyLoad()<CR>
nnoremap <silent><Leader>sV :call near#utils#SVIEWLazyLoad()<CR>
"||]
"[||[Surround]
nmap ds  <Plug>Dsurround
nmap cs  <Plug>Csurround
nmap cS  <Plug>CSurround
nmap ys  <Plug>Ysurround
nmap yS  <Plug>YSurround
nmap yss <Plug>Yssurround
nmap ySs <Plug>YSsurround
xmap S   <Plug>VSurround
xmap gS  <Plug>VgSurround
"||]
"[||[Thesaurus Query]
"Require internet
if has('python3')
   let g:tq_python_version          = 3
   let g:tq_mthesaur_file           = "C:/Users/Near/Desktop/.vimrc/ignore/thesaurus/mthesaur.txt"
   let g:tq_online_backends_timeout = 0.6

   nnoremap <Leader>to :Thesaurus<Space>
   nnoremap Kt :ThesaurusQueryReplaceCurrentWord<CR>
   vnoremap Kt y:ThesaurusQueryReplace <C-r>"<CR>
endif
"||]
"[||[Table Mode]
inoremap <A-t> <Esc>:TableModeToggle<CR>a
"||]
"[||[Vim-man]
" ../vim-man/plugin/man.vim
command! -nargs=* -bar -complete=customlist,man#completion#run Man  
         \ call plug#load('vim-man')
         \|call man#get_page('horizontal', <f-args>)
"||]
"[||[Neocomplete]
let g:neocomplete#enable_at_startup                 = 1 " Use neocomplete.
let g:neocomplete#enable_smart_case                 = 1 " Use smartcase.
let g:NeoCompleteAutoCompletionLength               = 3 " Set minimum char to trigger Autocomplete
let g:neocomplete#sources#syntax#min_keyword_length = 3 " Set minimum syntax keyword length.
let g:neocomplete#enable_auto_delimiter             = 1
let g:neocomplete#auto_complete_delay               = 100
let g:neocomplete#sources#omni#functions            = ['cpp']

" Enable omni completion.
autocmd FileType css           setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags
"||]
"[||[NERDTree]
nnoremap <silent><Leader>nt :NERDTreeTabsToggle<CR>| "Toggle NERDTree and move cursor back to the last window
nnoremap <silent><Leader>nf :NERDTreeFind<CR>|       " Press <Leader>Nf to go to the directory where current file is openned

let NERDTreeMapOpenVSplit    = 'v'                   " vsplit (default was s)
let NERDTreeMapOpenSplit     = 'x'                   " hsplit (default was i)
let g:NERDTreeMapMenu        = 'M'                   " Solve conflict with vim-signature
let NERDTreeShowBookmarks    = 1                     " Open Bookmark at startup
let NERDTreeBookmarksSort    = 1                     " Sort the bookmark
let NERDTreeShowLineNumbers  = 1                     " Enable line numbers
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI        = 1
let NERDTreeShowHidden       = 1
let NERDTreeIgnore           = ['NTUSER.DAT*']
set ambiwidth=double

" autocmd StdinReadPre * let s:std_in = 1              " Open NERDTree automatically when vim start up on opening a directory
" autocmd VimEnter *
"          \ if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in")
"          \|    execute 'NERDTree' argv()[0]
"          \|    wincmd p
"          \|    enew
"          \|endif
autocmd BufEnter *
         \ if(winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree())
         \|    q
         \|endif " Close NERDTree automatically if it's the only buffer left

if has('GUI_running')
   let g:NERDTreeDirArrowExpandable  = '►'
   let g:NERDTreeDirArrowCollapsible = '▼'
else "Console
   let g:NERDTreeDirArrowExpandable  = '+'
   let g:NERDTreeDirArrowCollapsible = '-'
endif
"||]
"[||[Ultisnips]
nnoremap <Leader>U :UltiSnipsEdit<CR>|                            " Open new file to define snippets
nnoremap <Leader><Leader>U :UltiSnipsEdit!<CR>|                   " Open all available files to select
inoremap <silent><Tab> <C-R>=near#utils#UltiSnips_Complete()<CR>

" LN
if g:os == 'win'
   let g:UltiSnipsSnippetsDir = $HOME.'\vimfiles\snippet' " Custom snippets stored here
else
   let g:UltiSnipsSnippetsDir = $HOME.'/.vim/snippet'                 " Custom snippets stored here
endif
let g:UltiSnipsSnippetDirectories  = ["UltiSnips","snippet"]        " Directories list for ultisnips to search
let g:UltiSnipsEditSplit           = 'normal'
let g:UltiSnipsExpandTrigger       = "<Tab>"
let g:UltiSnipsListSnippets        = "<C-e>"
let g:UltiSnipsJumpForwardTrigger  = "<A-j>"
let g:UltiSnipsJumpBackwardTrigger = "<A-k>"
"||]
"[||[Function]
"[||BufferIsEmpty()
function! s:BufferIsEmpty()
    if (line('$') == 1 && getline(1) == '') && (filereadable(@%) == 0)
        return 1
    endif
    return 0
endfunction
"||]
"[||CloseEmptyBuffer()
function! s:CloseEmptyBuffer()
   let t:NumOfWin = winnr('$')
   while t:NumOfWin >= 1
      execute "wincmd p"
      if s:BufferIsEmpty()
         while s:BufferIsEmpty() && t:NumOfWin >= 1
            execute "bdelete"
            let t:NumOfWin -= 1
         endwhile
      endif
      let t:NumOfWin -= 1
   endwhile
endfunction
"||]
"[||Eatchar(pat)
function! s:Eatchar(pat)
   let c = nr2char(getchar(0))
   return (c =~ a:pat) ? '' : c
endfunction
"||]
"||]
"[||[Autocmd]
highlight ntCursor guifg=NONE guibg=NONE
let blacklist = ['nerdtree', 'qf', 'gundo', 'fugitiveblame', 'vim-plug']

autocmd BufEnter *
         \ if(index(blacklist, &filetype) < 0)
         \|    silent! lcd %:p:h
         \|    execute "set guicursor&"
         \|else | set guicursor=c-n-ve-i-r:ntCursor | endif
         \|if(&filetype == 'help')     | execute "CloseEmptyBuffer" | endif
         \|if(&diff || &ft == 'gundo') | set timeout timeoutlen=0   | endif
         \|set cursorline
         \|set number
         \|set relativenumber
         \|if exists('b:winView') | call winrestview(b:winView) | endif
         \|call statusline#SetStatusline()

autocmd BufLeave *
         \ set foldcolumn=0
         \|setlocal statusline=\ %{bufnr('%')}\ \|\ %{expand('%:t')}
         \|set nocursorline
         \|set norelativenumber
         \|let b:winView = winsaveview()
         \|if (&diff || &ft == 'gundo') | set timeout& timeoutlen& | endif

autocmd BufLeave *.cpp        normal! mC
autocmd BufLeave *.h          normal! mH
autocmd BufLeave _vimrc,*.vim normal! mV
autocmd BufLeave *.md         normal! mM

if exists('AutoPairs')
   autocmd BufEnter *.html let g:AutoPairs["<"] = '>'
   autocmd BufLeave *.html unlet g:AutoPairs["<"]
endif

autocmd BufReadPost *
         \ if line("'\"") >= 1 && line("'\"") <= line("$")
         \|  execute "normal! g`\""
         \|endif

"Retab to convert tab to space
autocmd BufRead *.cpp,*.py
         \ silent! execute "normal! gg=G"
         \|silent! :retab

autocmd QuickFixCmdPost * cwindow
autocmd cursorhold * 
         \ nohlsearch
         \|let g:fileSize  = statusline#SetFileSize()
         \|let g:wordCount = statusline#SetWordCount()

autocmd BufWritePost * let g:lastModified = statusline#SetLastModified()
autocmd InsertEnter * 
         \ execute "normal! ma"
         \|call plug#load('neco-vim', 'neco-syntax', 'neoinclude.vim', 'neocomplete.vim', 'ultisnips')
         \|execute "normal! g`a"
 
autocmd FocusLost * if &modified && filereadable(expand("%:p")) | write | endif
autocmd BufWritePre * call near#utils#SetLastChangeBeforeBufWrite() 

if has('gui_running')
   if g:os == 'linux'
      autocmd VimEnter * call system('wmctrl -i -b add,maximized_vert,maximized_horz -r '.v:windowid)
   elseif g:os == 'win'
      autocmd GUIEnter * simalt ~x            "Open vim in maximum winow size
   endif
endif
"||]

command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78
