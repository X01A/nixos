let g:index#plugins#load = [
  \"nerdtree",
  \"term"
  \]

function! index#plugins#init()
  for plugin in g:index#plugins#load
    exec 'call index#plugins#' . plugin . '#init()'
  endfor
endfunction
