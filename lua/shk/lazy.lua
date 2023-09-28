local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	-- display sequence keys help
	"folke/which-key.nvim",

	-- measure startup time of neovim
	"tweekmonster/startuptime.vim",

	-- harpoon by ThePrimeagen
	'ThePrimeagen/harpoon',

	-- inline character jump with f/F/t/T
	'rhysd/clever-f.vim',

	-- some colorschemes
	'rafi/awesome-vim-colorschemes', -- multiple colorscheme in one repository
	--'folke/tokyonight.nvim',
	--'marko-cerovac/material.nvim',
	{ 'rose-pine/neovim',          as = 'rose-pine'},

	-- status/tab/buffer line
	{ 'nvim-lualine/lualine.nvim', dependencies = 'kyazdani42/nvim-web-devicons' },

	-- git fugitive
	'tpope/vim-fugitive',

	-- lsp
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },  -- Required
			{ 'williamboman/mason.nvim' }, -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' }, -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'L3MON4D3/LuaSnip' }, -- Required
		}
	},

	-- auto completion
	"hrsh7th/cmp-buffer", -- buffer completions,
	"hrsh7th/cmp-path", -- path completions
	"hrsh7th/cmp-cmdline", -- cmdline completions

	-- code snippets (for luasnip)
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets", -- a bunch of snippets to use

	-- Auto close parentheses and repeat by dot dot dot...
	'cohama/lexima.vim',

	-- delete/change/add parentheses/quotes/XML-tags/...
	-- 'tpope/vim-surround',
	{ 	'kylechui/nvim-surround', config = function() require("nvim-surround").setup() end },

	-- unimpaired.vim: Pairs of handy bracket mappings
	'tpope/vim-unimpaired',

	-- comment/uncomment
	{ 'numToStr/Comment.nvim',          config = function() require('Comment').setup() end, },

	-- file explorer
	{ 'kyazdani42/nvim-tree.lua',       dependencies = { 'kyazdani42/nvim-web-devicons' } },

	-- tree-sitter and context for neovim
	-- { 'nvim-treesitter/nvim-treesitter' , tag = "v0.9.1"},
	{ 'nvim-treesitter/nvim-treesitter' },
	'nvim-treesitter/nvim-treesitter-context',

	-- Find, Filter, Preview, Pick. (for files mostly)
	{ 'nvim-telescope/telescope.nvim', commit = "776b509", dependencies = { 'nvim-lua/plenary.nvim' } },

	-- quit buffer without closing window
	'moll/vim-bbye',

	-- undo
	'mbbill/undotree',

})
