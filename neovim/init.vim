"    _      _ __
"   (_)__  (_) /_
"  / / _ \/ / __/
" /_/_//_/_/\__/.vim
"
" Repository: https://github.com/QUICKguils/dotfiles

" General Settings: {{{1

cd /home/guil
se mouse=a mousem=popup
se clipboard=unnamedplus
se tabstop=4 softtabstop=4 shiftwidth=4
se smartindent nosmarttab
se noshowmode
se number relativenumber
se nowrap nojoinspaces foldmethod=marker
se textwidth=80 colorcolumn=+1 formatoptions=cqj
se scrolloff=5
se nohlsearch ignorecase smartcase wildignorecase
se list listchars=tab:│\ ,trail:•,precedes:◀,extends:▶ ",lead:·
se spelllang=en_us,fr
se spellfile=/home/guil/.local/share/nvim/site/spell/LexiquePerso.utf-8.add

" Netrw settings (default file explorer)
" Note that some default options are overriden by vim-vinegar.
let g:netrw_liststyle=1
let g:netrw_bufsettings="noma nomod nobl nowrap ro rnu"

" Leader and local leader
let mapleader="\<Space>"
let maplocalleader="\\"

" Configuration By File Type: {{{1

" Conventions :
"   c  -> clean, remove auxilliary files.
"   f  -> format the code.
"   k  -> check the code.
"   l  -> local execution, run the script or single file.
"   m  -> make, build, compile the program.
"   t  -> test the program, run test files.
"   v  -> visualize output.
" <CR> -> execute binaries, run the whole program.

" C - ft-c-syntax
au FileType c setl makeprg=gcc\ -Wall\ -o\ %:r\ %
au FileType c nmap <buffer><localleader>m    :w<Bar>:make<CR>
au FileType c nmap <buffer><localleader><CR> :sp<Bar>te %:r<CR>
au FileType c nmap <buffer><localleader>l    :w<Bar>:make<Bar>! %:r<CR>

" Go - vim-go
au FileType go nmap <buffer><localleader>l    :w<Bar>GoRun %<CR>
au FileType go nmap <buffer><localleader><CR> :w<Bar>GoRun<CR>
let g:go_highlight_operators=1
let g:go_highlight_types=1
let g:go_highlight_extra_types=1
let g:go_highlight_functions=1
let g:go_highlight_function_calls=1
let g:go_term_enabled=1

" Git - vim-fugitive
au FileType gitcommit setl textwidth=72

" Haskell - haskell-vim
au FileType haskell setl expandtab

" Julia - julia-vim
au FileType julia nmap <buffer><localleader>l :w<Bar>!julia %<CR>

" Latex - vimtex
" TODO: remap vimtex in accordance with aforementionned naming conventions.
au FileType tex setl formatoptions=tcqj textwidth=100
au FileType tex setl spf=~/.local/share/nvim/site/spell/LexiqueSerieux.utf-8.add
let g:vimtex_compiler_latexmk={'continuous': 0}
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

" Markdown
au FileType markdown setl formatoptions=tcqjn commentstring=<!--%s-->
au FileType markdown setl makeprg=pandoc\ -o\ %:r.html\ %\ --mathjax
au FileType markdown nmap <buffer><localleader>m :w<Bar>:make<CR>
au FileType markdown nmap <buffer><localleader>v :!xdg-open %:r.html<CR>

" Python3 - LSP:pyright
au FileType python setl textwidth=79
let g:python3_host_prog = '/home/guil/.miniconda3/bin/python'
let g:loaded_python_provider = 0
au FileType python nmap <buffer><localleader>f :w<Bar>!~/.miniconda3/bin/autopep8  -iaa %:p<CR>:e<CR>
au FileType python nmap <buffer><localleader>l :w<Bar>py3file %<CR>

" Rust - rust.vim
let g:rust_fold=1
let g:rustfmt_autosave=1
au FileType rust nmap <buffer><localleader>f :RustFmt<CR>
au FileType rust nmap <buffer><localleader>l :RustRun<CR>
au FileType rust nmap <buffer><localleader>m :Cbuild<CR>
au FileType rust nmap <buffer><localleader>c :Cclean<CR>
au FileType rust nmap <buffer><localleader>k :Ccheck<CR>
au FileType rust nmap <buffer><localleader>t :Ctest<CR>
au FileType rust nmap <buffer><localleader><CR> :Crun<CR>

" Vhdl
au FileType vhdl setl commentstring=--%s

" Vim
au FileType vim nmap <buffer><localleader>l :w<Bar>source %<CR>

" Mappings: {{{1

" Mappings : navigation between windows
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

" Mappings : navigation inside a window
nnoremap <M-j> 3<C-e>
nnoremap <M-k> 3<C-y>
inoremap <M-j> <C-X><C-e>
inoremap <M-k> <C-X><C-y>
nnoremap <M-e> <C-e>
nnoremap <M-y> <C-y>
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
nnoremap <silent> <leader>th :se hls!<CR>
nnoremap <silent> <leader>tn :setl rnu!<CR>
nnoremap <silent> <leader>ts :setl nospell!<CR>
nnoremap <silent> <leader>tc :setl cursorline!<CR>
nnoremap <silent> <leader>tl :setl list!<CR>
nnoremap          <leader>tv :call VirtualEdit_toggle()<CR>
nnoremap <silent>       <F2> :call QuickFix_toggle()<CR>

function! VirtualEdit_toggle()
	&ve == "" ? se ve=all : se ve=""
	se ve?
endfunction

function! QuickFix_toggle()
	for i in range(1, winnr('$'))
		let bnum = winbufnr(i)
		if getbufvar(bnum, '&buftype') == 'quickfix'
			cclose
			return
		endif
	endfor
	copen 8
endfunction

" Mappings : quick write, quit and close
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>c :clo<CR>

" Mappings : vim-easy-align
nmap ga <Plug>(EasyAlign)
vmap ga <Plug>(EasyAlign)
nmap gA <Plug>(LiveEasyAlign)
vmap gA <Plug>(LiveEasyAlign)
let g:easy_align_delimiters = {
\	'%': {
\		'pattern':       '%',
\		'left_margin':   2,
\		'ignore_groups': ['!Comment']
\	}
\ }

" Mappings : miscellaneous
nnoremap <leader>i :se fenc? ff?<CR>
nnoremap <leader>m :lc %:h<CR>
tnoremap <M-q> <C-\><C-N>
noremap ' `

" Color Scheme And GUI Capabilities: {{{1

" Exact colors (16bits)
if (has("termguicolors"))
	se termguicolors
endif

" Nord <https://www.nordtheme.com/ports/vim>
packadd! nord-vim
let g:nord_italic=1
let g:nord_uniform_diff_background=1
let g:nord_cursor_line_number_background=1
colo nord

" " OneDark <https://github.com/joshdick/onedark.vim.git>
" packadd! onedark.vim
" let g:onedark_terminal_italics=1
" colo onedark

" " Gruvbox <https://github.com/morhetz/gruvbox.git>
" packadd! gruvbox
" let g:gruvbox_italic=1
" let g:gruvbox_undercurl=1
" let g:gruvbox_italicize_comments=0
" let g:gruvbox_invert_selection=0
" colo gruvbox

" Statusline Config: {{{1

let g:lightline = {
\	'colorscheme': 'Nord',
\	'active': {
\		'left':  [['mode', 'paste'], ['fugitive', 'path'], ['modified']],
\		'right': [['lineinfo'], ['filetype']]
\	},
\	'inactive': {
\		'left':  [['path'], ['modified']],
\		'right': [['lineinfo']]
\	},
\	'component': {
\		'lineinfo': "%P \u2022 %L",
\		'modified': "%R%M",
\		'path':     "%{pathshorten(expand('%:~'))}"
\	},
\	'component_function': {
\		'fugitive': 'LightlineFugitive'
\	},
\	'separator': {'left': "", 'right': ""},
\	'subseparator': {'left': "│", 'right': "│"}
\}

" Print the branch name if the file is under git control
function! LightlineFugitive()
	if exists('*FugitiveHead')
		let branch = FugitiveHead()
		return branch !=# '' ? "".branch : ""
	endif
	return ''
endfunction

" Neovim LSP Config: {{{1

" Settings for nvim-lspconfig plugin.
se completeopt=menuone
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_enable_auto_popup=0
se omnifunc=v:lua.vim.lsp.omnifunc

lua << EOF
-- Set a bunch of language server.
require'lspconfig'.pyright.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.rust_analyzer.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.vimls.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.gopls.setup{on_attach=require'completion'.on_attach}
-- require('lspconfig').julials.setup { on_attach=require'completion'.on_attach }
EOF
