syntax on
set expandtab
set shiftwidth=4
set tabstop=4
set nocompatible
set smartindent
set hlsearch " highlight search results
set incsearch " search while typing
set colorcolumn=80
set textwidth=80
set scrolloff=3
set guioptions-=T
set guioptions-=r
set guioptions-=L
set bg=dark
set number
set lazyredraw " makes vsplit scolling faster

exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

let g:xml_syntax_folding=1
autocmd FileType xml setlocal foldmethod=syntax
autocmd BufWritePre * %s/\s\+$//e " clear trailling spaces
autocmd FileType perl set makeprg=perl\ -c\ %\ $*
autocmd FileType perl setlocal equalprg=perltidy\ -st

call plug#begin('~/.vim/plugged')
"Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
"Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
"Also: pip3 install pynvim
Plug 'vim-airline/vim-airline'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
call plug#end()

let g:solarized_termcolors=256
set t_Co=256
set termguicolors
colorscheme gruvbox

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set ttimeoutlen=10
set updatetime=100

" Airline always visible
set laststatus=2
let g:airline_powerline_fonts = 1

let b:ale_linters = {'perl': ['perl', 'perlcritic'], 'javascript': ['standard']}
let b:ale_fixers = {'perl': ['perltidy']}

let g:deoplete#enable_at_startup = 1
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
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

noremap <F3> :TagbarToggle <CR>
noremap <F1> :NERDTreeTabsToggle <CR>
"Control space
noremap <C-@> :FZF <CR>
noremap <C-p> :bp <CR>
noremap <C-n> :bn <CR>

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
