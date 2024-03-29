function! near#themes#gotham#isAvailable()
endfunc

let s:base0   = { 'gui': "#0c1014", 'cterm':  0 }
let s:base1   = { 'gui': "#11151c", 'cterm':  8 }
let s:base2   = { 'gui': "#091f2e", 'cterm': 10 }
let s:base3   = { 'gui': "#0a3749", 'cterm': 12 }
let s:base4   = { 'gui': "#1e6479", 'cterm': 11 }
let s:base5   = { 'gui': "#599cab", 'cterm': 14 }
let s:base6   = { 'gui': "#99d1ce", 'cterm':  7 }
let s:base7   = { 'gui': "#d3ebe9", 'cterm': 15 }

let s:red     = { 'gui': "#c23127", 'cterm':  1 }
let s:orange  = { 'gui': "#d26937", 'cterm':  9 }
let s:yellow  = { 'gui': "#edb443", 'cterm':  3 }
let s:magenta = { 'gui': "#888ca6", 'cterm': 13 }
let s:violet  = { 'gui': "#4e5166", 'cterm':  5 }
let s:blue    = { 'gui': "#195466", 'cterm':  4 }
let s:cyan    = { 'gui': "#33859E", 'cterm':  6 }
let s:green   = { 'gui': "#2aa889", 'cterm':  2 }

let g:near#themes#gotham#normal  = { 'fg': s:base6,  'bg': s:blue   }
let g:near#themes#gotham#insert  = { 'fg': s:base2,  'bg': s:green   }
let g:near#themes#gotham#visual  = { 'fg': s:base2,  'bg': s:magenta }
let g:near#themes#gotham#vLine   = { 'fg': s:base0,  'bg': s:violet  }
let g:near#themes#gotham#vBlock  = { 'fg': s:base2,  'bg': s:orange  }
let g:near#themes#gotham#replace = { 'fg': s:base7,  'bg': s:red     }
let g:near#themes#gotham#prompt  = { 'fg': s:yellow, 'bg': s:base2   }

let g:near#themes#gotham#inactive = { 'fg': s:base5,  'bg': s:base1  }| " StatusLineNC
let g:near#themes#gotham#filename = { 'fg': s:base5,  'bg': s:base1  }| " User1
let g:near#themes#gotham#modified = { 'fg': s:base6,  'bg': s:base4  }| " User1
let g:near#themes#gotham#main     = { 'fg': s:base5,  'bg': s:base1  }| " User2
let g:near#themes#gotham#branch   = { 'fg': s:base7,  'bg': s:base4  }| " User3
let g:near#themes#gotham#plugin   = { 'fg': s:base2,  'bg': s:yellow }| " User4
let g:near#themes#gotham#none     = { 'fg': s:base5,  'bg': s:base0  }| " User9 - Transparent
