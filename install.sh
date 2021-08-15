#!/bin/bash


DOTPATH=~/dotfiles

if has "git"; then
  git clone --recursive "$GITHUB_URL" "$DOPATH"

elif has "curl" || "wget"; then
  zipurl=""

  if has "curl"; then
    curl -L "$zipurl"
  elif has "wget"; then
    wget -O - "$zipurl"
  fi | tar zxv

  mv -f dotfiles-master "$DOPATH"
else
  die "curl or wget required"
fi

cd ~/dotfiles
if [ $? -ne 0 ]; then
  die "not found: $DOPATH"
fii

for f in .??*
do
  [ "$f" = ".git" ] && continue

  ln -snfv "$DOTPATH/$f" "$HOME"/"$f"
done
