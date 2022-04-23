-- Look at
-- /home/guil/.local/share/nvim/site/pack/packer/start/onedarkpro.nvim/lua/onedarkpro/config.lua
-- for mor info on configuring this theme.

local onedarkpro = require("onedarkpro")

onedarkpro.setup({
	-- Theme can be overwritten with 'onedark' or 'onelight' as a string
	theme = function()
		if vim.o.background == "dark" then
			return "onedark"
		else
			return "onelight"
		end
	end,
	options = {
		bold       = true, -- Use the themes opinionated bold styles?
		italic     = true, -- Use the themes opinionated italic styles?
		underline  = true, -- Use the themes opinionated underline styles?
		undercurl  = true, -- Use the themes opinionated undercurl styles?
		cursorline = true, -- Use cursorline highlighting?
	}
})
onedarkpro.load()
