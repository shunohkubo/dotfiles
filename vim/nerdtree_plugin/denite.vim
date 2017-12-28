function! NERDTreeGrep()
  let s:path = g:NERDTreeFileNode.GetSelected().path.str()
  execute 'Denite -no-empty -path=' . s:path . ' grep'
:endfunction

call g:NERDTreeAddKeyMap({ 'key': '<Leader>g', 'callback': 'NERDTreeGrep' })
