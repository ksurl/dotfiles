" vim
set number
set ruler
set pastetoggle=<F2>
set expandtab
set tabstop=2
set smarttab
set showmatch
set ignorecase
set smartcase
set hlsearch
set hidden
set nomodeline
set autoindent
filetype plugin indent on
set shiftwidth=2
set shiftround
set softtabstop=2
set mouse=a
set wildmenu
set wildmode=list:longest
set splitright
set splitbelow

" plugins
call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
call plug#end()

" treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = false,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
  },
}
EOF

" lightline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [['clock'], ['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype']],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ 'component': {
      \    'clock': '%{strftime("%H:%M")}'
      \ },
      \ }

" nvcode
let g:nvcode_termcolors = 256

" NERDTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" close vim if NERDTree is last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" toggle NERDTree with Ctrl+B
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

colorscheme nvcode

" checks if your terminal has 24-bit color support
"if (has("termguicolors"))
"  set termguicolors
"  hi LineNr ctermbg=NONE guibg=NONE
"endif

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal with ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" Mappings
let mapleader = ","
inoremap jj <esc>

