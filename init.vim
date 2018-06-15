source ~/.config/nvim/plugins.vim

filetype plugin indent on " load filetype-specific indent files
syntax enable " enable syntax processing

set ai " Auto indent
set backspace=2
set cursorline " highlight current line
set encoding=utf8
set expandtab " tabs are spaces"
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set hlsearch " highlight matches
set laststatus=2
" set lazyredraw " redraw only when we need to.
set list
set listchars=eol:$,tab:␉·,trail:␠,nbsp:⎵
set modelines=0        " CVE-2007-2438
set mouse=a
set nowrap
set number " show line numbers"
set path+=**
set re=1
set relativenumber
set ruler
set showcmd " show command in bottom bar
set showmatch " highlight matching [{()}]
set softtabstop=2 " number of spaces in tab when editing
set splitbelow
set splitright
set tabstop=2 shiftwidth=2 " number of visual spaces per TAB
set ttimeoutlen=10
set ttyfast
if !has('nvim')
  set ttymouse=xterm2
endif
set wildmenu " visual autocomplete for command menu
set wildmode=longest:full,full
" =========================================
" Wildignore
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/smarty/*,*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*

set autoread
set autowrite

" Search
set incsearch

" TMUX
" =========================================
" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

if $TMUX == ''
    set clipboard+=unnamed
endif

" =========================================
" Keyboard config
" =========================================
let g:mapleader=';'  "Leader Key
noremap <leader>w :w<CR>
noremap <leader>t :TestNearest<CR>
noremap <leader>T :TestFile<CR>
noremap <leader>r :redraw!<CR>

nmap <F2> :NERDTreeToggle<CR>
imap <F2> <esc>:NERDTreeToggle<CR>

" Mapping jj to <esc>
imap jj <esc>


" ===========
" Git
" ===========
nnoremap <C-g>c :Gcommit<CR>
nnoremap <C-g>p :Gpull<CR>
nnoremap <C-g>P :Gpush<CR>

" ===========
" Tagbar
" ===========
nmap <F8> :TagbarToggle<CR>


" ===============
" Rails
" ===============
" set omnifunc=rubycomplete#Complete
" let g:rubycomplete_buffer_loading = 1
" let g:rubycomplete_classes_in_global=1
" let g:rubycomplete_rails = 1

augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    " autocmd FileType ruby match OverLength /\%>121v.\+/
    autocmd FileType ruby setlocal colorcolumn=120
    autocmd FileType eruby setlocal colorcolumn=120
    autocmd FileType eruby setlocal tabstop=2
    autocmd FileType eruby setlocal shiftwidth=2
    autocmd FileType eruby setlocal softtabstop=2
    autocmd FileType javascript setlocal tabstop=2
    autocmd FileType javascript setlocal shiftwidth=2
    autocmd FileType javascript setlocal softtabstop=2
    autocmd FileType go setlocal tabstop=4
    autocmd FileType go setlocal shiftwidth=4
    autocmd FileType go setlocal softtabstop=4
    autocmd FileType python setlocal colorcolumn=120

    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
    autocmd BufEnter *.ejson setlocal syntax=json
    autocmd FileType markdown setlocal spell
    autocmd BufEnter *.md setlocal spell

    autocmd FileType html setlocal spell
    autocmd BufEnter *.html setlocal spell

    autocmd BufEnter *.tex setlocal spell
    autocmd BufRead *.tex let g:tex_conceal = ""
augroup END


let g:session_autosave = 'no'

" =========================================
" Colorscheme
" =========================================
if (has("termguicolors"))
  set termguicolors
endif
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let $NVIM_TUI_ENABLE_TRUE_COLOR=1 " True gui colors in terminal
set background=dark
set t_Co=256
let g:impact_transbg=1
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
au VimLeave * set guicursor=a:block-blinkon0

syntax on
" ==============================
" Plugins configs
" ==============================


set nocursorline    " enable the horizontal line
set nocursorcolumn  " enable the vertical line
" highlight CursorLine   cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NON
" highlight CursorColumn cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE

" ============================
" Vim-stay
" ============================
set viewoptions=cursor,folds,slash,unix

" ============================
" NERDTree like setup
let g:netrw_banner = 1
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 10

function! s:OpenPR()
  !/opt/dev/bin/dev open pr
endfunction
com! OpenPR call s:OpenPR()

function! CreatePost(title)
  let l:name = strftime('%m/%d/%y') .'-'. a:title . '.md'
  let l:name = substitute(l:name, "/", "-", 'g')
  echomsg l:name
  execute 'e ~/Documents/blog/_posts/' . l:name
endfunction
command! -nargs=* CreatePost call CreatePost(<args>)

function! Push()
  execute '!git push origin HEAD'
endfunction
command! Push call Push()

function! ForceUpdate()
  execute '!git add .'
  execute '!git commit --amend'
  execute '! git push origin HEAD -f'
endfunction
command! ForceUpdate call ForceUpdate()

function! s:Notes()
  e ~/notes.md
endfunction
command! Notes call s:Notes()
" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <C-Z> :ZoomToggle<cr>

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

command! Sorc source ~/.config/nvim/init.vim


highlight MatchParen cterm=bold ctermbg=blue ctermfg=black     " Matching paren hightlight color change
highlight LineNr ctermfg=darkGrey                              " Lighter line numbers from OneDark theme
highlight CursorLineNr ctermfg=blue                            " Make current line number blue
highlight Comment cterm=italic                                 " enable italicised comments in vim
highlight CursorLine term=bold cterm=bold guibg=Grey40         " Light grey colour for cursorline
" highlight OverLength ctermbg=gray
" match OverLength /\%>121v.\+/
highlight ColorColumn ctermbg=red

nnoremap <Esc> :nohlsearch<CR><Esc>
set timeoutlen=1000 ttimeoutlen=0
runtime macros/matchit.vim
set nocompatible
if has("autocmd")
  filetype indent plugin on
endif

set hidden
nnoremap <Leader>. :cd %:p:h<CR>

" Dictionary
set dictionary=/usr/share/dict/words
" Search
"FZF
nnoremap <C-p> :FZF -i<CR>

" Search

" FZF Config
" https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2#.7tq6fyynl

" prefixes all FZF commands; Buffers -> FZFBuffers
let g:fzf_command_prefix = 'FZF'

" Open in same window/buffer
let g:fzf_buffers_jump = 1

" grep -> rg
set grepprg=rg\ --vimgrep

" https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2#.7tq6fyynl
command! -bang -nargs=* -complete=dir Rg call Rg(<q-args>)

function! Rg(args)
  let l:escaped_args = escape(a:args, '|#%')
  call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings '
        \ .'--ignore-case --hidden --glob "!{.git,node_modules,tags}" --color=always "'.l:escaped_args.'"| tr -d "\017"',
        \ 0, 0)
endfunction

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!{.git,node_modules,tags}" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0
  \ )
nnoremap <C-F> :Rg!<space>

" Other stuff
set noswapfile
runtime macros/matchit.vim
set completeopt-=preview
imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger
" Set 256 colours, dark background, and molotov


inoremap <C-L> <C-G>u<Esc>[s1z=`]a<C-G>u
nnoremap <Leader>sW :execute ":Rg! " . expand("<cWORD>")<CR>
nnoremap <Leader>sw :execute ":Rg! " . expand("<cword>")<CR>
let test#strategy = 'vimux'
inoremap <C-L> <C-G>u<Esc>[s1z=`]a<C-G>u

set wrap
" set t_Co=256
set background=dark
colorscheme jellybeans

augroup airline_config
  autocmd!
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  let g:airline_powerline_fonts = 1
  " let g:airline_section_b = '%{gina#component#repo#name()}:%{gina#component#repo#branch()}'
  let g:airline_skip_empty_sections = 1
  let g:airline_symbols.linenr = '␤'

  let g:airline#extensions#ale#enabled = 1
  let g:airline#extensions#tabline#buffer_nr_format = '%s '
  let g:airline#extensions#tabline#buffer_nr_show = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#fnamecollapse = 0
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#formatter = 'jsformatter'
augroup END
" }}}
let g:airline_theme='jellybeans'
let g:airline#extensions#tabline#enabled = 0
let rubyfold = 1
autocmd FileType ruby setlocal foldmethod=syntax

map nm ]m
map mn [m
noremap <leader>s :vnew ~/test.rb <cr>
function! s:Scratch()
  vnew ~/scratch.rb
endfunction
command! Scratch call s:Scratch()
" let g:airline#extensions#tabline#enabled = 1

nnoremap 0 $
nnoremap 9 0
inoremap <C-A> <Home>
inoremap <C-E> <End>
noremap <leader>c :BufOnly<CR>
vnoremap 0 $
vnoremap 9 0
nnoremap <C-t> :tabnew<CR>
noremap <leader>n :bnext <cr>
noremap <leader>p :bprevious <cr>
noremap <C-v> :vsplit<CR>
noremap <C-q> :q <cr>
let g:sneak#label = 1
let g:tmux_navigator_disable_when_zoomed = 1
