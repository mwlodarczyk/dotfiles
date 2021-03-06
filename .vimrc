set nocompatible

"Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'gmarik/Vundle.vim'
    Plugin 'wombat256.vim'
    Plugin 'kien/ctrlp.vim'
    Plugin 'OmniCppComplete'
    Plugin 'ervandew/supertab'
    Plugin 'scrooloose/nerdtree'
    Plugin 'Chiel92/vim-autoformat'
    Plugin 'tpope/vim-fugitive'
    Plugin 'ntpeters/vim-better-whitespace'
call vundle#end()
filetype plugin on

"General
set ts=4
set tabstop=4
set backspace=indent,eol,start
set shiftwidth=4
set wrap
set textwidth=80
set expandtab
set number
set showmatch
set number
set showcmd
set incsearch
set autoindent
set hlsearch
set guifont=Monaco:h12
syntax on
colorscheme wombat256mod
set nobackup

"Ctags
set tags=./tags;/
function! RefreshTags()
    execute ":!ctags -R --language-force=C++ --c++-kinds=+p --fields=+liaS --extra=+q ."
    echohl StatusLine | echo "C/C++ tag updated" | echohl None
endfunction

"Clang path
let g:clang_library_path='/Library/Developer/CommandLineTools/usr/lib'

"OmniCppComplete
set omnifunc=syntaxcomplete#Complete " override built-in C omnicomplete with C++ OmniCppComplete plugin
let OmniCpp_NamespaceSearch     = 1
let OmniCpp_GlobalScopeSearch   = 1
let OmniCpp_DisplayMode         = 1
let OmniCpp_ShowScopeInAbbr     = 0 "do not show namespace in pop-up
let OmniCpp_ShowPrototypeInAbbr = 1 "show prototype in pop-up
let OmniCpp_ShowAccess          = 1 "show access in pop-up
let OmniCpp_MayCompleteScope    = 0 "show function params
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
set completeopt=menuone,menu,longest

"CtrlP
let g:ctrlp_working_path_mode = 0

"NERDTree
let g:NERDTreeDirArrows=0

"Autoformat
let g:formatprg_cs = "astyle"
let g:formatprg_args_cs = "--mode=c --style=linux -pcHs4"

"Whitespaces
autocmd BufWritePre * StripWhitespace

"Keys
map <F5> <ESC>:tabnew<CR>
map <F6> <ESC>:tabprev<CR>
map <F7> <ESC>:tabnext<CR>
map <F8> <ESC>:tabclose<CR>

imap <F5> <ESC>:tabnew<CR>i
imap <F6> <ESC>:tabprev<CR>i
imap <F7> <ESC>:tabnext<CR>i
imap <F8> <ESC>:tabclose<CR>i

noremap <F2> <ESC>:Autoformat<CR>
nmap <F3> <ESC>:NERDTreeToggle<CR>
nnoremap <F4> :call RefreshTags()
