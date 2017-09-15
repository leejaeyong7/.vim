" System settings
if has('win32') || has('win64')
  noremap <C-V> <C-V>
endif

let $PATH = '/usr/local/bin:'.$PATH
" core vim settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
filetype plugin indent on

autocmd Filetype python setlocal ts=2 sw=2 expandtab

set noeb vb t_vb=
au GUIEnter * set vb t_vb=
set incsearch                   " incremental search
set hlsearch                    " highlighted search results
set showmatch                   " show matching brackets/parenthesis
set matchtime=0                 " don't blink when matching
set encoding=utf-8
set backspace=indent,eol,start

" Setup Plugin
call plug#begin('~/.vim/plugged')
Plug 'mileszs/ack.vim'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'pangloss/vim-javascript'
Plug 'chriskempson/base16-vim'
Plug 'w0rp/ale'
Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'easymotion/vim-easymotion'
Plug 'OmniSharp/omnisharp-vim'
Plug 'tpope/vim-dispatch'
call plug#end()

" AIrline setup
set list          " Display unprintable characters f12 - switches
set listchars=tab:•\ ,trail:•,extends:»,precedes:« " Unprintable chars mapping

" Fold setting
" Note, perl automatically sets foldmethod in the syntax file
autocmd Syntax c,cpp,vim,xml,html,xhtml,javascript setlocal foldmethod=syntax
autocmd Syntax c,cpp,vim,xml,html,xhtml,perl,javascript normal zR

" ejs syntax setting
au BufNewFile,BufRead *.ejs set filetype=html

" Color Scheme files
set nocompatible
syntax enable
"colorscheme Tomorrow-Night
set paste

" GUI related settings
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guifont=hack:h12

if has('gui_running')
  colorscheme base16-solarized-light
else
  set background=light
endif

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=NONE ctermbg=NONE
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=grey25 ctermbg=black
" Keyword related settings
set iskeyword-=_

" Syntax related settings
" -- JS
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1
set cino+=(0

" Command bar related settings
set wildmenu
set wildmode=full

set relativenumber
set breakindent

set showbreak=\\\\\
set ignorecase
set smartcase

" Leader related settings
let mapleader = " "

" -- Leader Git related settings
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gb :Git checkout<Space>
nnoremap <leader>gc :Gcommit<CR>

"" -- Leader Buffer related settings
nnoremap <leader>q :q<CR>
nnoremap <leader>n :enew<CR>
nnoremap <leader>h :bp<CR>
nnoremap <leader>l :bn<CR>
nnoremap <leader>d :bp <BAR> bd #<CR>

nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" Status bar settings
set laststatus=2


" Ack.vim settings
nnoremap <Leader>/ :Ack<Space>
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
endif

" CtrlP related settinsg
nnoremap <leader>v "+p
vnoremap <leader>c "+y
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>. :CtrlPCurFile<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>r :CtrlPMRUFiles<CR>
let g:ctrlp_prompt_mappings = {
    \ 'PrtSelectMove("j")':   ['<c-j>', '<c-n>'],
    \ 'PrtSelectMove("k")':   ['<c-k>', '<c-p>'],
    \ 'PrtHistory(-1)':       ['<down>'],
    \ 'PrtHistory(1)':        ['<up>'],
    \ }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

" Nerd Tree related settings
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>e :NERDTreeFind<cr>

" Misc. Key maps
nnoremap <C-w>q :hide<CR>

" set working directory to git project root
" or directory of current file if not git project
function! SetProjectRoot()
  " default to the current file's directory
  lcd %:p:h
  let git_dir = system("git rev-parse --show-toplevel")
  " See if the command output starts with 'fatal' (if it does, not in a git repo)
  let is_not_git_dir = matchstr(git_dir, '^fatal:.*')
  " if git project, change local directory to git project root
  if empty(is_not_git_dir)
    lcd `=git_dir`
  endif
endfunction
" follow symlink and set working directory
autocmd BufRead * call SetProjectRoot()

" YCM setups
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_add_preview_to_completeopt = 0
set completeopt-=preview
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
