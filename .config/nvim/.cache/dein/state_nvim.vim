if g:dein#_cache_version !=# 220 || g:dein#_init_runtimepath !=# '/Users/iwamototakayuki/.cache/dein/repos/github.com/Shougo/dein.vim,/Users/iwamototakayuki/dotfiles/.config/nvim,/etc/xdg/nvim,/Users/iwamototakayuki/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/usr/local/Cellar/neovim/0.4.4_2/share/nvim/runtime,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/Users/iwamototakayuki/.local/share/nvim/site/after,/etc/xdg/nvim/after,/Users/iwamototakayuki/dotfiles/.config/nvim/after,/usr/local/opt/fzf' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/Users/iwamototakayuki/dotfiles/.config/nvim/init.vim', '/Users/iwamototakayuki/.config/nvim/dein.toml', '/Users/iwamototakayuki/.config/nvim/dein_lazy.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/iwamototakayuki/.cache/dein'
let g:dein#_runtime_path = '/Users/iwamototakayuki/.cache/dein/.cache/init.vim/.dein'
let g:dein#_cache_path = '/Users/iwamototakayuki/.cache/dein/.cache/init.vim'
let &runtimepath = '/Users/iwamototakayuki/.cache/dein/repos/github.com/Shougo/dein.vim,/Users/iwamototakayuki/dotfiles/.config/nvim,/etc/xdg/nvim,/Users/iwamototakayuki/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/Users/iwamototakayuki/.cache/dein/repos/github.com/nvim-treesitter/nvim-treesitter,/Users/iwamototakayuki/.cache/dein/repos/github.com/neoclide/coc.nvim_release,/Users/iwamototakayuki/.cache/dein/.cache/init.vim/.dein,/usr/local/Cellar/neovim/0.4.4_2/share/nvim/runtime,/Users/iwamototakayuki/.cache/dein/repos/github.com/nvim-treesitter/nvim-treesitter/after,/Users/iwamototakayuki/.cache/dein/.cache/init.vim/.dein/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/Users/iwamototakayuki/.local/share/nvim/site/after,/etc/xdg/nvim/after,/Users/iwamototakayuki/dotfiles/.config/nvim/after,/usr/local/opt/fzf'
filetype off
  let g:nvcode_termcolors=256
  syntax on
  colorscheme nvcode
  let g:closetag_filenames='*.html'
  let g:closetag_xhtml_filenames='*.jsx,*.tsx,*.vue'
  let g:closetag_filetypes='html'
  let g:closetag_xhtml_filetypes='jsx,tsx,javascript.jsx,typescript.tsx,vue'
  let g:closetag_emptyTags_caseSensitive=1
  let g:closetag_shortcut='>'
let g:winresizer_start_key = '<C-T>'
    let g:rainbow_active = 1
    vnoremap ? :'<,'>TComment<CR>
  inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
  command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, <bang>0)
  command! -bang -nargs=* Rg call fzf#vim#grep(   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,   <bang>0 ? fzf#vim#with_preview('up:60%')           : fzf#vim#with_preview('right:50%:hidden', '?'),    <bang>0)
