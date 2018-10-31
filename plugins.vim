" Plugin
let g:ale_emit_conflict_warnings = 0

call plug#begin('~/.config/nvim/plugged')
" Deoplete
" Plugle_completion_enabled = 1 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'

" Theme
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'chriskempson/base16-vim'
Plug 'colepeters/spacemacs-theme.vim'
Plug 'sjl/badwolf'

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
Plug 'gregsexton/gitv'

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

Plug 'roman/golden-ratio'
call plug#end()

" Use ripgrep
set grepprg=rg\ --vimgrep

" enable AutoSave on Vim startup

let g:auto_save = 1
"Deoplete stuff
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
set completeopt-=preview

let g:UltiSnipsExpandTrigger="<C-J>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:deoplete#omni#functions = {}
let g:deoplete#omni_patterns = {}

let s:default_sources = ['syntax', 'tag', 'buffer', 'file', 'ultisnips']
let g:deoplete#sources = {}
let g:deoplete#sources._ = s:default_sources
let g:deoplete#sources.go = ['go'] + s:default_sources
let g:deoplete#sources.javascript = ['flow'] + s:default_sources

let g:deoplete#sources.ruby = ['tag', 'solargraph', 'buffer', 'file', 'ultisnips']
let g:deoplete#sources.eruby = ['tag', 'solargraph', 'buffer', 'file', 'ultisnips']

if (exists('g:deoplete_loaded') && g:deoplete_loaded)
    call deoplete#custom#source('_', 'matchers', ['matcher_length', 'matcher_full_fuzzy'])
    call deoplete#custom#source('_', 'disabled_syntaxes', ['String'])
    call deoplete#custom#source('_', 'converters', ['converter_remove_overlap', 'converter_remove_paren'])
    call deoplete#custom#source('_', 'sorters', ['sorter_rank', 'sorter_word'])
    " call deoplete#custom#source('neosnippet', 'rank', 1000)
    call deoplete#custom#source('buffer', 'rank', 100)
    call deoplete#custom#source('around', 'rank', 200)
    call deoplete#custom#source('ultisnips', 'matchers', ['matcher_fuzzy'])
    let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
    call deoplete#custom#var('omni', 'input_patterns', {
                \ 'ruby': ['[^. *\t]\.\w*', '[a-zA-Z_]\w*::'],
                \ 'java': '[^. *\t]\.\w*',
                \ 'php': '\w+|[^. \t]->\w*|\w+::\w*',
                \})
    call deoplete#custom#var('omni', 'functions', {
                \ 'lua': 'xolox#lua#omnifunc',
                \ })
endif
" Enable completion where available.
let g:ale_completion_enabled = 1
