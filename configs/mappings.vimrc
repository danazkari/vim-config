" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

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

" Map for Search/Replace Trailing White space
:nnoremap <leader>ws :call DeleteTrailingWS()<CR>

" GitGutter Next hunk ~ hubba hubba
:nnoremap <leader>n :GitGutterNextHunk<CR>

" GitGutter prev hunk
:nnoremap <leader>N :GitGutterPrevHunk<CR>


" Toggle Paste Mode & auto unset when leaving insert mode
:nnoremap <leader>v :set paste!<CR>i
au InsertLeave * set nopaste

" Split Window Creation Helpers
:nnoremap <leader>9 :split<CR>
:nnoremap <leader>0 :vsplit<CR>

" Split Windows Sizing Helpers ((in/de)crease by four)
:nnoremap <leader>, <C-w>+
:nnoremap <leader>. <C-w>-
:nnoremap <leader>< <C-w><
:nnoremap <leader>> <C-w>>


" Pretty print JSON
:nnoremap <leader>ppj :%!python -m json.tool<CR>
