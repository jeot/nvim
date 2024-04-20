-- Use `opts = {}` to force a plugin to be loaded.
--
--  This is equivalent to:
--  require('xxx').setup({})

return {
	'nvim-lua/plenary.nvim',

	-- detect tabstop and shiftwidth automatically
	'tpope/vim-sleuth',

	-- useful dev icons
	'kyazdani42/nvim-web-devicons',

	-- unimpaired.vim: Pairs of handy bracket mappings
	'tpope/vim-unimpaired',

	-- comment/uncomment
	{ 'numToStr/Comment.nvim', opts = {} },

	-- display sequence keys help
	{
		"folke/which-key.nvim",
		event = 'VimEnter', -- Sets the loading event to 'VimEnter'
		config = function() -- This is the function that runs, AFTER loading
			require('which-key').setup()
			-- Document existing key chains
			-- todo:
			require('which-key').register {
				['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
				['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
				['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
				['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
				['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
			}
		end,
	},

	-- measure startup time of neovim
	"tweekmonster/startuptime.vim",

	-- Auto close parentheses
	-- 'cohama/lexima.vim', -- primeagen don't like auto pair

	-- delete/change/add parentheses/quotes/XML-tags/...
	-- 'tpope/vim-surround',
	{ 'kylechui/nvim-surround', config = function() require("nvim-surround").setup() end },

	-- quit buffer without closing window
	{ 'moll/vim-bbye' },

	-- undo
	{ 'mbbill/undotree',        config = function() vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle) end },

	-- switch between header/source
	{
		'jakemason/ouroboros',
		config = function()
			vim.keymap.set('n', '<leader>a', '<cmd>Ouroboros<CR>',
				{ silent = true })
		end
	},

	{
		"j-hui/fidget.nvim",
		opts = {
			-- options
		},
	},

	{ 'kevinhwang91/nvim-bqf', opts = {} }
}
