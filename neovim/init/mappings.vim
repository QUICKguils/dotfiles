" Mappings : navigation entre les fenêtres
let mapleader=" "
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>H <C-w>H
nnoremap <leader>J <C-w>J
nnoremap <leader>K <C-w>K
nnoremap <leader>L <C-w>L
nnoremap <leader>= <C-w>=
nnoremap <leader>n <C-w>n

" Mappings : navigation dans la fenêtre avec alt au lieu de ctrl (plus ergo)
nnoremap <M-j> 3<C-e>
nnoremap <M-k> 3<C-y>
nnoremap <M-d> <C-d>
nnoremap <M-u> <C-u>
nnoremap <M-f> <C-f>
nnoremap <M-b> <C-b>
nnoremap <M-h> 8zh
nnoremap <M-l> 8zl

" Mappings : explorateur de fichier Netrw
nnoremap <F1> :Ex<CR>
nnoremap <F2> :Sex<CR>
nnoremap <F3> :Ex /home/guil/Documents/Ecole/Bloc_3<CR>
nnoremap <F4> :Sex /home/guil/Documents/Ecole/Bloc_3<CR>

" Mappings : fuzzy search (from fzf.vim plugin)
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fl :BLines<CR>
nnoremap <leader>fb :Buffer<CR>
nnoremap <leader>fh :Helptags<CR>
nnoremap <leader>fm :Marks<CR>

" Mappings : quick setting toggles
nnoremap <leader>sh :se   hls!<CR>
nnoremap <leader>sn :setl rnu!<CR>
nnoremap <leader>ss :setl nospell!<CR>

" Mappings : quick write and quit
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>

" Mappings : plugin-related
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nnoremap <F12> :Goyo 100+10x95%<CR>
