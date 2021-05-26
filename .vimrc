set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin()

Plug 'rakr/vim-one'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'
Plug 'neoclide/coc.nvim', {'branch': 'release'} " LSP client for sorbet
Plug 'Shopify/vim-sorbet', { 'branch': 'main' }
Plug 'tpope/vim-endwise', { 'for': ['ruby'] }

call plug#end()            " required
filetype plugin indent on    " required

syntax on

map <F7> mzgg=G`z

set tabstop=2
set shiftwidth=2
set expandtab
set number
set nowrap
set noswapfile
set t_Co=256
set background=dark
colorscheme one
autocmd BufRead,BufNewFile *.json setfiletype javascript
set colorcolumn=90 " 90 character mark
autocmd BufWritePre * :%s/\s\+$//e " Whitespace
set list
set listchars=tab:>-

" Hydrid line numbers on the current tab
" Absolute line numbers on other tabs
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" fzf bindings to open the selected result
let g:fzf_action = { 'ctrl-t': 'vsplit' }
let g:fzf_layout = { 'down': '20%' }
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Fugitive shortcuts
noremap <leader>f :Files<cr>
noremap <leader>gd :Gdiff<cr>
noremap <leader>ga :Gwrite<cr>
noremap <leader>gr :Gread<cr>
noremap <leader>ge :Gedit<cr>
noremap <leader>glo :Gclog<cr>
noremap <leader>gcm :Gcommit<cr>
noremap <leader>t :terminal<cr>

" Set vimwiki to use markdown as default
let g:vimwiki_list = [{'path': '~/vimwiki/',
  \ 'syntax': 'markdown', 'ext': '.md'}]

" Customize autocomplete box colors
hi Pmenu cterm=bold ctermfg=0 ctermbg=7 gui=bold guifg=Black guibg=LightGrey

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Gives you the table of content of a markdown file based on ## entries
inoremap <leader>toc :read !cat '%' <bar> $BIN/gh-md-toc -<cr>