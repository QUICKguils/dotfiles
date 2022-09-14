vim.o.termguicolors = true

-- nvim-colorizer {{{1

local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
	return
end

colorizer.setup()

-- Onedarkpro color scheme {{{1

-- -- Look at
-- -- /home/guil/.local/share/nvim/site/pack/packer/start/onedarkpro.nvim/lua/onedarkpro/config.lua
-- -- for mor info on configuring this theme.
-- local onedarkpro = require("onedarkpro")
--
-- onedarkpro.setup({
-- 	hlgroups = {
-- 		Operator = { style = "NONE" }, -- I removed italics for operators.
-- 	},
-- 	options = {
-- 		bold       = true, -- Use the themes opinionated bold styles?
-- 		italic     = true, -- Use the themes opinionated italic styles?
-- 		underline  = true, -- Use the themes opinionated underline styles?
-- 		undercurl  = true, -- Use the themes opinionated undercurl styles?
-- 		cursorline = true, -- Use cursorline highlighting?
-- 	}
-- })
--
-- onedarkpro.load()

-- Nord color scheme {{{1

local variables = {
	nord_italic                        = 1,
	nord_uniform_diff_background       = 1,
	nord_cursor_line_number_background = 1,
}

for k, v in pairs(variables) do
	vim.g[k] = v
end

vim.cmd('colorscheme nord')
