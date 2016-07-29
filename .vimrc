" Maintainer:	Daniel Prado <danazkari@gmail.com>


" ========================================
" General Set up
" ========================================

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if &shell =~# 'fish$'
    set shell=sh
endif

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=500		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78


  " Omni Completion
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  " always set autoindenting on
  set autoindent

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
            \ | wincmd p | diffthis
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'

Plug 'altercation/vim-colors-solarized'

Plug 'gf3/vim-css-color'

Plug 'kchmck/vim-coffee-script'

Plug 'mattn/gist-vim'

Plug 'tpope/vim-haml'

Plug 'nono/vim-handlebars'

Plug 'vim-scripts/jade.vim'

Plug 'pangloss/vim-javascript'

Plug 'leafgarland/typescript-vim'

Plug 'plasticboy/vim-markdown'

Plug 'tpope/vim-rails'

Plug 'tpope/vim-repeat'

Plug 'vim-ruby/vim-ruby'

Plug 'wavded/vim-stylus'

Plug 'tpope/vim-surround'

Plug 'vim-scripts/lint.vim'

Plug 'scrooloose/nerdtree'

Plug 'scrooloose/syntastic'

Plug 'sophacles/vim-processing'

Plug 'airblade/vim-gitgutter'

Plug 'marijnh/tern_for_vim'

Plug 'mxw/vim-jsx'

Plug 'editorconfig/editorconfig-vim'

Plug 'bling/vim-airline'

Plug 'lambdatoast/elm.vim'

Plug 'isRuslan/vim-es6'

Plug 'kien/ctrlp.vim'

Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'elzr/vim-json'

Plug 'sickill/vim-monokai'

Plug 'mattn/emmet-vim'

Plug 'leafgarland/typescript-vim'

Plug 'Quramy/tsuquyomi'

Plug 'Shougo/vimproc.vim'

call plug#end()


" ========================================
" Personal Settings
" ========================================


" Set where backups go
set backupdir=~/.vim/backup
set noswapfile


" Personal flavor
" set relativenumber
set number
set hidden

" Indents
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set tabstop=4
set expandtab
"set softtabstop=2

set encoding=utf-8
set t_Co=256

" Folding
set foldmethod=indent
set foldnestmax=8
set nofoldenable
set cmdheight=2


filetype plugin on
filetype indent on


set nowrap
set magic
set showmatch
set noerrorbells
set incsearch
set hlsearch


" Scrolling
set scrolloff=10
set sidescrolloff=15
set sidescroll=1


" syntax highlighting & solarized config
syntax on
" let &t_Co=256
" let g:solarized_degrade=0
" let g:solarized_italic=1
" let g:solarized_bold=1
" let g:solarized_underline=1
colorscheme monokai
" set background=dark



" Set sign column clear
highlight clear SignColumn


" Default Cursor line in current window only.
set cursorline
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" Tern for vim
let g:tern_map_keys=1

" Nerd Tree
autocmd StdinReadPre * let s:std_in=1
autocmd vimenter * if !argc() | NERDTree | endif
let NERDTreeShowHidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nmap ,n :NERDTreeFind<CR>

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

nmap <silent> <c-n> :NERDTreeToggle<CR>

" TypeScript recognition
autocmd BufNewFile,BufRead *.ts set syntax=typescript

" Command mode completion

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

set runtimepath^=~/.vim/bundle/ctrlp.vim



" Set GitGutter on!
let g:gitgutter_enabled = 1


" Define Map Leader
:let mapleader = "-"


" Remember info about open buggers on close
set viminfo^=%


" Disable lint
:let disable_lint = 1


set laststatus=2


if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:airline_symbols.readonly = ''
let g:airline_symbols.crypt = ''
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.branch = '⎇'

let g:airline_detect_iminsert=1
let g:airline#extensions#syntastic#enabled = 1


let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['.ctrlp']
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip

" Syntastic config

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['tslint']

let g:syntastic_typescript_tsc_fname = ''

" Match settings
set matchpairs+=<:>     " specially for html

" ========================================
" Utility Functions & Custom Commands
" ========================================


" Highlight trailing white space for find/replace
func! DeleteTrailingWS()
  %s/\s\+$//e
endfunc


" Reset current search
command! C let @/=""


" auto format JSON File
command! F :%!python -m json.tool


" Return to last edit position when opening files
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif


" Visual * - Search for selected text * = next # = prev
" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>


" ========================================
" Custom Mappings
" ========================================


" Quick Edit for .vimrc
:nnoremap <leader>ev :split $MYVIMRC<cr>


" Source Vim
:nnoremap <leader>sv :source $MYVIMRC<cr>


" Remap keys used for tabs
:nnoremap <leader>J J


" Map some keys for easier tab usage
map <S-h> :tabfirst<CR>
map <S-j> :tabprevious<CR>
map <S-k> :tabnext<CR>
map <S-l> :tablast<CR>


" Map for nerd tree - to control n in normal mode
nmap ,w :w<CR>
nmap ,x :x<CR>

nmap <leader>g :cn<CR>
nmap <leader>G :cp<CR>

" Map for Search/Replace Trailing White space
:nnoremap <leader>ws :call DeleteTrailingWS()<CR>

" Toggle GitGutter
:nnoremap <leader><Tab> :ToggleGitGutter<CR>

" Toggle GitGutter line highlighting
:nnoremap <leader>` :ToggleGitGutterLineHighlights<CR>

" GitGutter Next hunk ~ hubba hubba
:nnoremap <leader>n :GitGutterNextHunk<CR>

" GitGutter prev hunk
:nnoremap <leader>N :GitGutterPrevHunk<CR>


" Toggle Paste Mode & auto unset when leaving insert mode
:nnoremap <leader>v :set paste!<CR>i
au InsertLeave * set nopaste

" Split Window Creation Helpers
:nnoremap <leader>9 :split<CR>
:nnoremap <leader>( :split
:nnoremap <leader>0 :vsplit<CR>
:nnoremap <leader>) :vsplit

" Split Windows Sizing Helpers ((in/de)crease by four)
:nnoremap <leader>, <C-w>+
:nnoremap <leader>. <C-w>-
:nnoremap <leader>< <C-w><
:nnoremap <leader>> <C-w>>

" Quote-Fu - handle quoting words quick and easy
"   Quote Add Single
:nnoremap <leader>qas ciw'<C-r>"'
"   Quote Add Double
:nnoremap <leader>qad ciw"<C-r>""
"   Quote Remove Single
:nnoremap <leader>qrs di'hPl2x
"   Quote Remove Double
:nnoremap <leader>qrd di"hPl2x
"   Quote Change to Single
:nnoremap <leader>qcs di"hPl2xhciw'<C-r>"'<esc>
"   Quote Change to Double
:nnoremap <leader>qcd di'hPl2xhciw"<C-r>""<esc>


"	Find, right before
":nnoremap <leader>f fh


" Copy to Clipboard
vnoremap <leader>c :w !xsel --clipboard --input<CR><CR>

" Pretty print JSON
:nnoremap <leader>ppj :%!python -m json.tool<CR>


" ========================================
" Custom Abbreviations
" ========================================


" ========================================
" Special File Type Support
" ========================================

" EJS Templates as html
au BufNewFile,BufRead *.ejs set filetype=html

autocmd BufNewFile,BufRead *.ts,*.tsx setlocal filetype=typescript
autocmd BufNewFile,BufRead *.ts,*.tsx set syntax=typescript

" Set jsx for .js files as well as .jsx
let g:jsx_ext_required = 0
