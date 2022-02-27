syntax on
set number
set ai
set ruler
set hlsearch
set expandtab
set tabstop=4
set visualbell
set pastetoggle=<F2>
set showmatch
set ignorecase
set hlsearch
set autoindent
set wildmode=longest,list
filetype plugin indent on
set shiftwidth=2
set softtabstop=2
" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if ! exists("g:leave_my_cursor_position_alone") |
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\ exe "normal g'\"" |
\ endif |
\ endif
