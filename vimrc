" NeoBundle {{{
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'SirVer/ultisnips'
NeoBundle 'bling/vim-airline'
NeoBundle 'chriseppstein/vim-haml'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'ervandew/supertab'
NeoBundle 'godlygeek/tabular'
NeoBundle 'henrik/vim-qargs'
NeoBundle 'hynek/vim-python-pep8-indent'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'morhetz/gruvbox'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'thinca/vim-visualstar'
NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'tommcdo/vim-exchange'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'vim-scripts/YankRing.vim'
NeoBundle 'wincent/Command-T'
NeoBundle 'zhaocai/GoldenView.Vim'

NeoBundleCheck
call neobundle#end()
" }}}

" General settings {{{
set encoding=utf-8
set t_Co=256                      " moar colors
set clipboard=unnamed             " use system clipboard
set nocompatible                  " nocompatible is good for humans
syntax enable                     " enable syntax highlighting...
filetype plugin indent on         " depending on filetypes...
runtime macros/matchit.vim        " with advanced matching capabilities
set pastetoggle=<F12>             " for pasting code into Vim
set timeout tm=1000 ttm=100       " fix slight delay after pressing Esc then O
set autoread                      " auto load files if vim detects change
set autowrite                     " auto write files when moving around
set nobackup                      " disable backup files...
set noswapfile                    " and swap files

" Style
set background=dark
color gruvbox
set number                        " line numbers are cool
set relativenumber                " relative numbers are cooler
set ruler                         " show the cursor position all the time
set nocursorline                  " disable cursor line
set showcmd                       " display incomplete commands
set novisualbell                  " no flashes please
set scrolloff=3                   " provide some context when editing
set hidden                        " Allow backgrounding buffers without writing them, and
                                  " remember marks/undo for backgrounded buffers
" Mouse
set mousehide                     " hide mouse when writing
set mouse=a                       " we love the mouse

" Whitespace
set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set softtabstop=2                 " when deleting, treat spaces as tabs
set expandtab                     " use spaces, not tabs
set list                          " show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode
set autoindent                    " keep indentation level when no indent is found

" Wild life
set wildmenu                      " wildmenu gives autocompletion to vim
set wildmode=list:longest,full    " autocompletion shouldn't jump to the first match
set wildignore+=*.scssc,*.sassc,*.csv,*.pyc,*.xls
set wildignore+=tmp/**,node_modules/**

" List chars
set listchars=""                  " reset the listchars
set listchars=tab:▸\ ,eol:¬       " a tab should display as "▸ ", end of lines as "¬"
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " the character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " the character to show in the first column when wrap is
                                  " off and the line continues beyond the left of the screen
set fillchars+=vert:\             " set vertical divider to empty space

" Searching
set hlsearch                      " highlight matches...
nohlsearch                        " but don't highlight last search when reloading
set incsearch                     " incremental searching
set ignorecase                    " searches are case insensitive...
set smartcase                     " unless they contain at least one capital letter

" Windows
set splitright                    " create new horizontal split on the right
set splitbelow                    " create new vertical split below the current window

" Backup and status line
set backupdir=~/.vim/_backup    " where to put backup files.
set directory=~/.vim/_temp      " where to put swap files.
set laststatus=2
" }}}

" FileType settings {{{
if has("autocmd")
  " in Makefiles use real tabs, not tabs expanded to spaces
  augroup filetype_make
    au!
    au FileType make setl ts=8 sts=8 sw=8 noet
  augroup END

  " make sure all markdown files have the correct filetype set and setup wrapping
  augroup filetype_markdown
    au!
    au FileType markdown setl tw=80
    au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
  augroup END

  " treat JSON files like JavaScript
  augroup filetype_json
    au!
    au BufNewFile,BufRead *.json setf javascript
  augroup END

  " slim filetype
  augroup filetype_slim
    au!
    au BufNewFile,BufRead *.slim setf slim
  augroup END

  " make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
  augroup filetype_django
    au!
    au FileType python setl sts=4 ts=4 sw=4
  augroup END

  " delete Fugitive buffers when they become inactive
  augroup filetype_fugitive
    au!
    au BufReadPost fugitive://* set bufhidden=delete
  augroup END

  " fold automatically with triple {
  augroup filetype_vim
    au!
    au FileType vim,javascript,python,c setlocal foldmethod=marker nofoldenable
  augroup END

  " enable <CR> in command line window and quickfix
  augroup enable_cr
    au!
    au CmdwinEnter * nnoremap <buffer> <CR> <CR>
    au BufWinEnter quickfix nnoremap <buffer> <CR> <CR>
  augroup END

  " disable automatic comment insertion
  augroup auto_comments
    au!
    au FileType * setlocal formatoptions-=ro
  augroup END

  " remember last location in file, but not for commit messages,
  " or when the position is invalid or inside an event handler,
  " or when the mark is in the first line, that is the default
  " position when opening a file. See :help last-position-jump
  augroup last_position
    au!
    au BufReadPost *
      \ if &filetype !~ '^git\c' && line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
  augroup END
endif
" }}}

" Mappings {{{
let mapleader=','

" open vimrc and reload it
nnoremap <Leader>vv :vsplit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

" disable man page for word under cursor
nnoremap K <Nop>

" Y u no consistent?
function! YRRunAfterMaps()
  nnoremap <silent> Y :<C-U>YRYankCount 'y$'<CR>
endfunction

" clear the search buffer when hitting return
nnoremap <CR> :nohlsearch<CR>

" expand %% to current directory
cnoremap %% <C-R>=expand('%:h').'/'<CR>
nmap <Leader>e :e %%

" easy way to switch between latest files
nnoremap <Leader><Leader> <C-^>
nnoremap <Leader>vsp :execute "vsplit " . bufname("#")<CR>
nnoremap <Leader>sp :execute "split " . bufname("#")<CR>

" find merge conflict markers
nnoremap <silent> <Leader>cf <Esc>/\v^[<=>]{7}( .*\|$)<CR>

" show colorcolumn
nnoremap <silent> <Leader>sc :set colorcolumn=80<CR>

" copy current path
nnoremap <silent> <Leader>p :let @* = expand("%")<CR>

" easy substitutions
nnoremap <Leader>r :%s///gc<Left><Left><Left>
nnoremap <Leader>R :%s:::gc<Left><Left><Left>

" remove whitespaces and windows EOL
command! KillWhitespace :normal :%s/\s\+$//e<CR><C-O><CR>
command! KillControlM :normal :%s/<C-V><C-M>//e<CR><C-O><CR>
nnoremap <Leader>kw :KillWhitespace<CR>
nnoremap <Leader>kcm :KillControlM<CR>

" compile c programs
nnoremap <Leader>cc :w\|:!gcc % -Wall && ./a.out<CR>

" convert ruby 1.8 -> 1.9 hash syntax
noremap <Leader>crh :%s/:\(\w\+\)\s*=>/\1:/ge<CR><C-O>

" convert should -> expect rspec syntax
function! ConvertShouldToExpect()
  let rspec_conversions = {
        \ 'should': 'to',
        \ 'should_not': 'not_to',
        \ 'should_receive': 'to receive',
        \ 'should_not_receive': 'not_to receive',
        \ }

  for [old, new] in items(rspec_conversions)
    execute "normal! " . ':%s/\v^(\s+)(.+)\.' . old . '>/\1expect(\2).' . new . '/ge' . "\<CR>"
  endfor
endfunction
nnoremap <Leader>cse :call ConvertShouldToExpect()<CR>

" convert assignment -> let rspec syntax
nnoremap <Leader>cal :s/\v(\S+)\s*\=\s*(.+)/let(:\1) { \2 }/e<CR><C-O>

" easy global search
nnoremap <C-S> :Ack <C-R><C-W><CR>
vnoremap <C-S> y<Esc>:Ack '<C-R>"'<CR>

" easier navigation between split windows
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

" disable cursor keys in normal mode
nnoremap <Left>  :echo "no!"<CR>
nnoremap <Right> :echo "no!"<CR>
nnoremap <Up>    :echo "no!"<CR>
nnoremap <Down>  :echo "no!"<CR>

" Fugitive
nnoremap <Leader>gs  :Gstatus<CR>
nnoremap <Leader>gd  :Gdiff<CR>
nnoremap <Leader>gci :Gcommit<CR>
nnoremap <Leader>gw  :Gwrite<CR>
nnoremap <Leader>gr  :Gread<CR>
nnoremap <Leader>gb  :Gblame<CR>

" Plugins mapping
nnoremap <Leader>f :CommandT<CR>
nnoremap <Leader>F :CommandTFlush<CR>\|:CommandT<CR>
nnoremap <Leader>. :CommandTTag<CR>
nnoremap <silent> <S-left> <Esc>:bp<CR>
nnoremap <silent> <S-right> <Esc>:bn<CR>
nnoremap <Leader>a <Esc>:Ack<space>
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>u :GundoToggle<CR>
nnoremap <leader>t :wa<CR>\|:call RunCurrentSpecFile()<CR>
nnoremap <leader>T :wa<CR>\|:call RunNearestSpec()<CR>
" }}

" Plugins configuration {{{
let g:ruby_indent_access_modifier_style = 'outdent'
let g:CommandTMaxHeight = 20
let g:CommandTCancelMap = ['<Esc>', '<C-C>']
let g:CommandTSelectNextMap = ['<C-n>', '<C-j>', '<Esc>OB']
let g:CommandTSelectPrevMap = ['<C-p>', '<C-k>', '<Esc>OA']
let g:NERDTreeMouseMode = 3
let g:NERDTreeHighlightCursorline = 0
let g:gundo_right = 1
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:airline_theme = 'badwolf'
let g:airline_powerline_fonts = 1
let g:rspec_command = "!t {spec}"
let g:goldenview__enable_default_mapping = 0
let g:ackhighlight = 1
let g:ackprg = 'ag --nogroup --nocolor --column'
" }}}
