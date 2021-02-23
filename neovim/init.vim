"     _       _ __        _
"    (_)___  (_) /__   __(_)___ ___
"   / / __ \/ / __/ | / / / __ `__ \
"  / / / / / / /__| |/ / / / / / / /
" /_/_/ /_/_/\__(_)___/_/_/ /_/ /_/
"
" Fichier de configuration lancé au démarrage de Neovim
" -----------------------------------------------------
"
" Neovim contient, par rapport à vim, déjà pas mal d'options par défaut.
" Checker le fichier vim_diff.txt pour les différences entre vim et neovim.

" Comportement général de neovim
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
se list lcs=trail:•,tab:\ \  ",eol:¬
se spelllang=en_us,fr
se spellfile=/home/guil/.local/share/nvim/site/spell/LexiquePerso.utf-8.add

" Formatage par type de fichier
au FileType markdown setl fo=tcqjn spell commentstring=<!--\ %s\ -->
au FileType tex setl fo=tcqj tw=100 cc=101 spf=/home/guil/.local/share/nvim/site/spell/LexiqueSerieux.utf-8.add
au FileType matlab setl commentstring=\%\ %s
au FileType vhdl setl commentstring=--\ %s
au FileType help setl nu rnu
au FileType haskell setl et
hi link jsonCommentError Comment

" Mappings : compilation par type de fichier
au FileType markdown nmap <buffer> <F5> :w<CR>:! pandoc -o <C-R>%<Del><Del>html <C-R>% --mathjax<CR>
au FileType markdown nmap <buffer> <F6> :! xdg-open <C-R>%<Del><Del>html<CR>
au FileType c nmap <buffer> <F5> :w<CR>:! gcc -Wall -o <C-R>%<Del><Del> <C-R>%<CR>
au FileType c nmap <buffer> <F6> :sp<CR>:te <C-R>%<Del><Del><CR>
au FileType julia nmap <buffer> <F5> :sp<CR>:te julia<CR>
let g:python3_host_prog = '/home/guil/anaconda3/bin/python'
let g:loaded_python_provider = 0
au FileType python map <buffer> <F5> :w<CR>:py3file <C-R>%<CR>

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

" Mappings : miscellaneous
nnoremap - :call SelectIndent()<CR>
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nnoremap <F12> :Goyo 100+10x95%<CR>
nnoremap <leader><leader> :se hls!<CR>
inoremap <M-n> <C-n>
inoremap <M-p> <C-p>

" Couleurs exactes
if (has("termguicolors"))
se termguicolors
endif
" Onedark (https://github.com/joshdick/onedark.vim)
packadd! onedark.vim
let g:onedark_terminal_italics=1
colo onedark
" Transparence dans le terminal
if has("ttyout")
	hi Normal guibg=NONE
endif

" Personnalisation de l'explorateur de fichier Netrw
let g:netrw_banner=0
let g:netrw_liststyle=1
let g:netrw_sort_by="name"
let g:netrw_sort_sequence="[\/],*,.\*$,\~$"
let g:netrw_bufsettings="noma nomod nonu nobl nowrap ro rnu"

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

" ---------------------------------------------------------------
" Définitions des fonctions personnelles appelées dans ce fichier
" ---------------------------------------------------------------

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

" Permet de sélectionner les blocs de code indentés
function! SelectIndent ()
	if indent(line(".")) != 0
		let temp_var=indent(line("."))
		exe "normal V"
		while indent(line(".")-1) >= temp_var
			exe "normal k"
		endwhile
		exe "normal o"
		while indent(line(".")+1) >= temp_var
			exe "normal j"
		endwhile
	endif
endfun
