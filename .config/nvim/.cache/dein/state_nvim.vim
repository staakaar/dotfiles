if g:dein#_cache_version !=# 220 || g:dein#_init_runtimepath !=# '/Users/iwamototakayuki/.cache/dein/repos/github.com/Shougo/dein.vim,/Users/iwamototakayuki/dotfiles/.config/nvim,/etc/xdg/nvim,/Users/iwamototakayuki/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/usr/local/Cellar/neovim/0.4.4_2/share/nvim/runtime,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/Users/iwamototakayuki/.local/share/nvim/site/after,/etc/xdg/nvim/after,/Users/iwamototakayuki/dotfiles/.config/nvim/after' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/Users/iwamototakayuki/dotfiles/.config/nvim/init.vim', '/Users/iwamototakayuki/.config/nvim/dein.toml', '/Users/iwamototakayuki/.config/nvim/dein_lazy.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/iwamototakayuki/.cache/dein'
let g:dein#_runtime_path = '/Users/iwamototakayuki/.cache/dein/.cache/init.vim/.dein'
let g:dein#_cache_path = '/Users/iwamototakayuki/.cache/dein/.cache/init.vim'
let &runtimepath = '/Users/iwamototakayuki/.cache/dein/repos/github.com/Shougo/dein.vim,/Users/iwamototakayuki/dotfiles/.config/nvim,/etc/xdg/nvim,/Users/iwamototakayuki/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/Users/iwamototakayuki/.cache/dein/repos/github.com/nvim-treesitter/nvim-treesitter,/Users/iwamototakayuki/.cache/dein/.cache/init.vim/.dein,/usr/local/Cellar/neovim/0.4.4_2/share/nvim/runtime,/Users/iwamototakayuki/.cache/dein/repos/github.com/nvim-treesitter/nvim-treesitter/after,/Users/iwamototakayuki/.cache/dein/.cache/init.vim/.dein/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/Users/iwamototakayuki/.local/share/nvim/site/after,/etc/xdg/nvim/after,/Users/iwamototakayuki/dotfiles/.config/nvim/after'
filetype off
  let g:nvcode_termcolors=256
  syntax on
  colorscheme nvcode
