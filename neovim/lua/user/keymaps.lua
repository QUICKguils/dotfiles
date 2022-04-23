local opts = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap

-- Set leader and local leader keys
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

-- Netrw file explorer.
keymap("n", "<leader>eh", ":Vex<CR>",  opts)
keymap("n", "<leader>el", ":Vex!<CR>", opts)
keymap("n", "<leader>ej", ":Hex<CR>",  opts)
keymap("n", "<leader>ek", ":Hex!<CR>", opts)

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
keymap("n", "<leader>th", ":se hls!<CR>",          opts)
keymap("n", "<leader>tn", ":setl rnu!<CR>",        opts)
keymap("n", "<leader>ts", ":setl nospell!<CR>",    opts)
keymap("n", "<leader>tc", ":setl cursorline!<CR>", opts)
keymap("n", "<leader>tl", ":setl list!<CR>",       opts)

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
vim.cmd [[ let g:easy_align_delimiters = {'%': {'pattern': '%', 'left_margin': 2, 'ignore_groups': ['!Comment']}} ]]

-- Miscellaneous.
keymap("n", "<leader>m", ":lc %:h<CR>", opts)
keymap("t", "<M-q>",     "<C-\\><C-N>", opts)
keymap("n", "'",         "`",           opts)
