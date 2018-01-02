" VimPlug
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-speeddating'
Plug 'sheerun/vim-polyglot'
Plug 'nvie/vim-flake8'
" YouCompleteMe must be manually installed
Plug 'Valloric/YouCompleteMe'
Plug 'altercation/vim-colors-solarized'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-rooter'

call plug#end()

"---------------------------------------------------------------------------

" Sensibility

" ALWAYS
set nocompatible

" Lets you switch bufs without saving
set hidden

" Try to indent file with plugins
filetype indent plugin on
"
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Don't go to start of line when you do stuff
set nostartofline

" Raise confirm dialog instead of error
set confirm

" Enable use of the mouse for all modes
set mouse=a

" Display line numbers on the left
set number

"---------------------------------------------------------------------------

" Highlighting

" Enable syntax highlighting
syntax on

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch
"
" Highlight as you type
set incsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

"---------------------------------------------------------------------------

" Commandline

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

"---------------------------------------------------------------------------

" Indent

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

"---------------------------------------------------------------------------

" Disable annoying crap

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

"---------------------------------------------------------------------------

" Mappings
map Y y$

" <C-L> to clear screen of highlights
nnoremap <C-L> :nohl<CR><C-L>

" Use j and k to scroll same line when it wraps
nnoremap j gj
nnoremap k gk

" Use tab and shift tab to switch between buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>

" Use leader for stuff
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader><S-w> :wa<CR>
nnoremap <Leader><S-q> :qa<CR>
nnoremap <Leader>e :e<Space>

" Leader jumping buffers
nnoremap <Leader>1 :b1<CR>
nnoremap <Leader>2 :b2<CR>
nnoremap <Leader>3 :b3<CR>
nnoremap <Leader>4 :b4<CR>
nnoremap <Leader>5 :b5<CR>
nnoremap <Leader>6 :b6<CR>
nnoremap <Leader>7 :b7<CR>
nnoremap <Leader>8 :b8<CR>
nnoremap <Leader>9 :b9<CR>
nnoremap <Leader>0 :b10<CR>

" Map semicolon to colon because it's easier to hit
nnoremap ; :

" Don't use first or last 3 lines of screen to edit
set scrolloff=3

"---------------------------------------------------------------------------

" Editor state

" Put all the swapfiles in one place so you don't make a mess
set directory=$HOME/.vim/swapfiles//

" Global undo
if has('persistent_undo')
  set undofile
  set undodir=~/.vim/undo
endif

"---------------------------------------------------------------------------

" Colorscheme
set background=dark
colorscheme solarized

"---------------------------------------------------------------------------

" fzf plugin
set rtp+=~/.fzf

