map <space> <Leader>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>W :w<CR>

function! index#base#init()
  set encoding=utf8
  set tabstop=4
  set shiftwidth=4
  set expandtab
  set showcmd
  set nu
  set mouse=a
endfunction
