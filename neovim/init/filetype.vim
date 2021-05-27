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

" Latex config (lervag/vimtex)
au FileType tex setl fo=tcqj tw=100 cc=101
au FileType tex setl spell spf=/home/guil/.local/share/nvim/site/spell/LexiqueSerieux.utf-8.add

" Start a client server (:h vimtex-clientserver)
if empty(v:servername) && exists('*remote_startserver')
	call remote_startserver('VIM')
endif

" Deactivate continuous compilation
let g:vimtex_compiler_latexmk={'continuous': 0}
