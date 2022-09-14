local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup {
	-- A list of parser names, or "all"
	ensure_installed = "all",

	-- install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- List of parsers to ignore installing (for "all")
	ignore_install = { "" },

	highlight = {
		-- false will disable the whole extension
		enable = true,

		-- NOTE: these are the names of the parsers and not the filetype. (for
		-- example if you want to disable highlight for the `tex` filetype, you
		-- need to include `latex` in this list as this is the name of the
		-- parser)
		-- list of language that will be disabled
		disable = { "help", "latex", "bibtex" },

		-- Setting this to true will run `:h syntax` and tree-sitter at the same
		-- time. Set this to `true` if you depend on 'syntax' being enabled
		-- (like for indentation). Using this option may slow down your editor,
		-- and you may see some duplicate highlights. Instead of true it can be
		-- a list of languages
		additional_vim_regex_highlighting = false,
	},

	-- Indent is still experimental (2022-04-27), I noticed it messed up the
	-- nvim autoindent. So I disabled it for the moment...
	indent = {
		enable = false,
	},

	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},

	-- Text motion using treesitter parsers.
	textobjects = {
		select = {
			enable = true,
			lookahead = true,  -- Automatically jump forward to textobj.
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
			},
		},
		move = {
			enable = true,
			set_jumps = true,  -- wheter to set jumps in the jumplist
			goto_next_start = {
				[']m'] = '@function.outer',
				[']]'] = '@class.outer',
			},
			goto_next_end = {
				[']M'] = '@function.outer',
				[']['] = '@class.outer',
			},
			goto_previous_start = {
				['[m'] = '@function.outer',
				['[['] = '@class.outer',
			},
			goto_previous_end = {
				['[M'] = '@function.outer',
				['[]'] = '@class.outer',
			},
		},
	},
	playground = {
		enable = true,
		disable = {},
		updatetime = 25,
		persist_queries = false,
		keybindings = {
			toggle_query_editor = 'o',
			toggle_hl_groups = 'i',
			toggle_injected_languages = 't',
			toggle_anonymous_nodes = 'a',
			toggle_language_display = 'I',
			focus_language = 'f',
			unfocus_language = 'F',
			update = 'R',
			goto_node = '<cr>',
			show_help = '?',
		},
	}
}
