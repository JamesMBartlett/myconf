" Vim syntax file
" Language:   PDLL
" Maintainer: The LLVM team, http://llvm.org/
" Version:    $Revision$

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" May be changed if you have a really slow machine
syntax sync minlines=100

syn case match

syn keyword pdllKeyword   let with include replace rewrite benefit recursion
syn keyword pdllType      Pattern op

syn match   pdllNumber    /\<\d\+\>/
syn match   pdllNumber    /\<\d\+\.\d*\>/
syn match   pdllNumber    /\<0b[01]\+\>/
syn match   pdllNumber    /\<0x[0-9a-fA-F]\+\>/
syn region  pdllString    start=/"/ skip=/\\"/ end=/"/    oneline

syn region  pdllCode      start=/\[{/ end=/}\]/

syn keyword pdllTodo             contained TODO FIXME
syn match   pdllComment   /\/\/.*$/         contains=pdllTodo
" Handle correctly imbricated comment
syn region  pdllComment2 matchgroup=pdllComment2  start=+/\*+ end=+\*/+ contains=pdllTodo,pdllComment2

if version >= 508 || !exists("did_c_syn_inits")
  if version < 508
    let did_c_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink pdllKeyword Statement
  HiLink pdllType Type
  HiLink pdllNumber Number
  HiLink pdllComment Comment
  HiLink pdllComment2 Comment
  HiLink pdllString String
  " May find a better Hilight group...
  HiLink pdllCode Special
  HiLink pdllTodo Todo

  delcommand HiLink
endif

let b:current_syntax = "tablegen"
