set nocompatible

set autoindent

set autoread

# 数字を10進数として扱う
set nrformats=

set smartindent

set shortmess+=I

set termguicolors

set smarttab

set nu

set rnu

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

autocmd InsertEnter,InsertLeave * set cursorline!

set ignorecase

set smartcase

set wildmode=longest,list

set wildmenu

set mouse+=a " enable mouse mode (scrolling, selection, etc)
if &term =~ '^screen'
    set ttymouse=xterm2
endif

" disable audible bell
set noerrorbells visualbell t_vb=

set noswapfile

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

"window split key binding
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap ss :<C-u>sp<CR><C-w>j
nnoremap sv :<C-u>vs<CR><C-w>l
nnoremap Y y$

nnoremap <C-P> <UP>
nnoremap <C-N> <Down>

"===============vim plugin settings=============

" toggle relative numbering
nnoremap <C-n> :set rnu!<CR>

" tagBarToggle
nmap <F8> :TagbarToggle<CR>

" nerd-tree key binding
nnoremap <silent><C-e>t :NERDTreeToggle<CR>

"nerd-tree auto display to tree
autocmd VimEnter * execute 'NERDTree'

"fzf-vim-command :History alias
nmap <C-p> :History<CR>

"git diff realtime fix
set updatetime=100

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" display hidden files
let NERDTreeShowHidden = 1

" insert mode cursorline
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"vim tab setting
" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}

"main execute
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2

" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
nnoremap t <Nop>
map <silent> tc :tablast <bar> tabnew<CR>
map <silent> tx :tabclose<CR>
map <silent> tn :tabnext<CR>
map <silent> tp :tabprevious<CR>
