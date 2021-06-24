set nocompatible

filetype plugin indent on

" basic vim config
set autoindent

set smartindent

set shortmess+=I " disable startup message

set nu " number lines

set rnu " relative line numbering

set incsearch " incremental search (as string is being typed)

set hls " highlight search

set listchars=tab:>>,nbsp:~ " set list to see tabs and non-breakable spaces

set lbr " line break

set scrolloff=5 " show lines above and below cursor (when possible)

set noshowmode " hide mode

set laststatus=2

set backspace=indent,eol,start " allow backspacing over everything

set timeout timeoutlen=1000 ttimeoutlen=100 " fix slow O inserts

set lazyredraw " skip redrawing screen in some cases

set autochdir " automatically set current directory to directory of last opened file

set hidden " allow auto-hiding of edited buffers

set history=8192 " more history

set nojoinspaces " suppress inserting two spaces between sentences

" use 4 spaces instead of tabs during formatting
set expandtab

set tabstop=2

set shiftwidth=2

set softtabstop=4

set cursorline

" syntax highlight setting
syntax on

" smart case-sensitive search
set ignorecase

set smartcase

" tab completion for files/bufferss
set wildmode=longest,list

set wildmenu

set mouse+=a " enable mouse mode (scrolling, selection, etc)
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" disable audible bell
set noerrorbells visualbell t_vb=

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

"status line git branch
"set statusline+=%{fugitive#statusline()}

"display file relative path title bar
set title

" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
"insert mode emacs key binding

imap <silent> <C-P> <UP>
imap <silent> <C-N> <Down>
imap <silent> <C-B> <Left>
imap <silent> <C-F> <Right>
imap <silent> <C-A> <HOME>
imap <silent> <C-E> <End>
imap <silent> <C-D> <Del>

imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>

" toggle relative numbering
nnoremap <C-n> :set rnu!<CR>

" nerd-tree key binding
nnoremap <silent><C-e> :NERDTreeToggle<CR>
"nerd-tree auto display to tree

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" display hidden files
let NERDTreeShowHidden = 1
