" vint: -ProhibitAutocmdWithNoGroup

autocmd BufRead,BufNewFile *.rs call s:set_rust_filetype()

if has('patch-8.0.613')
    autocmd BufRead,BufNewFile Cargo.toml setf FALLBACK cfg
endif

function! s:set_rust_filetype() abort
    if &filetype !=# 'rust'
        set filetype=rust
    endif
endfunction

" vim: set et sw=4 sts=4 ts=8:
autocmd BufNewFile,BufRead *.flow setfiletype flow
fun! s:SelectJavascript()
  if getline(1) =~# '^#!.*/bin/\%(env\s\+\)\?node\>'
    set ft=javascript
  endif
endfun

autocmd BufNewFile,BufRead *.{js,mjs,cjs,jsm,es,es6},Jakefile setfiletype javascript
autocmd BufNewFile,BufRead * call s:SelectJavascript()
" vint: -ProhibitAutocmdWithNoGroup

" don't spam the user when Vim is started in Vi compatibility mode
let s:cpo_save = &cpo
set cpo&vim

" Note: should not use augroup in ftdetect (see :help ftdetect)
au BufRead,BufNewFile *.go setfiletype go
au BufRead,BufNewFile *.s setfiletype asm
au BufRead,BufNewFile *.tmpl set filetype=gohtmltmpl
au BufRead,BufNewFile go.sum set filetype=gosum

" remove the autocommands for modsim3, and lprolog files so that their
" highlight groups, syntax, etc. will not be loaded. *.MOD is included, so
" that on case insensitive file systems the module2 autocmds will not be
" executed.
au! BufRead,BufNewFile *.mod,*.MOD
" Set the filetype if the first non-comment and non-blank line starts with
" 'module <path>'.
au BufRead,BufNewFile go.mod call s:gomod()

fun! s:gomod()
  for l:i in range(1, line('$'))
    let l:l = getline(l:i)
    if l:l ==# '' || l:l[:1] ==# '//'
      continue
    endif

    if l:l =~# '^module .\+'
      setfiletype gomod
    endif

    break
  endfor
endfun

" restore Vi compatibility settings
let &cpo = s:cpo_save
unlet s:cpo_save

" vim: sw=2 ts=2 et
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim ftdetect file
"
" Language: JSX (JavaScript)
" Maintainer: Max Wang <mxawng@gmail.com>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Whether the .jsx extension is required.
if !exists('g:jsx_ext_required')
  let g:jsx_ext_required = 0
endif

" Whether the @jsx pragma is required.
if !exists('g:jsx_pragma_required')
  let g:jsx_pragma_required = 0
endif

let s:jsx_pragma_pattern = '\%^\_s*\/\*\*\%(\_.\%(\*\/\)\@!\)*@jsx\_.\{-}\*\/'

" Whether to set the JSX filetype on *.js files.
fu! <SID>EnableJSX()
  if g:jsx_pragma_required && !exists('b:jsx_ext_found')
    " Look for the @jsx pragma.  It must be included in a docblock comment
    " before anything else in the file (except whitespace).
    let b:jsx_pragma_found = search(s:jsx_pragma_pattern, 'npw')
  endif

  if g:jsx_pragma_required && !b:jsx_pragma_found | return 0 | endif
  if g:jsx_ext_required && !exists('b:jsx_ext_found') | return 0 | endif
  return 1
endfu

autocmd BufNewFile,BufRead *.jsx let b:jsx_ext_found = 1
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.js
  \ if <SID>EnableJSX() | set filetype=javascript.jsx | endif
" Detect syntax file.
autocmd BufNewFile,BufRead *.snip,*.snippets set filetype=neosnippet
autocmd BufNewFile,BufRead *.gd set ft=gdscript
au BufRead,BufNewFile go.mod set filetype=gomod
" Last Change: 2020 Sep 01

function! s:shouldFt(path)
  let l:q_dir = fnamemodify(a:path, ":p:h:h:t")

  if l:q_dir =~? "queries"
    setlocal ft=query
  endif
endfunction

autocmd BufNewFile,BufRead *.scm call s:shouldFt(expand("%"))
" Go dep and Rust use several TOML config files that are not named with .toml.
autocmd BufNewFile,BufRead *.toml,Gopkg.lock,Cargo.lock,*/.cargo/config,*/.cargo/credentials,Pipfile setf toml
