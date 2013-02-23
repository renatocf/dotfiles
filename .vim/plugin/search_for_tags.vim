" Search_for_tags.vim
" Scan the document looking for #include declarations. 
" Add files from $HOME/.vim/tags according to them.

if !exists('g:search_tags_path')
    let g:search_tags_path = "$HOME/.vim/tags/"
endif

let g:tag_files = [ 'gtk.tags',
                \   'stdio.tags', 
                \   'stdlib.tags',
                \   'string.tags',
                \   'stropts.tags' ]

let g:tmp_path = '$HOME/.vim/tags/'


function! Local_include(text)
    if text =~ '\s*"\.*"'
        mkdir(".tmp_tags", g:tmp_path)
        let tmp_dir = g:tmp_path.'tags/'

        let file_name = join(split(a:text, '"')[1:-2], '"')
        exe 'system("ctags -R --c++-kinds=p+ --fields=+iaS'.
          \ '--extra=+q '.file_name.'.tmp_tags > '.tmp_dir.'")'

        exe "setlocal tags+=" . tmp_dir . file_name
        
        return 1
    endif
    return 0
endfunction

function! Search_for_tags()
    let n = 1           " counter
    let b:include = 0   " first blank line after includes
    
    " Walking thought full file
    while n < line('$')
        let text = getline(n)
        
        " Looking for include
        if text =~ '^\s*\#\s*include\s*\(<\|"\).*\.h\(>\|"\)' 
            let b:include = 1 "include found!

            if text =~ '".*"'
                exe 'call system("mkdir '.g:tmp_path.'.tmp_tags")'
                let tmp_dir = g:tmp_path.'tags/'

                let file_name = join(split(text, '"')[1:-2], '"')
                exe 'call system("ctags -R --c++-kinds=p+ --fields=+iaS'
                 \ .'--extra=+q '.file_name.'.tmp_tags > '.tmp_dir.'")'

                exe "setlocal tags+=" . tmp_dir . file_name
            else
                echo "b"
            endif

            let i = 0
            while i < len(g:tag_files)
                
                let list = split(g:tag_files[i], '\.')
                let file_name = join(list[0:-2], '.')
                
                if text =~ file_name 
                    exe "setlocal tags+=" . g:search_tags_path . 
                            \ g:tag_files[i]
                endif
                
                let i += 1
            endwhile
        endif
        
        let n += 1
    endwhile
endfunction
