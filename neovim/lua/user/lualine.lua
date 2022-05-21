local function my_progress()
	return '%P 🞄 %L'
end

require('lualine').setup {
	options = {
		icons_enabled        = true,
		theme                = 'onedarkpro',
		component_separators = { left = '│', right = ''},
		section_separators   = { left = '', right = ''},
		disabled_filetypes   = {},
		always_divide_middle = true,
		globalstatus         = false,
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {
			{'branch', icon = ''},
			'diff',
			{'diagnostics', symbols = {
				error = " ",
				warn  = " ",
				info  = " ",
				hint  = " "
			}}
		},
		lualine_c = {{'filename', path = 2, shorting_target = 65}},
		lualine_x = {'fileformat', 'encoding'},
		lualine_y = {{'filetype', colored = false}},
		lualine_z = {my_progress}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {{'filename', path = 2}},
		lualine_x = {my_progress},
		lualine_y = {},
		lualine_z = {}
	},
	tabline    = {},
	extensions = {}
}
