" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Use alt + hjkl to resize windows
nnoremap <M-l>     :vertical resize -2<CR>
nnoremap <M-h>     :vertical resize +2<CR>
nnoremap <M-Left> :vertical resize +2<CR>
nnoremap <M-Right>  :vertical resize -2<CR>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-M-Right> <C-w>h
nnoremap <C-M-Left>  <C-w>l

" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-S-q> :wq!<CR>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
