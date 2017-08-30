" VIM SETTINGS

set history=1000    " Keep 1000 lines of history.
set ruler           " Always show the cursor position.
set number          "Always show line numbers

set expandtab       " Use spaces instead of tabs when indenting.
"set smarttab        " Indent instead of tabbing at the beginning of a line.
set shiftwidth=4    " Indent by 4 spaces.
set tabstop=4       " Hard tab stop.
set softtabstop=4   " Soft tab stop.

set cursorline      " add a window-width horizontal line under the cursor 
set scrolloff=5     " always keep extra 5 lines on the edges of the screen
set encoding=utf-8  " always, everywhere

"set incsearch       " Incrementally highlight search pattern as it is updated.
"set hlsearch        " Highlight search matches after entering search pattern.
" prepend a 'remove highlighting' cmd to each esc 
"nnoremap <esc> :noh<return><esc>    

set ignorecase      " Use case insensitive search pattern matching by default.
set smartcase       " Override 'ignorecase' setting if search pattern contains uppercase characters.

"set spell " Enable spell checking.
"set complete+=kspell " Enables use of CONTROL+N or CONTROL+P within Insert mode to complete words being typed.

syntax on " Enable syntax highlighting.
autocmd BufRead,BufNewFile *.md set filetype=markdown    "Update syntax highlighting for .md Markdown extension
"filetype plugin indent on " Enable file type specific indentation.
"filetype plugin on  " enable file-specific behavior (not a fan of the Makefile behavior...)
"

" Leaders (http://stevelosh.com/blog/2010/09/coming-home-to-vim/#using-the-leader) 
"map <Leader>i mmgg=G`m
"map <Leader>cs :nohlsearch<cr>

" Auto-Commands
" - spell-check "on" by default in text-y files
autocmd FileType gitcommit setlocal spell
autocmd FileType markdown setlocal spell
autocmd FileType txt setlocal spell
autocmd FileType rst setlocal spell



" vim-syntastic 
" - https://github.com/vim-syntastic/syntastic
" 'recommended settings' 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" added settings
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,W291'
"
" </ syntastic >

" YouCompleteMe
" - https://valloric.github.io/YouCompleteMe/
"let g:ycm_python_binary_path = 'python3'


" Pathogen (plugin management) 
" - https://github.com/tpope/vim-pathogen
execute pathogen#infect()

" vim + solarized 
" - nb: this section must be *after* pathogen#infect()
syntax enable
set background=dark
"set background=light
colorscheme solarized
" </ vim + solarized > 
