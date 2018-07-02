" Plugin
let g:ale_emit_conflict_warnings = 0

call plug#begin('~/.config/nvim/plugged')
" Deoplete
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Theme
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'chriskempson/base16-vim'
" Git stuff
Plug 'airblade/vim-gitgutter'

" Editing
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs' "MANY features, but mostly closes ([{' etc
Plug 'tpope/vim-surround' "easily surround things...just read docs for info
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'vim-ruby/vim-ruby'
Plug 'sheerun/vim-polyglot'
Plug 'majutsushi/tagbar'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'mbbill/undotree'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-repeat'
Plug 'gcmt/wildfire.vim'

" Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Tmux
Plug 'tmux-plugins/vim-tmux-focus-events'   "Improve autoread in tmux!
Plug 'christoomey/vim-tmux-navigator'
" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'tpope/vim-obsession'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'gf3/molotov'
Plug 'nanotech/jellybeans.vim'
Plug 'ervandew/supertab'
Plug 'benmills/vimux'
Plug 'wojtekmach/vim-rename'
Plug 'michaeljsmith/vim-indent-object'
Plug 'gf3/molotov'
Plug 'tyru/open-browser-github.vim'
Plug 'tyru/open-browser.vim'
Plug 'jreybert/vimagit'
Plug 'tpope/vim-rhubarb'
Plug 'rizzatti/dash.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'justinmk/vim-sneak'
call plug#end()

" Use ripgrep
set grepprg=rg\ --vimgrep

" enable AutoSave on Vim startup
let g:auto_save = 1
"Deoplete
let g:deoplete#enable_at_startup = 1
set completeopt-=preview

let g:UltiSnipsExpandTrigger="<C-J>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
