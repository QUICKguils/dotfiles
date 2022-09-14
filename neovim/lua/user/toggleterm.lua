local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup{
	size = function(term)
		if term.direction == "horizontal" then
			return vim.o.lines * 0.25
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.45
		end
	end,
	open_mapping = [[<M-m>]],
	hide_numbers = true,
	highlights = {
		FloatBorder = {
			link = "TelescopeBorder",
		},
	},
	shade_terminals   = false,
	start_in_insert   = true,
	insert_mappings   = true,
	terminal_mappings = true,
	persist_size      = true,
	direction         = 'vertical',
	close_on_exit     = true,
	float_opts = {
		border = 'curved',
		-- width  = function()
		-- 	return vim.o.columns * 0.8
		-- end,
		-- height = function()
		-- 	return vim.o.lines * 0.9
		-- end,
		-- width = math.floor(vim.o.columns * 0.8),  -- those are default values of telescope.
		-- height = math.floor(vim.o.lines * 0.9),
		-- winblend = 5,
	}
}
