syntax on
set nu
set ai
set ruler
set hlsearch
set expandtab
set tabstop=4
set visualbell
filetype plugin on
" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if ! exists("g:leave_my_cursor_position_alone") |
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\ exe "normal g'\"" |
\ endif |
\ endif