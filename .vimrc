set nocompatible
filetype off

" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'kchmck/vim-coffee-script'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-endwise'
Plugin 'alvan/vim-closetag'
Plugin 'kylef/apiblueprint.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'airblade/vim-gitgutter'
Plugin 'mileszs/apidock.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'wilsaj/chuck.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'stephenmckinney/vim-solarized-powerline'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'thoughtbot/vim-rspec'
call vundle#end()

" Settings
"
filetype plugin indent on
syntax on
set background=dark
set noeol
set binary
colorscheme industry

" presentation settings
set relativenumber      " precede each line with its line number
set numberwidth=3       " number of culumns for line numbers
set textwidth=0         " Do not wrap words (insert)
set nowrap              " Do not wrap words (view)
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ruler               " line and column number of the cursor position
set wildmenu            " enhanced command completion
set visualbell          " use visual bell instead of beeping
set laststatus=2        " always show the status line
set listchars=tab:▷⋅,trail:·
set list

set winwidth=84
set winheight=5
set winminheight=5
set winheight=999

" behavior
                        " ignord these files when completing names and in
                        " explorer
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif
set shell=/bin/bash     " use bash for shell commands
set autowriteall        " Automatically save before commands like :next and :make
set hidden              " enable multiple modified buffers
set history=1000
set autoread            " automatically read file that has been changed on disk and doesn't have changes in vim
set backspace=indent,eol,start
set guioptions-=T       " disable toolbar"
set completeopt=menuone,preview
let bash_is_sh=1        " syntax shell files as bash scripts
set cinoptions=:0,(s,u0,U1,g0,t0 " some indentation options ':h cinoptions' for details
set modelines=5         " number of lines to check for vim: directives at the start/end of file
"set fixdel                 " fix terminal code for delete (if delete is broken but backspace works)
set autoindent          " automatically indent new line

set ts=4                " number of spaces in a tab
set sw=4                " number of spaces for indent
set et                  " expand tabs into spaces

" Specific indent settings for filetypes
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4
autocmd Filetype python setlocal ts=4 sts=4 sw=4

if exists('+colorcolumn')
  set colorcolumn=90
  highlight ColorColumn ctermbg=0
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

set ttimeoutlen=50      " fast Esc to normal mode

" mouse settings
if has("mouse")
  set mouse=a
endif
set mousehide

" search settings
set incsearch           " Incremental search
set hlsearch            " Highlight search match
set ignorecase          " Do case insensitive matching
set smartcase           " do not ignore if search pattern has CAPS

let mapleader = ","
let maplocalleader = "\\"

" Window navigate
nmap <C-l> <C-w>l
nmap <C-k> <C-w>k
nmap <C-j> <C-w>j
nmap <C-h> <C-w>h

" Plugin settings

" nerdtree
" Ctrl-P twice to Display the file browser tree
nmap <C-P><C-P> :NERDTreeTabsToggle<CR>
" ,p to show current file in the tree

" powerline
set laststatus=2
set noshowmode
let g:powerline_config_overrides =
        \{
        \   'ext': {
        \       'vim': {
        \           'theme': 'default',
        \           'colorscheme': 'solarized'
        \       }
        \   }
        \}


"let g:syntastic_ruby_checkers = ['rubocop']
"let g:syntastic_ruby_rubocop_args = "-R"

" APIDock browser command
let g:browser = 'open -a /Applications/Firefox.app'

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Quick mapping to clear the highlighting of previous search
" pattern matches
map <Leader>h :nohlsearch<CR>

" Execute current line of cursor (Vimscript)
map <Leader>x :exec getline(".")<CR>
