local opts = {noremap = true, silent = true}
local keymap = vim.keymap.set

-- Set leader and local leader keys
keymap({'n', 'v'}, '<Space>', '<Nop>', opts)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Navigation between windows.
keymap("n", "<leader>h", "<C-w>h", opts)
keymap("n", "<leader>j", "<C-w>j", opts)
keymap("n", "<leader>k", "<C-w>k", opts)
keymap("n", "<leader>l", "<C-w>l", opts)
keymap("n", "<leader>H", "<C-w>H", opts)
keymap("n", "<leader>J", "<C-w>J", opts)
keymap("n", "<leader>K", "<C-w>K", opts)
keymap("n", "<leader>L", "<C-w>L", opts)
keymap("n", "<leader>=", "<C-w>=", opts)
keymap("n", "<leader>n", "<C-w>n", opts)

-- Navigation inside a window.
keymap("n", "<M-j>", "3<C-e>",     opts)
keymap("n", "<M-k>", "3<C-y>",     opts)
keymap("i", "<M-j>", "<C-X><C-e>", opts)
keymap("i", "<M-k>", "<C-X><C-y>", opts)
keymap("n", "<M-e>", "<C-e>",      opts)
keymap("n", "<M-y>", "<C-y>",      opts)
keymap("n", "<M-d>", "<C-d>",      opts)
keymap("n", "<M-u>", "<C-u>",      opts)
keymap("n", "<M-f>", "<C-f>",      opts)
keymap("n", "<M-b>", "<C-b>",      opts)
keymap("n", "<M-h>", "8zh",        opts)
keymap("n", "<M-l>", "8zl",        opts)

-- Dirvish file explorer.
keymap("n", "<leader>eh", ":    vsplit +Dirvish\\ %:p<CR>", opts)
keymap("n", "<leader>ej", ":bel  split +Dirvish\\ %:p<CR>", opts)
keymap("n", "<leader>ek", ":     split +Dirvish\\ %:p<CR>", opts)
keymap("n", "<leader>el", ":bel vsplit +Dirvish\\ %:p<CR>", opts)

-- Telescope.
keymap("n", "<leader>fn", "<cmd>Telescope <CR>",                          opts)
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>",                opts)
keymap("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>",                  opts)
keymap("n", "<leader>fc", "<cmd>Telescope command_history<CR>",           opts)
keymap("n", "<leader>fl", "<cmd>Telescope current_buffer_fuzzy_find<CR>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>",                 opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>",                   opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>",                 opts)
keymap("n", "<leader>fm", "<cmd>Telescope marks<CR>",                     opts)

-- Quick setting toggles.
keymap("n", "<leader>sh", ":se hls!<CR>",          opts)
keymap("n", "<leader>sn", ":setl rnu!<CR>",        opts)
keymap("n", "<leader>ss", ":setl nospell!<CR>",    opts)
keymap("n", "<leader>sc", ":setl cursorline!<CR>", opts)
keymap("n", "<leader>sl", ":setl list!<CR>",       opts)
local VirtualEdit_toggle = function()
	if vim.o.virtualedit == "" then
		vim.o.virtualedit = "all"
		print("virtualedit ON")
	else
		vim.o.virtualedit = ""
		print("virtualedit OFF")
	end
end
keymap("n", "<leader>sv", VirtualEdit_toggle, opts)
local Conceallevel_toggle = function()
	if vim.o.conceallevel == 0 then
		vim.o.conceallevel = 2
		print("conceallevel=2")
	else
		vim.o.conceallevel = 0
		print("conceallevel=0")
	end
end
keymap("n", "<leader>so", Conceallevel_toggle, opts)

-- Quick write, quit and close.
keymap("n", "<leader>q", ":q<CR>",   opts)
keymap("n", "<leader>w", ":w<CR>",   opts)
keymap("n", "<leader>x", ":x<CR>",   opts)
keymap("n", "<leader>c", ":clo<CR>", opts)

-- vim-easy-align.
keymap("n", "ga", "<Plug>(EasyAlign)",     {})
keymap("v", "ga", "<Plug>(EasyAlign)",     {})
keymap("n", "gA", "<Plug>(LiveEasyAlign)", {})
keymap("v", "gA", "<Plug>(LiveEasyAlign)", {})
vim.g.easy_align_delimiters = {
	['%'] = {
		pattern = '%',
		left_margin = 2,
		ignore_groups = {'!Comment'}
	}
}

-- Miscellaneous.
keymap("n", "<leader>m",      ":cd %:h<CR>", opts)
keymap("n", "<localleader>m", ":lc %:h<CR>", opts)
keymap("t", "<M-q>",          "<C-\\><C-N>", opts)
keymap("n", "'",              "`",           opts)
