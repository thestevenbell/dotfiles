set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'jnurmine/Zenburn'
Plugin 'nvie/vim-flake8'
" https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
"pip3 install flake8 -- needed for linting by syntastic
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
call vundle#end()
set clipboard=unnamed
set nu
filetype plugin indent on
set ruler
set cursorline

" THEMES AND APPERANCE SETTINGS
set laststatus=2
let g:airline_powerline_fonts = 1
set ttimeoutlen=50
set guifont=Source\ Code\ Pro\ for\ Powerline
let g:airline_extensions_tabline_enabled = 1
set encoding=utf-8
let g:Powerline_symbols='unicode'
syntax enable
let g:airline_theme='solarized'
set t_Co=256
let g:solarized_termtrans = 1                                                   
let g:solarized_termcolors=256                                                  
set background=dark " or set background=light
colorscheme solarized
let g:solarized_bold=1 " 1|0 show bold fonts
let g:solarized_italic=1 " 1|0 show italic fonts
let g:solarized_underline=1 " 1|0 show underlines
let g:solarized_contrast="high" " normal|high|low contrast
let g:solarized_visibility="low" " normal|high|low effect on whitespace characters
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif


"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Python Specific Settings
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

let python_highlight_all=1
