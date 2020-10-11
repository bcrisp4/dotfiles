" enable vim enhancements
set nocompatible

" required for vundle
filetype off

" vundle plugin manager
set rtp+=~/.plugins/vundle
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" plugins
Plugin 'fatih/vim-go'
Plugin 'gcmt/taboo.vim'
Plugin 'bling/vim-airline'
Plugin 'ervandew/supertab'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'hashivim/vim-packer'
Plugin 'raimondi/delimitmate'
Plugin 'hashivim/vim-vagrant'
Plugin 'tpope/vim-commentary'
Plugin 'airblade/vim-gitgutter'
Plugin 'hashivim/vim-terraform'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" syntax plugins
Plugin 'stephpy/vim-yaml'
Plugin 'saltstack/salt-vim'
Plugin 'glench/vim-jinja2-syntax'

" theme plugins
Plugin 'chriskempson/base16-vim'
Plugin 'vim-airline/vim-airline-themes'

" start vundle
call vundle#end()
filetype plugin indent on


""" theme/colour configuration
colorscheme base16-bright
let base16colorspace=256
let g:airline_theme='base16_shell'


""" misc. config
"" decrease updatetime to speed up gitgutter
set updatetime=250

" enable syntax highlighting etc.
syntax enable

" indentation
set autoindent

" folding
set foldmethod=indent

" line numbers 
set number
highlight LineNr ctermfg=DarkGrey ctermbg=Black

" spaces > tabs
set expandtab
set smarttab

" tab size
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" mouse support
set mouse=n

" searching
set ignorecase
set smartcase
set incsearch
set hlsearch
nmap <leader>c :nohlsearch<CR>

" show commands at bottom of the screen
set showcmd

" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" tab navigation
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" buffer navigation
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>


""" plugin configuration
" saltstack: force jinja syntax
let g:sls_use_jinja_syntax = 1

" gitgutter: colours
let g:gitgutter_set_sign_backgrounds = 1
highlight SignColumn ctermbg=Black

" ctrlp: ignore these filetypes/dirs
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" ctrlp: use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

" ctrlp: easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" airline: tabline
let g:airline#extensions#tabline#enabled = 1

" terraform: disable folding
let g:terraform_fold_sections=0

" terraform: format on save
let g:terraform_fmt_on_save=1
