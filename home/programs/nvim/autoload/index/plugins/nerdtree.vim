

function! index#plugins#nerdtree#init()
  let g:NERDTreeMinimalUI = 1
  let g:NERDTreeDirArrows = 1

  " Open Dir with TAB
  autocmd FileType nerdtree nmap <Tab> <CR>

  autocmd VimEnter * NERDTree
  autocmd BufEnter * NERDTreeMirror

  autocmd VimEnter * wincmd w
  map <C-t> :NERDTreeToggle<CR>
endfunction
