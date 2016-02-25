set nocompatible              " be iMproved, required
filetype off                  " required
"===============================================================================
"                           Begin Vundle Customization
"===============================================================================
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"=====================================================================
"                           Custom Plugins
"=====================================================================
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'bling/vim-airline'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/nerdcommenter'
call vundle#end()            " required
filetype plugin indent on    " required
"===============================================================================
"                         End Vundle Customization
"===============================================================================
"===============================================================================
"                            Package Customization
"===============================================================================
"=====================================================================
"                           Airline
"=====================================================================
set laststatus=2
let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"=====================================================================
"                           CPP
"=====================================================================
let g:cpp_class_scope_highlight = 1

"=====================================================================
"                          UltiSnips 
"=====================================================================
"let g:UltiSnipsSnippetDirectories=[$HOME/'.vim/UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"===============================================================================
"                            End Customization
"===============================================================================
"===============================================================================
"                             Vim customization
"===============================================================================
syntax on
let mapleader = " "
set tabstop=4
set shiftwidth=4
set expandtab
"===============================================================================
"                             Key customization
"===============================================================================
nnoremap <Leader>e :CtrlP<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>n :NERDTree<CR>
"===============================================================================
"                             End Vim customization
"===============================================================================
