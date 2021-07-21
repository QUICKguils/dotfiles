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
au FileType go       nmap <buffer><F5> :w<Bar>:GoRun %<CR>
au FileType go       nmap <buffer><F6> <Plug>(go-run-split)
au FileType python   nmap <buffer><F5> :w<Bar>py3file %<CR>

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
nnoremap <leader>sv :call ToggleVE()<CR>

function! ToggleVE()
	if &ve == ""
		set ve=all
	else
		set ve=""
	endif
	set ve?
endfunction

" Mappings : quick write, quit and close
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>c :clo<CR>

" Source vimscript, reload nvim config
nnoremap <leader>so :w<Bar>:source %<CR>
nnoremap <leader>r :call IsConfigFile() <Bar> :source $MYVIMRC<CR>
" TODO: rewrite a ReloadConfig() function. Problem was that 'source $MYVIMRC'
" does not work inside a function, apparently...
function! IsConfigFile()
	if $MYVIMRC == expand("%:p")
		write
	endif
endfunction

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

" ------------------------------
" Neovim lsp config (nvim 0.5.0)
" ------------------------------

"" Settings for completion-nvim plugin
""se completeopt=menuone,noinsert,noselect
"let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
"se omnifunc=v:lua.vim.lsp.omnifunc

"lua << EOF
"-- Set a bunch of language server
"require('lspconfig').pyright.setup { on_attach=require'completion'.on_attach }
"require('lspconfig').vimls.setup   { on_attach=require'completion'.on_attach }
"-- require('lspconfig').gopls.setup   { on_attach=require'completion'.on_attach }
"-- require('lspconfig').julials.setup { on_attach=require'completion'.on_attach }

"local custom_lsp_attach = function(client)
"	-- See `:help nvim_buf_set_keymap()` for more information
"	vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})
"	vim.api.nvim_buf_set_keymap(0, 'n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
"	-- Use LSP as the handler for omnifunc.
"	-- See `:help omnifunc` and `:help ins-completion` for more information.
"	vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
"end
"EOF

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
