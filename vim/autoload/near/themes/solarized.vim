function! near#themes#solarized#isAvailable()
endfunc

let s:base0   = { 'gui': "#002b36", 'cterm':  8 }
let s:base1   = { 'gui': "#073642", 'cterm':  0 }
let s:base2   = { 'gui': "#586e75", 'cterm': 10 }
let s:base3   = { 'gui': "#657b83", 'cterm': 11 }
let s:base4   = { 'gui': "#839496", 'cterm': 12 }
let s:base5   = { 'gui': "#93a1a1", 'cterm': 14 }
let s:base6   = { 'gui': "#eee8d5", 'cterm':  7 }
let s:base7   = { 'gui': "#fdf6e3", 'cterm': 15 }

let s:red     = { 'gui': "#dc322f", 'cterm':  1 }
let s:orange  = { 'gui': "#cb4b16", 'cterm':  9 }
let s:yellow  = { 'gui': "#b58900", 'cterm':  3 }
let s:magenta = { 'gui': "#d33682", 'cterm':  5 }
let s:violet  = { 'gui': "#6c71c4", 'cterm': 13 }
let s:blue    = { 'gui': "#268bd2", 'cterm':  4 }
let s:cyan    = { 'gui': "#2aa198", 'cterm':  6 }
let s:green   = { 'gui': "#859900", 'cterm':  2 }

let g:near#themes#solarized#normal  = { 'fg': s:base7,  'bg': s:blue    }
let g:near#themes#solarized#insert  = { 'fg': s:base7,  'bg': s:green   }
let g:near#themes#solarized#visual  = { 'fg': s:base6,  'bg': s:magenta }
let g:near#themes#solarized#vLine   = { 'fg': s:base6,  'bg': s:violet  }
let g:near#themes#solarized#vBlock  = { 'fg': s:base6,  'bg': s:orange  }
let g:near#themes#solarized#replace = { 'fg': s:base6,  'bg': s:red     }
let g:near#themes#solarized#prompt  = { 'fg': s:yellow, 'bg': s:base2   }

let g:near#themes#solarized#inactive = { 'fg': s:base5,  'bg': s:base1  }| " StatusLineNC
let g:near#themes#solarized#filename = { 'fg': s:base5,  'bg': s:base1  }| " User1
let g:near#themes#solarized#modified = { 'fg': s:base1,  'bg': s:base5  }| " User1
let g:near#themes#solarized#main     = { 'fg': s:base5,  'bg': s:base1  }| " User2
let g:near#themes#solarized#branch   = { 'fg': s:base1,  'bg': s:base5  }| " User3
let g:near#themes#solarized#plugin   = { 'fg': s:base6,  'bg': s:yellow }| " User4
let g:near#themes#solarized#none     = { 'fg': s:base5,  'bg': s:base0  }| " User9 - Transparent
