hi Normal guifg=white guibg=black
set background=dark

set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar

if has("gui_running")
    if has("gui_gtk2")
        set guifont=Ubuntu\ Mono\ \13
    elseif has("gui_win32")
        set guifont=Ubuntu\ Mono:h13
    endif
endif
