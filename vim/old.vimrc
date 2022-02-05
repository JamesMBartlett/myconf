call plug#begin()

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --all
  endif
endfunction

Plug 'ycm-core/YouCompleteMe', { 'do': function('BuildYCM') }

Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'vim-autoformat/vim-autoformat'
Plug 'KarimElghamry/vim-auto-comment'

" Initialize plugin system.
call plug#end()

autocmd vimenter * ++nested colorscheme gruvbox

" Set leader to space
nnoremap <space> <Nop>
let mapleader = " "

" YCM Commands
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>
nnoremap <expr> <leader>r ":YcmCompleter RefactorRename " . input("New name: ") . "<CR>"

" NerdTree
function! NerdTreeToggleWCtx()
  if bufname('%') =~ 'NERD_tree_\d\+'
    execute ":NERDTreeToggle"
  else
    execute ":NERDTreeFind"
  endif
endfunction
nnoremap <leader>n :call NerdTreeToggleWCtx()<CR>
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
      \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" fzf
set rtp+=~/.fzf
noremap <C-t> :FZF<CR>

" vim-autoformat
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:formatdef_buildifier='"buildifier --lint=fix"'
nnoremap <leader>f :Autoformat<CR>

" vim-auto-comment
let g:autocomment_map_keys=0
let g:inline_comment_dict = {
      \'//': ['cpp', 'c', 'cc', 'h', 'hpp', 'js', 'ts', 'jsx', 'tsx'],
      \'#': ['py', 'sh', 'bazel', 'bzl'],
      \'"': ['vim'],
      \}
nnoremap <C-/> :AutoInlineComment<CR>

" Visual Settings
set background=dark
set number

"Default tab settings
set tabstop=2
set shiftwidth=2
set expandtab

" Misc settings
nnoremap <leader>v "+p
set noswapfile

filetype plugin on
