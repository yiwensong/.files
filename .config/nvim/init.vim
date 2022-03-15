" VimPlug
call plug#begin('~/.vim/plugged')

" fzf
Plug 'junegunn/fzf', { 'dir': '~/bin/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" ^a and ^z to increment dates
Plug 'tpope/vim-speeddating'

" Language highlights
Plug 'sheerun/vim-polyglot'

" Vim go
Plug 'fatih/vim-go'

" Bazel highlights
Plug 'durandj/bazel.vim'

" Highlights other occurrences of word that is overed over
Plug 'RRethy/vim-illuminate'

" Undotree
Plug 'mbbill/undotree'

" Flake8 for my vim
Plug 'nvie/vim-flake8'

" ALE is useful for linting and completions
Plug 'w0rp/ale'

" Backup theme for colored laptops
Plug 'altercation/vim-colors-solarized'

" Theme
Plug 'yiwensong/vim-yin-yang'

" Displays Buffers in the tab line
Plug 'ap/vim-buftabline'

" gJ and gS to split and join lines
Plug 'AndrewRadev/splitjoin.vim'

" turn trues into falses
Plug 'AndrewRadev/switch.vim'

"Git stuff
Plug 'tpope/vim-fugitive'

" Sets vim to run at the root of git repo
Plug 'airblade/vim-rooter'

" Displays line indentations
Plug 'Yggdroot/indentLine'

" Comments
Plug 'tpope/vim-commentary'

" Automatic indentation
Plug 'tpope/vim-sleuth'

" This is a completion engine
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Sorbet stuff
Plug 'zackhsi/sorbet-lsp'

" For auto formatting comments
Plug 'inkarkat/vim-OnSyntaxChange'
" This is a dependency library from the same author that includes
" some autoload functions that he uses on the plugins he writes.
Plug 'inkarkat/vim-ingo-library'

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
" THESE LINES ARE LEFT BLANK INTENTIONALLY. PLEASE DO NOT START WRITING REAL
" CODE UNTIL LINE 240.

































































































































































"---------------------------------------------------------------------------
" Leader to spacebar
let mapleader = " "

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

" italics show correctly
set t_ZH=[3m
set t_ZR=[23m

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
set tabstop=4
set expandtab

" Stripe js is 2 space tabs go figure
" autocmd FileType javascript setlocal ts=2 sts=2 sw=2
" autocmd BufReadPost * :DetectIndent

"---------------------------------------------------------------------------

" Disable annoying crap

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=0

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
noremap <Leader>bd :bn <bar> bd #<CR>

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
nnoremap <Leader>9 :blast<CR>

" Map semicolon to colon because it's easier to hit
nnoremap ; :

" FZF
nnoremap <Leader>bb :<C-u>Buffers<CR>

" Replacement for :GFiles since it doesn't respect system vars
nnoremap <silent> <Leader>f :call fzf#run({
\   'source': 'fd --hidden --type file --exclude ".git"',
\   'down': '40%',
\   'sink': 'edit',
\   'options': '--no-multi --color=light',
\ })<CR>

" Replacement for :FZF since it doesn't respect system vars
nnoremap <silent> <Leader>g :call fzf#run({
\   'source': 'fd --hidden --no-ignore --follow --type file',
\   'down': '40%',
\   'sink': 'edit',
\   'options': '--no-multi --color=light',
\ })<CR>

" Replacement for :Buffers
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '--no-multi --color=light',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

" Don't use first or last 3 lines of screen to edit
set scrolloff=3

"---------------------------------------------------------------------------

" Editor state

" Put all the swapfiles in one place so you don't make a mess
set directory=$HOME/.local/share/nvim//

" Global undo
if has('persistent_undo')
  set undofile
  set undodir=~/.local/share/nvim/undo
endif

"---------------------------------------------------------------------------

" Colorscheme
set background=light
colorscheme solarized

"---------------------------------------------------------------------------

" Highlight lines past 80 and 120
let &colorcolumn="80,".join(range(120,999),",")
highlight ColorColumn ctermbg=7 guibg=lightgray

"---------------------------------------------------------------------------

" fzf plugin
set rtp+=~/.fzf


"---------------------------------------------------------------------------

" IndentLine Settings
let g:indentLine_enabled = 1
nnoremap <Leader>i :IndentLinesToggle<CR>

"---------------------------------------------------------------------------

" ALE Settings
let g:ale_virtualenv_dir_names = ['virtualenv_run', 'venv', '.env', '.venv', 'env', 've-py3', 've', 'virtualenv', '.tox/py27', '.tox/py36', '$HOME/.local/venv']
let g:ale_completion_enabled = 1
let g:ale_linters = {
\   'go': ['gopls'],
\   'ruby': ['sorbet-lsp'],
\   'javascript': ['eslint', 'prettier'],
\   'typescript': ['eslint', 'prettier', 'tsserver'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'typescriptreact': ['prettier'],
\   'markdown': ['prettier'],
\   'markdown.mdx': ['prettier'],
\   'less': ['prettier'],
\   'json': ['prettier'],
\   'yaml': ['prettier'],
\}

let g:ale_fix_on_save = 1

let g:ale_go_gopls_executable = '$GOPATH/bin/gopls'

nnoremap <leader>t :ALEGoToDefinition<CR>

" vim-illuminate settings
hi illuminatedWord cterm=underline gui=underline

" completor settings
let g:completor_python_binary = '$HOME/.venv/bin/python'
let g:completor_gocode_binary = '$HOME/go/bin/gocode'

"---------------------------------------------------------------------------
" splitjoin settings
let g:splitjoin_python_brackets_on_separate_lines = 1
let g:splitjoin_ruby_hanging_args = 0
let g:splitjoin_trailing_comma = 1
let g:splitjoin_curly_brace_padding = 0
let g:splitjoin_html_attributes_bracket_on_new_line = 1

"---------------------------------------------------------------------------
" Completions
" let g:deoplete#enable_at_startup = 1

"---------------------------------------------------------------------------
" Skylark and other python-like files
autocmd BufRead,BufNewFile *.sky set filetype=python
autocmd BufRead,BufNewFile BUILD set filetype=python
autocmd BufRead,BufNewFile BUILD.bazel set filetype=python

"---------------------------------------------------------------------------
" Commentary
nmap <leader>c <Plug>Commentary
xmap <leader>c <Plug>Commentary
omap <leader>c <Plug>Commentary
nmap <leader>cc <Plug>CommentaryLine

"---------------------------------------------------------------------------
" ^a and ^x mappings (speeddating and switch.vim)
" Don't use default mappings
let g:speeddating_no_mappings = 1

" Avoid issues because of us remapping <c-a> and <c-x> below
nnoremap <Plug>SpeedDatingFallbackUp <c-a>
nnoremap <Plug>SpeedDatingFallbackDown <c-x>

" Manually invoke speeddating in case switch didn't work
nnoremap <c-a> :if !switch#Switch() <bar>
  \ call speeddating#increment(v:count1) <bar> endif<cr>
nnoremap <c-x> :if !switch#Switch({'reverse': 1}) <bar>
  \ call speeddating#increment(-v:count1) <bar> endif<cr>

"---------------------------------------------------------------------------
" vim-rooter
let g:rooter_patterns = ['.git', '_darcs', '.hg', '.bzr', '.svn']

"---------------------------------------------------------------------------
" auto formatting comments
" Add a new autocommand that will activate when the cursor is on a Comment and
" it either enters or leaves insert mode.
" 1. The name: `Comment` means the autocmd will be called
" `SyntaxCommentEnter{MODE}`
" 2. A regex to max the syntax, on our case any syntax similar to `Comment`
" will match to us.
" 3. Whether we want to generate it to all buffers or only a particular one,
" we're ok with only the current buffer.
" 4. To which mode we want to link the autocommand. We're only interested in
" the insert mode
call OnSyntaxChange#Install('Comment', '^Comment$', 1, 'i')

augroup auto_wrap_comments
  " Set textwidth to 80 when editing
  autocmd User SyntaxCommentEnterI setlocal textwidth=72
  " Remove it again when leaving insert mode
  autocmd User SyntaxCommentLeaveI setlocal tw=0
augroup END
