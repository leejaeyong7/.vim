if has('win32') || has('win64')
  noremap <C-V> <C-V>
endif

" Setup Plugin
call plug#begin('~/.vim/plugged')
Plug 'sickill/vim-monokai'
Plug 'mileszs/ack.vim'
Plug 'mileszs/ack.vim'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'pangloss/vim-javascript'
Plug 'SirVer/ultisnips'
call plug#end()

" Fold setting
" Note, perl automatically sets foldmethod in the syntax file
autocmd Syntax c,cpp,vim,xml,html,xhtml,javascript setlocal foldmethod=syntax
autocmd Syntax c,cpp,vim,xml,html,xhtml,perl,javascript normal zR

" ejs syntax setting
au BufNewFile,BufRead *.ejs set filetype=html

" Color Scheme files
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
	colorscheme monokai
else
	set background=dark
endif

" Indent related settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
filetype plugin indent on
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
set cino=(0

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
nnoremap <leader>s :Gstatus<CR>
nnoremap <leader>gb :Git checkout<Space>
nnoremap <leader>gc :Gcommit<CR>

"" -- Leader Buffer related settings
nnoremap <leader>q :q<CR>
nnoremap <leader>n :enew<CR>
nnoremap <leader>h :bp<CR>
nnoremap <leader>l :bn<CR>
nnoremap <leader>bq :bp <BAR> bd #<CR>

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
  let g:ackprg = 'ag --vimgrep'
endif

" CtrlP related settinsg
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
