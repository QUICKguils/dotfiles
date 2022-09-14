-- https://github.com/microsoft/pyright
require'lspconfig'.pyright.setup{
	python = {
		analysis = {
			autoSearchPaths = true,
			diagnosticMode = "workspace",
			useLibraryCodeForTypes = true
		},
	},
}
