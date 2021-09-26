function! index#plugins#term#init()
  map <C-N> :FloatermNew<CR>
  nmap <C-T> :FloatermToggle<CR>
  tmap <C-T> <C-\><C-n>:FloatermToggle<CR>
endfunction
