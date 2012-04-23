version 6.0
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
let &cpo=s:cpo_save
unlet s:cpo_save
" for command mode
nmap <S-Tab> <<
" for insert mode
imap <S-Tab> <Esc><<i
syntax on
set backspace=indent,eol,start
set cscopeprg=/usr/bin/cscope
set cscopetag
set cscopeverbose
set fileencodings=utf-8,latin1
set helplang=en
set history=200
set hlsearch
set ruler
set viminfo='20,\"50
set nocompatible
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set showmatch
set virtualedit=onemore
set ignorecase
set smartcase
set number                     
set pastetoggle=<F2>
" set mouse=a
set foldenable
set foldmarker={,}
set cursorline
highlight CursorLine cterm=bold
cnoremap vb ConqueTermVSplit<Space>bash<cr>
cnoremap sb ConqueTermSplit<Space>bash<cr>
map nt :NERDTree .<cr>
imap jj <Esc>`^
autocmd FileType make setlocal noexpandtab
autocmd FileType s set ft=gas
let &t_Co=256