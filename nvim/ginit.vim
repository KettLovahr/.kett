Guifont Victor\ Mono:h12

function! Zoom(amount) abort
	call ZoomSet(matchstr(&guifont, '\d\+$') + a:amount)
endfunc

function ZoomSet(font_size) abort
	let &guifont = substitute(&guifont, '\d\+$', a:font_size, '')
endfunc

noremap <silent> <C-=> :call Zoom(v:count1)<CR>
noremap <silent> <C--> :call Zoom(-v:count1)<CR>
noremap <silent> <C-0> :call ZoomSet(10)<CR>
