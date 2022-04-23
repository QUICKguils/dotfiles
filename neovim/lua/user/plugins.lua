local fn = vim.fn

-- Automatically install packer.
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system {
		"git", "clone", "--depth", '1', "https://github.com/wbthomason/packer.nvim",
		install_path
	}
	print "Installing packer close and reopen Neovim ..."
	vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file.
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Use a protected call so we don't error out on first use.
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window.
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float {border = "rounded"}
		end,
	},
}

-- Install your plugins here.
return require('packer').startup(function(use)
	-- Let packer manage itself.
	use "wbthomason/packer.nvim"

	-- Almost mandatory plugins, used by tons of others.
	use "nvim-lua/popup.nvim"
	use "nvim-lua/plenary.nvim"

	-- Miscellaneous plugins.
	use "tpope/vim-commentary" -- use "numToStr/Comment.nvim"
	use "tpope/vim-vinegar"
	use "tpope/vim-surround"
	use "tpope/vim-repeat"
	use "tpope/vim-fugitive"
	use "junegunn/vim-easy-align"
	use "ap/vim-css-color"
	use "nvim-lualine/lualine.nvim"
	use "kyazdani42/nvim-web-devicons"
	use "lewis6991/impatient.nvim"

	-- Language specific
	use "lervag/vimtex"
	use "rust-lang/rust.vim"
	use "fatih/vim-go"

	-- Colorschemes
	use 'olimorris/onedarkpro.nvim'

	-- Completion
	use "hrsh7th/nvim-cmp"          -- The completion plugin
	use "hrsh7th/cmp-buffer"        -- buffer completions
	use "hrsh7th/cmp-path"          -- path completions
	use "hrsh7th/cmp-cmdline"       -- cmdline completions
	use "saadparwaiz1/cmp_luasnip"  -- snippet completions
	use "hrsh7th/cmp-nvim-lsp"

	-- Snippets
	use "L3MON4D3/LuaSnip"              --snippet engine
	use "rafamadriz/friendly-snippets"  -- a bunch of snippets to use

	-- LSP
	use "neovim/nvim-lspconfig"            -- enable LSP
	use "williamboman/nvim-lsp-installer"  -- simple to use language server installer

	-- Telescope
	use "nvim-telescope/telescope.nvim"

	-- Treesitter
	use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
	use "JoosepAlviste/nvim-ts-context-commentstring"

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
