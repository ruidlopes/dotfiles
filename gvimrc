" open current file in the system's bound application
if has("gui_macvim")
    macmenu &File.Print key=<nop>
    map <D-p> :Preview<CR><CR>
endif
