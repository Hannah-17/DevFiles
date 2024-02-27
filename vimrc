set nocompatible              " be iMproved, required
filetype off                  " required

set tabstop=2
set shiftwidth=2
set cursorline
set cursorcolumn
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
set statusline+=%F%=%l/%c
set hlsearch
set laststatus=2
syntax on
set colorcolumn=80
set paste
set background=dark

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'preservim/nerdtree'
  Plugin 'ncm2/ncm2'
  Plugin 'roxma/nvim-yarp'
  Plugin 'SirVer/ultisnips'
  Plugin 'honza/vim-snippets'
  Plugin 'PProvost/vim-ps1'
call vundle#end()            " required
autocmd VimEnter * NERDTree
filetype plugin indent on    " required
