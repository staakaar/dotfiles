source ~/.vimrc

set rtp+=/usr/local/opt/fzf

"dein Scripts===========================================
if &compatible
  set nocompatible               " Be iMproved
endif

" dein.vim　インストール場所
let s:cache = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache . '/dein'

" dein.vim本体場所
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if &runtimepath !~# 'dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim ' . s:dein_repo_dir
    endif

    execute 'set runtimepath^=' . s:dein_repo_dir
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  "dein.toml, dein_layz.tomlファイルのディレクトリをセット
  let s:toml_dir = expand('~/.config/nvim/')

  "起動時読み込むプラグイン
  call dein#load_toml(s:toml_dir . 'dein.toml', {'lazy': 0})

  "遅延読み込みしたいプラグイン群
  call dein#load_toml(s:toml_dir . 'dein_lazy.toml', {'lazy': 1})
  
  call dein#add('nvim-treesitter/nvim-treesitter', {'merged': 0 })

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

filetype plugin indent on
syntax enable:

