"     _       _ __        _
"    (_)___  (_) /__   __(_)___ ___
"   / / __ \/ / __/ | / / / __ `__ \
"  / / / / / / /__| |/ / / / / / / /
" /_/_/ /_/_/\__(_)___/_/_/ /_/ /_/

"-----------------
" General settings
"-----------------

cd /home/guil
se mouse=a mousem=popup
se clipboard=unnamedplus
se tabstop=4 softtabstop=4 shiftwidth=4
se smartindent
se noshowmode
se nu rnu
se nowrap textwidth=80 cc=81 formatoptions=cqj
se scrolloff=5
se nohls ignorecase smartcase
se list lcs=trail:•,tab:│\ ,extends:▶,precedes:◀
se spelllang=en_us,fr
se spellfile=/home/guil/.local/share/nvim/site/spell/LexiquePerso.utf-8.add

"--------------------------------------------------
" Formatting, mappings and compilation by file type
"--------------------------------------------------

" Formatting by file type
au FileType markdown  setl fo=tcqjn spell commentstring=<!--\ %s\ -->
au FileType matlab    setl commentstring=\%\ %s
au FileType vhdl      setl commentstring=--\ %s
au FileType haskell   setl et
au FileType gitcommit setl tw=72 cc=73
au FileType rust      setl cc=100 fo=cqj " overwrite g:rust_recommended_style
au FileType rust      nmap <buffer> <F7> :RustFmt<CR>:w<CR>

" Mappings : compilation by file type
au FileType markdown nmap <buffer><F5> :w<CR>:!pandoc -o <C-R>%<Del><Del>html <C-R>% --mathjax<CR>
au FileType markdown nmap <buffer><F6> :!xdg-open <C-R>%<Del><Del>html<CR>
au FileType c        nmap <buffer><F5> :w<CR>:!gcc -Wall -o <C-R>%<Del><Del> %<CR>
au FileType c        nmap <buffer><F6> :sp<CR>:te <C-R>%<Del><Del><CR>
au FileType go       nmap <buffer><F5> :w<CR>:GoRun %<CR>
au FileType python   nmap <buffer><F5> :w<CR>:py3file <C-R>%<CR>
let g:python3_host_prog = '/home/guil/miniconda3/bin/python'
let g:loaded_python_provider = 0

" Latex config
au FileType tex setl fo=tcqj tw=100 cc=101
au FileType tex setl spell spf=/home/guil/.local/share/nvim/site/spell/LexiqueSerieux.utf-8.add

" Vimtex config
let g:vimtex_compiler_latexmk={'continuous': 0}
let g:vimtex_compiler_progname='nvr'

" Start a client server (:h vimtex-clientserver)
if empty(v:servername) && exists('*remote_startserver')
	call remote_startserver('VIM')
endif

"---------
" Mappings
"---------

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
nnoremap <leader>fi :Files 
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fl :BLines<CR>
nnoremap <leader>fb :Buffer<CR>
nnoremap <leader>fh :Helptags<CR>
nnoremap <leader>fm :Marks<CR>

" Mappings : quick setting toggles
nnoremap <leader>sh :se hls!<CR>
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

"------------------------------------------
" Colorscheme and gui-capabilities settings
"------------------------------------------

" Exact colors (16bits)
if (has("termguicolors"))
	se termguicolors
endif

" Onedark (https://github.com/joshdick/onedark.vim)
packadd! onedark.vim
let g:onedark_terminal_italics=1
colo onedark

"---------------------------------------
" Netrw settings (default file explorer)
"---------------------------------------

let g:netrw_banner=0
let g:netrw_liststyle=1
let g:netrw_sort_by="name"
let g:netrw_sort_sequence="[\/],*,.\*$,\~$"
let g:netrw_bufsettings="noma nomod nonu nobl nowrap ro rnu"

"----------------------------------
" Statusline config (lightline.vim)
"----------------------------------

" Configuration de la barre de statut
let g:lightline = {
\	'colorscheme':'onedark',
\	'active': {
\		'left': [
\			['mode', 'paste'],
\			['fugitive', 'filename', 'readonly', 'mymodified']
\		],
\		'right': [['lineinfo'], ['filetype'], ['fileencoding']]
\	},
\	'inactive': {
\		'left': [['filename', 'readonly', 'mymodified']],
\		'right': [['lineinfo']]
\	},
\	'component': {'lineinfo': "%P \u2022 %L"},
\	'component_function': {
\		'readonly':   'LightlineReadonly',
\		'fugitive':   'LightlineFugitive',
\		'mymodified': 'LightlineModified'
\	},
\	'separator': {'left': "", 'right': ""},
\	'subseparator': {'left': "│", 'right': "│"}
\}

" Barre de statut : afficher le verrou  si fichier 'read only'
function! LightlineReadonly()
	return &readonly ? "\ue0a2" : ''
endfunction

" Barre de statut : afficher la branche  si git est activé pour le dossier
function! LightlineFugitive()
	if exists('*FugitiveHead')
		let branch = FugitiveHead()
		return branch !=# '' ? "\ue0a0 ".branch : ''
	endif
	return ''
endfunction

" Barre de statut : afficher '+' seulement si le fichier est modifié
function! LightlineModified()
	return &modifiable && &modified ? '+': ''
endfunction
