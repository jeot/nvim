return {
	'nvim-lua/plenary.nvim',

	-- useful dev icons
	'kyazdani42/nvim-web-devicons',

	-- unimpaired.vim: Pairs of handy bracket mappings
	'tpope/vim-unimpaired',

	-- comment/uncomment
	{ 'numToStr/Comment.nvim', config = true, },

	-- display sequence keys help
	{ "folke/which-key.nvim", config = true },

	-- measure startup time of neovim
	"tweekmonster/startuptime.vim",

	-- tab adjustment
	'tpope/vim-sleuth',

	-- Auto close parentheses
	-- 'cohama/lexima.vim', -- primeagen don't like auto pair

	-- delete/change/add parentheses/quotes/XML-tags/...
	-- 'tpope/vim-surround',
	{ 'kylechui/nvim-surround',    config = function() require("nvim-surround").setup() end },

	-- quit buffer without closing window
	{ 'moll/vim-bbye' },

	-- undo
	{ 'mbbill/undotree', config = function() vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle) end },

	-- switch between header/source
	{ 'jakemason/ouroboros', config = function () vim.keymap.set('n', '<leader>a', '<cmd>Ouroboros<CR>', { silent=true }) end },

}
