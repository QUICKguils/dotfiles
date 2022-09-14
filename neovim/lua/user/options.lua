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
	signcolumn     = "number",
	wrap           = false,
	joinspaces     = false,
	foldmethod     = "marker",
	textwidth      = 80,
	colorcolumn    = "+1",
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

local variables = {
	loaded_perl_provider = 0,
	loaded_ruby_provider = 0,
	loaded_netrwPlugin   = 1,  -- disable netrw: I use dirvish instead
	-- netrw_bufsettings = {"noma", "nobl", "nowrap", "ro", "rnu"},
	-- netrw_liststyle   = 1,
	man_hardwrap         = 0,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

for k, v in pairs(variables) do
	vim.g[k] = v
end
