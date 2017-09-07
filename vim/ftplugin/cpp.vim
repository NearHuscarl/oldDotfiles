call plug#load('vim-misc')
call plug#load('vim-shell')
call plug#load('vim-easytags')

setlocal foldmethod=syntax

if has('localmap')
   nnoremap <buffer> 'h :ToggleHeader<CR>zz
   nnoremap <silent><buffer> -
            \ :w<Bar>
            \ :silent execute "!cscope -b"<Bar>
            \ :silent cs reset<CR>
endif
