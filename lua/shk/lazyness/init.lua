-- Use `opts = {}` to force a plugin to be loaded.
--
--  This is equivalent to:
--  require('xxx').setup({})

return {
	"nvim-lua/plenary.nvim",

	-- detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",

	-- useful dev icons
	"kyazdani42/nvim-web-devicons",

	-- unimpaired.vim: Pairs of handy bracket mappings
	"tpope/vim-unimpaired",

	-- comment/uncomment
	{ "numToStr/Comment.nvim", opts = {} },

	-- display sequence keys help
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{ "<leader>c", group = "[C]ode" },
			{ "<leader>c_", hidden = true },
			{ "<leader>d", group = "[D]ocument" },
			{ "<leader>d_", hidden = true },
			{ "<leader>r", group = "[R]ename" },
			{ "<leader>r_", hidden = true },
			{ "<leader>s", group = "[S]earch" },
			{ "<leader>s_", hidden = true },
			{ "<leader>w", group = "[W]orkspace" },
			{ "<leader>w_", hidden = true },
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},

	-- measure startup time of neovim
	"tweekmonster/startuptime.vim",

	-- Auto close parentheses
	-- 'cohama/lexima.vim', -- primeagen don't like auto pair

	-- delete/change/add parentheses/quotes/XML-tags/...
	-- 'tpope/vim-surround',
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup()
		end,
	},

	-- quit buffer without closing window
	{ "moll/vim-bbye" },

	-- undo
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end,
	},

	-- switch between header/source
	{
		"jakemason/ouroboros",
		config = function()
			vim.keymap.set("n", "<leader>a", "<cmd>Ouroboros<CR>", { silent = true })
		end,
	},

	{
		"j-hui/fidget.nvim",
		opts = {
			-- options
		},
	},

	{ "kevinhwang91/nvim-bqf", opts = {} },
}
