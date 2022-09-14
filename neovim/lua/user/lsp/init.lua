-- Keep this loading order. See mason-lspconfig-quickstart

-- mason.nvim plugin simplifies the management of external tools
-- like LSP servers, DAP servers, linters and formatters.
local status_mason, mason = pcall(require, "mason")
if not status_mason then
	return
end
mason.setup()

-- mason-lspconfig.nvim plugin closes some gaps that exist between
-- mason.nvim and lspconfig.
local status_mason_lsp, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_mason_lsp then
	return
end
mason_lspconfig.setup()

-- Adding servers.
require("user.lsp.servers")

-- Prettifying the LSP appearance and shortcut.
require("user.lsp.handlers").setup()
