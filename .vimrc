" Automatic vim-plug installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Themes
Plug 'ayu-theme/ayu-vim' 
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'jdsimcoe/abstract.vim'
Plug 'nightsense/carbonized'


Plug 'ycm-core/YouCompleteMe', { 'do': 'python3 ./install.py' }
"Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'
Plug 'maverickg/stan.vim'

"Plug 'tpope/vim-surround'
"Plug 'Townk/vim-autoclose'

Plug 'itchyny/lightline.vim'
"Plug 'vim-airline/vim-airline'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'airblade/vim-gitgutter'

Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'

call plug#end()


" Themes
set termguicolors     " enable true colors support
set background=dark
colorscheme carbonized-dark

" Lightline
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
"set timeout timeoutlen=200 ttimeoutlen=5000

"set timeout ttimeoutlen=100 timeoutlen=5000

" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_python_checkers=['python3']

" YCM
set encoding=utf-8
"let g:ycm_key_list_stop_completion = ['<C-y>', '<Esc>']
let g:ycm_autoclose_preview_window_after_insertion=1

"" AutoClose
"let g:AutoClosePumvisible = {"ENTER": "<C-Y>", "ESC": "<ESC>"}

set whichwrap+=<,>,h,l,[,]	" let's cursor jump lines when moving right and left
set bs=2			" makes backspace key work
:imap jj <Esc>
vmap oo  o<Esc>
set number			" show line numbers
set mouse=nicr			" scroll with trackpad
set clipboard=unnamed

"" Show trailing whitespace
 highlight ExtraWhitespace ctermbg=lightred guibg=darkred
 match ExtraWhitespace /\s\+$/

set splitright

" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

 " ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
