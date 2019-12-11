syntax on
set expandtab
set shiftwidth=4
set tabstop=4
set nocompatible
set smartindent
set hlsearch
set colorcolumn=80
set textwidth=80
set scrolloff=3
set incsearch
set guioptions-=T
set guioptions-=r
set guioptions-=L
set bg=dark
set number
set lazyredraw " makes vsplit scolling faster

exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

autocmd BufWritePre * %s/\s\+$//e " clear trailling spaces
autocmd FileType perl set makeprg=perl\ -c\ %\ $*

call plug#begin('~/.vim/plugged')
Plug 'lifepillar/vim-solarized8'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Shougo/neocomplete.vim'
Plug 'vim-airline/vim-airline'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
call plug#end()

let g:solarized_termcolors=256
set t_Co=256
set termguicolors
colorscheme solarized8

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set ttimeoutlen=10
set updatetime=100

" Airline always visible
set laststatus=2
let g:airline_powerline_fonts = 1

let b:ale_linters = {'perl': ['perl', 'perlcritic']}
let b:ale_fixers = {'perl': ['perltidy']}

let g:neocomplete#enable_at_startup = 1
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

noremap <F3> :TagbarToggle <CR>
noremap <F1> :NERDTreeTabsToggle <CR>
noremap <C-p> :tabprevious <CR>
noremap <C-n> :tabnext <CR>

set tags=./.git/tags,./tags
let g:tagbar_type_perl = {
    \ 'ctagstype' : 'perl',
    \ 'kinds'     : [
        \ 'p:package:0:0',
        \ 'w:roles:0:0',
        \ 'e:extends:0:0',
        \ 'u:uses:0:0',
        \ 'r:requires:0:0',
        \ 'o:ours:0:0',
        \ 'a:properties:0:0',
        \ 'b:aliases:0:0',
        \ 'h:helpers:0:0',
        \ 's:subroutines:0:0',
        \ 'd:POD:1:0'
    \ ]
\ }
