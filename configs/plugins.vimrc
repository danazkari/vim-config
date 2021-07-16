call plug#begin('~/.vim/plugged')

Plug 'Shougo/vimproc.vim', {'do' : 'make'}

Plug 'plytophogy/vim-virtualenv'

Plug 'tomlion/vim-solidity'

Plug 'amadeus/vim-mjml'

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

Plug 'mhartington/vim-angular2-snippets'

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-commentary'

Plug 'gf3/vim-css-color'

Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'

Plug 'tpope/vim-haml'

Plug 'jonsmithers/vim-html-template-literals'

Plug 'pangloss/vim-javascript'

Plug 'zivyangll/git-blame.vim'

Plug 'jparise/vim-graphql'

Plug 'plasticboy/vim-markdown'

Plug 'tpope/vim-repeat'

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

Plug 'isRuslan/vim-es6'

Plug 'kien/ctrlp.vim'

Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'elzr/vim-json'

Plug 'sickill/vim-monokai'

Plug 'mattn/emmet-vim'

Plug 'leafgarland/typescript-vim'

Plug 'Quramy/tsuquyomi'

Plug 'hashivim/vim-terraform'

call plug#end()

source ~/vim-config/configs/plugins/monokai.vimrc
source ~/vim-config/configs/plugins/tern.vimrc
source ~/vim-config/configs/plugins/nerdtree.vimrc
source ~/vim-config/configs/plugins/ctrlp.vimrc
source ~/vim-config/configs/plugins/gitgutter.vimrc
source ~/vim-config/configs/plugins/airline.vimrc
source ~/vim-config/configs/plugins/syntastic.vimrc
source ~/vim-config/configs/plugins/jsx.vimrc
source ~/vim-config/configs/plugins/git-blame.vimrc
source ~/vim-config/configs/plugins/snipmate.vimrc

