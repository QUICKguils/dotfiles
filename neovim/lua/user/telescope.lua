local telescope_ok, telescope = pcall(require, "telescope")
if not telescope_ok then
	return
end

local actions_ok, actions = pcall(require, "telescope.actions")
if not actions_ok then
	return
end

telescope.setup{
	defaults = {
		mappings = {
			i = {
				-- I don't care about normal mode, I just want to quit telescope
				-- when I hit <esc>.
				["<ESC>"] = actions.close
			},
		},
	},
}
