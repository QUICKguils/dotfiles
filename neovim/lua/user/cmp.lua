local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

require("luasnip/loaders/from_vscode").lazy_load()

-- Completion options
vim.opt.completeopt = {"menu", "menuone", "noinsert", "noselect"}

-- find more here: https://www.nerdfonts.com/cheat-sheet
local kind_icons = {
	Text          = "",
	Method        = "m",
	Function      = "",
	Constructor   = "",
	Field         = "",
	Variable      = "",
	Class         = "",
	Interface     = "",
	Module        = "",
	Property      = "",
	Unit          = "",
	Value         = "",
	Enum          = "",
	Keyword       = "",
	Snippet       = "",
	Color         = "",
	File          = "",
	Reference     = "",
	Folder        = "",
	EnumMember    = "",
	Constant      = "",
	Struct        = "",
	Event         = "",
	Operator      = "",
	TypeParameter = "",
}

cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-3),
		['<C-f>'] = cmp.mapping.scroll_docs(3),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<C-y>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Insert,
			-- Accept currently selected item. Set `select` to `false` to only
			-- confirm explicitly selected items.
			select = true,
		},
		["<Tab>"] = cmp.mapping(function(fallback)
			if luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	formatting = {
		format = function(entry, vim_item)
			-- This concatenates the icons with the name of the item kind
			vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				luasnip  = "[Snip]",
				buffer   = "[Buf]",
				path     = "[Path]",
			})[entry.source.name]
			return vim_item
		end,
	},
	sources = cmp.config.sources {
		{name = "nvim_lsp"},
		{name = "luasnip"},
		{name = "buffer"},
		{name = "path"},
		{name = "command"},
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	experimental = {
		ghost_text = false,
		native_menu = false,
	},
}
