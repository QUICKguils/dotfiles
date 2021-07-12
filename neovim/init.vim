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
se nowrap nojoinspaces textwidth=80 cc=81 formatoptions=cqj
se scrolloff=5
se nohls ignorecase smartcase
se list lcs=trail:•,tab:│\ ,extends:▶,precedes:◀
se spelllang=en_us,fr
se spellfile=/home/guil/.local/share/nvim/site/spell/LexiquePerso.utf-8.add

" Netrw settings (default file explorer)
" Note that some default options are overriden by vinegar.
let g:netrw_liststyle=1
let g:netrw_bufsettings="noma nomod nobl nowrap ro rnu"

"--------------------------------------------------
" Formatting, mappings and compilation by file type
"--------------------------------------------------

" Formatting by file type
au FileType markdown  setl fo=tcqjn spell commentstring=<!--\ %s\ -->
au FileType matlab    setl commentstring=\%\ %s
au FileType vhdl      setl commentstring=--\ %s
au FileType haskell   setl et
au FileType gitcommit setl tw=72 cc=73
au FileType rust      setl cc=100

" Mappings : compilation by file type
map <F5> :w<Bar>:make<CR>
au FileType markdown setl makeprg=pandoc\ -o\ %:r.html\ %\ --mathjax
au FileType markdown nmap <buffer><F6> :!xdg-open %:r.html<CR>
au FileType c        setl makeprg=gcc\ -Wall\ -o\ %:r\ %
au FileType c        nmap <buffer><F6> :sp<Bar>:te %:r<CR>
au FileType go       nmap <buffer><F5> :w<Bar>:GoRun %
au FileType go       nmap <buffer><F6> <Plug>(go-run-split)
au FileType python   setl makeprg=py3file\ %

" Python3 config
let g:python3_host_prog = '/home/guil/miniconda3/bin/python'
let g:loaded_python_provider = 0

" Latex config
au FileType tex setl fo=tcqj tw=100 cc=101
au FileType tex setl spell spf=/home/guil/.local/share/nvim/site/spell/LexiqueSerieux.utf-8.add
" Vimtex config
let g:vimtex_compiler_latexmk={'continuous': 0}
let g:vimtex_view_method="zathura"
" Start a client server (see vimtex-clientserver)
if empty(v:servername) && exists('*remote_startserver')
	call remote_startserver('VIM')
endif

"---------
" Mappings
"---------

" Mappings : navigation between windows
let mapleader="\<Space>"
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

" Mappings : navigation inside a window with alt instead of ctrl (more ergo)
nnoremap <M-j> 3<C-e>
nnoremap <M-k> 3<C-y>
nnoremap <M-d> <C-d>
nnoremap <M-u> <C-u>
nnoremap <M-f> <C-f>
nnoremap <M-b> <C-b>
nnoremap <M-h> 8zh
nnoremap <M-l> 8zl

" Mappings : Netrw file explorer
nnoremap <leader>eh :Vex<CR>
nnoremap <leader>el :Vex!<CR>
nnoremap <leader>ej :Hex<CR>
nnoremap <leader>ek :Hex!<CR>

" Mappings : fuzzy search (from fzf.vim plugin)
nnoremap <leader>fi :Files 
nnoremap <leader>fd :Files ~/Documents<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fl :BLines<CR>
nnoremap <leader>fb :Buffer<CR>
nnoremap <leader>fh :Helptags<CR>
nnoremap <leader>fm :Marks<CR>
nnoremap <leader>ft :Filetypes<CR>

" Mappings : quick setting toggles
nnoremap <leader>sh :se hls!<CR>
nnoremap <leader>sn :setl rnu!<CR>
nnoremap <leader>ss :setl nospell!<CR>

" Mappings : quick write and quit
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>

" Mappings : plugin-related
nmap ga    <Plug>(EasyAlign)
vmap ga    <Plug>(EasyAlign)
nmap gA    <Plug>(LiveEasyAlign)
vmap gA    <Plug>(LiveEasyAlign)
nmap <F12> :Goyo 100+10x95%<CR>

" Mappings : terminal mode
tnoremap <M-q> <C-\><C-N>

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

" " Gruvbox (https://github.com/morhetz/gruvbox)
" packadd! gruvbox
" let g:gruvbox_italic=1
" let g:gruvbox_invert_selection=0
" colo gruvbox

"----------------------------------
" Statusline config (lightline.vim)
"----------------------------------

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

" Print the lock '' for RO file
function! LightlineReadonly()
	return &readonly ? "\ue0a2" : ''
endfunction

" Print the branch '' if the file is under git control
function! LightlineFugitive()
	if exists('*FugitiveHead')
		let branch = FugitiveHead()
		return branch !=# '' ? "\ue0a0 ".branch : ''
	endif
	return ''
endfunction

" Print the '+' sign only when the buffer is modified
function! LightlineModified()
	return &modifiable && &modified ? '+': ''
endfunction
