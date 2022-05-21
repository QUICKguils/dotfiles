-- Conventions :
--   c  -> clean, remove auxilliary files.
--   f  -> format the code.
--   k  -> check the code.
--   l  -> local execution, run the script or single file.
--   m  -> make, build, compile the program.
--   t  -> test the program, run test files.
--   v  -> visualize output.
-- <CR> -> execute binaries, run the whole program.

-- TODO: find a better way to implement the vim autocmd in lua, for example:
-- local autocmd = vim.api.nvim_create_autocmd
-- autocmd({"FileType"}, {
-- 	pattern = "c",
-- 	command = "echo 'entering a C file'"
-- })

vim.cmd([[
au FileType c setl makeprg=gcc\ -Wall\ -o\ %:r\ %
au FileType c nmap <buffer><localleader>m    :w<Bar>:make<CR>
au FileType c nmap <buffer><localleader><CR> :sp<Bar>te %:r<CR>
au FileType c nmap <buffer><localleader>l    :w<Bar>:make<Bar>! %:r<CR>

au FileType go nmap <buffer><localleader>l    :w<Bar>GoRun %<CR>
au FileType go nmap <buffer><localleader><CR> :w<Bar>GoRun<CR>

au FileType gitcommit setl textwidth=72

au FileType haskell setl expandtab

au FileType julia nmap <buffer><localleader>l :w<Bar>!julia %<CR>

au FileType tex setl formatoptions=tcqj textwidth=100
au FileType tex setl spf=~/.local/share/nvim/site/spell/LexiqueSerieux.utf-8.add

au FileType markdown setl formatoptions=tcqjn commentstring=<!--%s-->
au FileType markdown setl makeprg=pandoc\ -o\ %:r.html\ %\ --mathjax
au FileType markdown nmap <buffer><localleader>m :w<Bar>:make<CR>
au FileType markdown nmap <buffer><localleader>v :!xdg-open %:r.html<CR>

au FileType python setl textwidth=79
au FileType python nmap <buffer><localleader>f :w<Bar>!~/.miniconda3/bin/autopep8  -iaa %:p<CR>:e<CR>
au FileType python nmap <buffer><localleader>l :w<Bar>py3file %<CR>

au FileType rust nmap <buffer><localleader>f :RustFmt<CR>
au FileType rust nmap <buffer><localleader>l :RustRun<CR>
au FileType rust nmap <buffer><localleader>m :Cbuild<CR>
au FileType rust nmap <buffer><localleader>c :Cclean<CR>
au FileType rust nmap <buffer><localleader>k :Ccheck<CR>
au FileType rust nmap <buffer><localleader>t :Ctest<CR>
au FileType rust nmap <buffer><localleader><CR> :Crun<CR>

au FileType vim nmap <buffer><localleader>l :w<Bar>source %<CR>

au FileType vhdl setl commentstring=--%s
]])


local variables = {
	-- Go - vim-go
	go_highlight_operators      = 1,
	go_highlight_types          = 1,
	go_highlight_extra_types    = 1,
	go_highlight_functions      = 1,
	go_highlight_function_calls = 1,
	go_term_enabled             = 1,
	-- Latex - vimtex
	vimtex_compiler_latexmk = {["continuous"] = 0},
	vimtex_view_method      = "zathura",
	vimtex_quickfix_mode    = 0,
	-- Python - builtin
	python3_host_prog = "/home/guil/.miniconda3/bin/python",
	-- Rust - rust.vim
	rust_fold        = 1,
	rustfmt_autosave = 1,
}

for k, v in pairs(variables) do
	vim.g[k] = v
end
