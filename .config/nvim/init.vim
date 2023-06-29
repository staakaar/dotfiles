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
  packadd vim-jetpack
  call jetpack#begin()
  call jetpack#add('tani/vim-jetpack')
  call jetpack#add('junegunn/fzf.vim')
  call jetpack#add('joshdick/onedark')
  call jetpack#add('airblade/vim-rooter')
  call jetpack#add('tpope/vim-fugitive')
  call jetpack#add('airblade/vim-gitgutter')
  call jetpack#add('sheerun/vim-polyglot')
  call jetpack#add('dense-analysis/ale')
  call jetpack#add('maximbaz/lightline-ale')
  call jetpack#add('vim-airline/vim-airline')
  call jetpack#add('vim-airline/vim-airline-themes')
  call jetpack#add('xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' })
  call jetpack#add('neoclide/coc.nvim', { 'merge': 0, 'rev': 'release' })
  call jetpack#add('majutsushi/tagbar')
  call jetpack#add('ntpeters/vim-better-whitespace')
  call jetpack#add('majutsushi/tagbar', { 'on': 'TagbarToggle' })
  call jetpack#add('scrooloose/nerdtree', { 'on': 'NERDTreeToggle' })
  call jetpack#add('Yggdroot/indentLine')
  call jetpack#add('junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' })
  call jetpack#add('junegunn/fzf', { 'do': {-> fzf#install()} })
  call jetpack#add('neoclide/coc.nvim', { 'branch': 'release' })
  call jetpack#add('neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' })
  call jetpack#add('vlime/vlime', { 'rtp': 'vim' })
  call jetpack#add('dracula/vim', { 'as': 'dracula' })
  call jetpack#add('tpope/vim-fireplace', { 'for': 'clojure' })
  call jetpack#end()

  call dein#begin(s:dein_dir)

  "dein.toml, dein_layz.tomlファイルのディレクトリをセット
  let s:toml_dir = expand('~/.config/nvim/')

  "起動時読み込むプラグイン
  call dein#load_toml(s:toml_dir . 'dein.toml', {'lazy': 0})

  "遅延読み込みしたいプラグイン群
  call dein#load_toml(s:toml_dir . 'dein_lazy.toml', {'lazy': 1})

  "call dein#add('nvim-treesitter/nvim-treesitter', {'merged': 0 })

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

filetype plugin indent on
syntax enable:
# colorscheme onedark

