require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'onedarkpro',
		component_separators = { left = '│', right = '│'},
		section_separators = { left = '', right = ''},
		disabled_filetypes = {},
		always_divide_middle = true,
		globalstatus = false,
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff', 'diagnostics'},
		lualine_c = {{'filename', path = 2, shorting_target = 60}},
		lualine_x = {'encoding', 'fileformat'},
		lualine_y = {{'filetype', colored = false}},
		lualine_z = {'%P · %L'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {{'filename', path = 2}},
		lualine_x ={'%P · %L'},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	extensions = {}
}
