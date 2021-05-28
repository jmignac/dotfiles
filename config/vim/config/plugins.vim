" load plugins
call plug#begin($HOME . '/config/vim/plugged')
  Plug 'rakr/vim-one'
  Plug 'vim-airline/vim-airline'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'vimwiki/vimwiki'
  Plug 'neoclide/coc.nvim', {'branch': 'release'} " LSP client for sorbet
  Plug 'Shopify/vim-sorbet', { 'branch': 'main' }
  Plug 'tpope/vim-endwise', { 'for': ['ruby'] }
call plug#end()


