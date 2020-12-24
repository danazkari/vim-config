" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if &shell =~# 'fish$'
    set shell=sh
endif

" Define Map Leader
:let mapleader = "-"

" Remember info about open buggers on close
set viminfo^=%


" Disable lint
:let disable_lint = 1


set laststatus=2


filetype plugin on
filetype indent on

set matchpairs+=<:>     " specially for html
set encoding=utf-8
set t_Co=256
set backup		" keep a backup file
set backupdir=~/.vim/backup
set history=500	" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch	" do incremental searching
set noswapfile  " avoid creating swapfile
set number      " use number gutter
" set relativenumber
set hidden      " support unsaved buffer changes
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set tabstop=2
set expandtab
set nowrap
set magic
set showmatch
set noerrorbells
set hlsearch

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
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip


" Folding
set foldmethod=indent
set foldnestmax=8
set nofoldenable
set cmdheight=2


" Scrolling
set scrolloff=10
set sidescrolloff=15
set sidescroll=1



syntax on


" Set sign column clear
highlight clear SignColumn


" Default Cursor line in current window only.
set cursorline
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline


autocmd BufNewFile,BufRead *.ts,*.tsx setlocal filetype=typescript
autocmd BufNewFile,BufRead *.ts,*.tsx set syntax=typescript

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
  if has('mouse_sgr')
      set ttymouse=sgr
  elseif !has('nvim')
      set ttymouse=xterm2
  end
endif


" Only do this part when compiled with support for autocommands.
if has("autocmd")
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
endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
            \ | wincmd p | diffthis
endif

set clipboard=unnamedplus

" Copy to Clipboard
if has("unix")
    let s:uname = system("uname -s")
    if s:uname == "Darwin"
        " Do OSX stuff here
        vnoremap <leader>c :<CR>:let @a=@" \| execute "normal! vgvy" \| let res=system("pbcopy", @") \| let @"=@a<CR>
    else
        vnoremap <leader>c :w !xsel --clipboard --input<CR><CR>
    endif
endif
