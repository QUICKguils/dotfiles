local telescope_ok, telescope = pcall(require, "telescope")
if not telescope_ok then
	return
end

local actions_ok, actions = pcall(require, "telescope.actions")
if not actions_ok then
	return
end

-- I don't care about normal mode,
-- I just want to quit telescope when I hit <esc>.
telescope.setup{
	defaults = {
		mappings = {i = {["<ESC>"] = actions.close}},
		layout_config = { prompt_position = "top"},
		prompt_prefix = " ",
		sorting_strategy = "ascending",
	}
}
