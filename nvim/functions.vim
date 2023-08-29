function! FileSize() abort
    let l:bytes = getfsize(expand('%p')) + 0
    if l:bytes <= 0
        return '0B'
    endif
    if l:bytes >= 1000
        let l:kbytes = l:bytes/1000
        let l:bytes = ((l:bytes*100)/1000)%100
        if l:bytes < 10
            let l:bytes = '0' . l:bytes
        endif
        if l:kbytes >= 1000
            let l:mbytes = l:kbytes/1000
            let l:kbytes = ((l:kbytes*100)/1000)%100
            if l:kbytes < 10
                let l:kbytes = '0' . l:kbytes
            endif
            return l:mbytes . '.' . l:kbytes . 'MB'
        endif
        return l:kbytes . '.' . l:bytes . 'KB'
    endif
    return l:bytes . 'B'
endfunction

function! Head() abort
    if FugitiveHead() !=? ''
	return printf(' %s ', FugitiveHead())
    else
	return ''
    endif
endfunction
