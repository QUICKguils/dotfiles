local  cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then return end
local  snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then return end
local  lspkind_status_ok, lspkind = pcall(require, "lspkind")
if not lspkind_status_ok then return end

-- Load the snippets from rafamadriz/friendly-snippets.
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup {
	-- enabled = function()  -- TODO: this function does not work :(
	-- 	return not cmp.config.context.in_treesitter_capture('Comment')
	-- end,
	completion = {
		-- autocomplete = false,  -- TODO: implement a <leader>sa toggle for this.
		completeopt  = "menu,menuone,noinsert",
	},
	preselect = cmp.PreselectMode.Item,
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>']     = cmp.mapping.scroll_docs(-3),
		['<C-f>']     = cmp.mapping.scroll_docs(3),
		['<C-Space>'] = cmp.mapping(function()
			if cmp.visible() then
				cmp.confirm { select = true }
			else
				cmp.complete()
			end
		end, {"i", "s"}),
		["<Tab>"]     = cmp.mapping(function(fallback)
			if luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, {"i", "s"}),
		["<S-Tab>"]   = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {"i", "s"}),
	}),
	window = {
		completion = {
			col_offset   = -3,
			side_padding = 0,
		},
	},
	formatting = {
		fields = {"kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local kind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			kind.kind = " " .. strings[1] .. " "
			kind.menu = " " .. strings[2]
			return kind
		end,
	},
	sources = cmp.config.sources {
		{name = "nvim_lsp"},
		{name = "luasnip"},
		{name = "buffer"},
		{name = "path"},
		{name = "command"},
	},
}
