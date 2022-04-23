-- TODO: find a way to integrate the remaining `vim.cmd` commands.

local options = {
	mouse          = "a",
	mousem         = "popup",
	clipboard      = "unnamedplus",
	tabstop        = 4,
	softtabstop    = 4,
	shiftwidth     = 4,
	smartindent    = true,
	smarttab       = false,
	showmode       = false,
	number         = true,
	relativenumber = true,
	wrap           = false,
	joinspaces     = false,
	foldmethod     = "marker",
	textwidth      = 80,
	formatoptions  = "cqj",
	scrolloff      = 5,
	hlsearch       = false,
	ignorecase     = true,
	smartcase      = true,
	wildignorecase = true,
	list           = true,
	listchars      = {tab = "│ ", precedes = "◀", extends = "▶", trail = "•"},
	spelllang      = {"en_us", "fr"},
	spellfile      = "/home/guil/.local/share/nvim/site/spell/LexiquePerso.utf-8.add",
}

vim.cmd [[ let g:netrw_liststyle = 1 ]]
vim.cmd [[ let g:netrw_bufsettings = "noma nomod nobl nowrap ro rnu" ]]
vim.cmd [[ set colorcolumn=+1 ]]

for k, v in pairs(options) do
	vim.opt[k] = v
end
