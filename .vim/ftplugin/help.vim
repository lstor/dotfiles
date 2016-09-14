" Follow a help link
nnoremap <buffer> <Enter> <C-]>
" Follow a help link in a new tab.
nnoremap <buffer> <C-Enter> <C-w><C-]><C-w>T
" Go back from previous link jump
nnoremap <buffer> <BS> <C-T>
" Go to next option
nnoremap <buffer> o /'\l\{2,\}'<CR>
" Go to previous option
nnoremap <buffer> O ?'\l\{2,\}'<CR>
" Go to next subject
nnoremap <buffer> s /\|\zs\S\+\ze\|<CR>
" Go to previous subject
nnoremap <buffer> S ?\|\zs\S\+\ze\|<CR>
