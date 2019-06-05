" ----------------------------------------
" Automatic installation of vim-plug, if it's not available
" ----------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  echo "Installing VimPlug..."
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"-----------------------------------------

"-----------------------------------------
" Automatically install missing plugins on startup
"-----------------------------------------
autocmd VimEnter *
      \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \|   PlugInstall --sync | q
      \| endif
"-----------------------------------------


"-----------------------------------------
" Plugins
"-----------------------------------------
silent! if plug#begin('~/.vim/plugged')
Plug 'w0rp/ale'                 " linting plugin
Plug 'morhetz/gruvbox'          " vim gruvbox color scheme
Plug 'kien/ctrlp.vim'
Plug 'chr4/nginx.vim'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'cespare/vim-toml'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/syntastic'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
""" Colorscheme
Plug 'dylanaraps/wal.vim'
Plug 'whatyouhide/vim-gotham'
Plug 'altercation/vim-colors-solarized'
"Plug 'lilydjwg/colorizer'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'


call plug#end()
endif
" vim-plug does not require any extra statement other than plug#begin()
" and plug#end(). You can remove filetype off, filetype plugin indent on
" and syntax on from your .vimrc as they are automatically handled by
" plug#begin() and plug#end()
"-----------------------------------------

filetype plugin indent on
syntax on
set autoindent
set backspace=indent,eol,start
set hidden
set hlsearch
"set laststatus=2
set noshowmode
set mouse=a
set noundofile
set number
set wildmenu
set autochdir
set noswapfile
set showmatch                    " highlight matching [{()}]

let mapleader = ","


"-----------------------------------------
" misc.
"-----------------------------------------
" Theme Set Colorscheme and Statusline {{{
try
    colorscheme wal
    "colorscheme molokai
    "colorscheme gruvbox
catch /^Vim\%((\a\+)\)\=:E185/
    " deal with it
endtry

"let g:gruvbox_contrast_dark = 'hard'
"let g:gruvbox_contrast_dark = 'soft'
"let g:gruvbox_termcolors=16

"set background=dark

"let g:molokai_original = 1
"let g:rehash256 = 1

"" Status line
set laststatus=2
set t_Co=256

let g:lightline = {'colorscheme': 'gotham'}
let g:lightline = {
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }
"}}}


" Buffer
nnoremap gb :ls<CR>:b<Space>

" Finder
set path=.,**
nnoremap <leader>f :find *
nnoremap <leader>s :sfind *
nnoremap <leader>v :vert sfind *
nnoremap <leader>t :tabfind *

" CtrlP
let g:ctrlp_show_hidden = 1

" Wildmenu
set wildmode=list:full
set wildignorecase
set wildignore=*.swp,*.bak
set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*,*/node_modules/**/*
set wildignore+=tags
set wildignore+=*.tar.*
"-----------------------------------------
