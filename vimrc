set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'fatih/vim-go'
call vundle#end()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
filetype plugin indent on
syntax on

colo desert

set nu!
set mouse=n
set laststatus=2
highlight StatusLine cterm=bold ctermfg=yellow ctermbg=blue
function! CurDir()
	let curdir = substitute(getcwd(), $HOME, "~", "g")
	return curdir
endfunction
"set statusline=[%n]\ %f%m%r%h\ \|\ \ pwd:\ %{CurDir()}\ \ \|%=\|\ %l,%c\ %p%%\ \|\ ascii=%b,hex=%b%{((&fenc==\"\")?\"\":\"\ \|\ \".&fenc)}\ \|\ %{$USER}\ @\ %{hostname()}\

set statusline=%<%F\ %h%m%r%y%=%-14.(%l,%c%V%)\ %P

Bundle 'Blackrush/vim-gocode'
Bundle 'dgryski/vim-godef'

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

"tagbar for go, needs gotags, ctags."
nmap <F8> :TagbarToggle<CR>
let g:tagbar_left=1
let g:tagbar_width=30

"nerdtree"
Bundle 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>

"for gtags."
set cscopetag
set cscopeprg='gtags-cscope'
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1

nmap <C-]> :Gtags<cr><cr>
nmap <C-g> :Gtags -gi<cr><cr>
nmap <C-r> :Gtags -r <cr><cr>
nmap <F9> :copen<cr><cr>
nmap <F10> :cclose<cr><cr>
nmap <F11> :cn<cr><cr>
nmap <F12> :cp<cr><cr>

