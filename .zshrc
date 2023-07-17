#direnv setting
export EDITOR=vim
eval "$(direnv hook zsh)"

# prompt setting
export PS1='%F{165}%~ %F{039}>%F{082}>%F{196}>%f%F{255} '

# ======================Function===============================

## rprompt-git-setting
function rprompt-git-current-branch {
  local branch_name st branch_status

  if [ ! -e  ".git" ]; then
    # gitで管理されていないディレクトリは何も返さない
    return
  fi
  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    # 全てcommitされてクリーンな状態
    branch_status="%F{green}"
  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    # gitに管理されていないファイルがある状態
    branch_status="%F{red}?"
  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    # git addされていないファイルがある状態
    branch_status="%F{red}+"
  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    # git commitされていないファイルがある状態
    branch_status="%F{yellow}!"
  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    # コンフリクトが起こった状態
    echo "%F{red}!(no branch)"
    return
  else
    # 上記以外の状態の場合は青色で表示させる
    branch_status="%F{blue}"
  fi
  # ブランチ名を色付きで表示する
  echo "${branch_status}[$branch_name]"
}

## memo command

memo() {
  local MEMO_DIR="$HOME/memo"
  mkdir -p "$MEMO_DIR"
  local TODAY="$(date +%Y%m%d)"

  vim "$MEMO_DIR/$TODAY.md"
}

## select history

select-history() {
  BUFFER=$(history -n -r 1 | fzf --query "$BUFFER")
  CURSOR=$#BUFFER
}

zle -N select-history
bindkey '^r' select-history

# ======================Function================================

setopt prompt_subst

export RPROMPT='`rprompt-git-current-branch`'

export LS_COLORS='no=32;40:di=34;40:ln=35:so=36:pi=33:ex=31:bd=46;34:cd=104;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
alias ls="ls -G"
zstyle ':completion:*' list-colors "${LS_COLORS}"

#environment valiable path
eval "$(rbenv init -)"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="$HOME/go:$PATH"
export PATH="$HOME/.asdf/asdf.sh"
CGO_ENABLED=1
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:$PATH"
export PATH="~/.rbenv/bin:$PATH"
export PATH="$PATH:/usr/local/Cellar/postgresql@14/14.6/bin/psql"
export KERL_CONFIGURE_OPTIONS="--enable-debug --disable-silent-rules --without-javac --enable-shared-zlib --enable-dynamic-ssl-lib --enable-hipe --enable-sctp --enable-smp-support --enable-threads --enable-kernel-poll --enable-wx --enable-darwin-64bit --with-ssl=$(brew --prefix openssl)"
export CFLAGS="-O2 -g -fno-stack-check"

export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export LIBRAY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH
export PATH="/usr/local/bin/fzf:$PATH"
export PATH="/usr/local/bin/spring:$PATH"
export PATH="/usr/local/Cellar/node/19.4.0/bin:$PATH"
export PATH="/usr/local:$PATH"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/amazon-corretto-11.jdk/Contents/Home/"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/amazon-corretto-17.jdk/Contents/Home/"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home/bin"
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$HOME/.deno/bin:$PATH"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

#environment valiable fzf command
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPT='--preview "bat --style=numbers --color=always --line-range :500 {}"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS='--preview "bat  --color=always --style=header,grid --line-range :500 {}"'
export FZF_CTRL_R_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_R_OPTS='--preview "bat  --color=always --style=header,grid --line-range :100 {}"'
export FZF_ALT_C_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_ALT_C_OPTS='--preview "bat  --color=always --style=header,grid --line-range :100 {}"'

## lang setting
export LANG=ja_JP.UTF-8

## cli-cmd setting
# auto change directory
setopt auto_cd

setopt auto_pushd

setopt correct

setopt list_packed

setopt noautoremoveslash

setopt nolistbeep

autoload -U compinit && compinit -u

## command alias
alias ll="exs | fzf"
alias cdf="exs | fzf | xargs cd"
alias du="du -h"
alias df="df -h"
alias tree="tree -a -I '.git'"
alias .="cd ../"
alias ..="cd ../.."
alias ...="cd ../../.."
alias exs="exa -abghHliS"
alias ext="exa --long --tree --binary --group --header --links --inode --blocks --all --level=3"
alias cat="bat"
alias catnf="cat >"

# man command
#export MANPAGER="sh -c 'col -bx | bat -l -p'"
#man 2 select

#github cli setting
eval "$(gh completion -s zsh)"

#ripgrep alias
alias rg="rg -i"

#gh alias isuue
alias -g IS='`gh issue list | fzf | head -n 1 | cut -f1`'
alias ghi='(){gh issue view $1 -w}'

#gh alias pullrequest
alias -g PR='`gh pr list | fzf | head -n 1 | cut -f1`'
alias ghp='(){gh pr view $1 -w}'

#git alias
alias gst="git status"
alias gcb="git checkout -b"
alias gco="git branch --all --format='%(refname:short)' | fzf | xargs git checkout"
alias gcm="git commit -m"
alias gp="git push"
alias gra="git remote add"
alias gd="git add"
alias gb="git branch"
alias gbr="git branch -r"
alias gr="git rebase"
alias gri="git log --oneline --pretty=format:'%h - %s' | fzf --preview 'git show {1} --name-only' | sed -e 's/-.*//g' | xargs  git rebase -i "
alias gpsuo="git push --set-upstream origin"
alias sw="git branch --all --format='%(refname:short)' | fzf | xargs git checkout"


# nvim
alias vim='nvim'
alias v='vim'
# tmux alias
alias t="tmux"
#fzf alias
alias f="fzf"
# vim default tab new
alias vp="vim -p"
#.zshrc read command alias
alias .z="source ~/.zshrc"
#.vimrc read command alias
alias .v="source ~/.vimrc"
alias viz="vim ~/.zshrc"

#gatsby alias
alias gtyd="gatsby develop"

#npm
alias ni="npm install"
alias nu="npm uninstall"

alias vz="vim ~/.zshrc"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
eval "$(atuin init zsh)"
if [ -f `brew --prefix`/etc/autojump ]; then
. `brew --prefix`/etc/autojump
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
