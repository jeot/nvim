-- use `enable=true/false` to enable or disable a plugin
-- Use `opts = {}` to force a plugin to be loaded. (good)
--  This is equivalent to:
--  require('xxx').setup({})

-- Use `config = function require('xxx').setup({}) ... end` to have more control. (not recommended)

return {
	"nvim-lua/plenary.nvim",

	-- detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",

	-- for using .evn files
	{
		"ellisonleao/dotenv.nvim",
		config = function()
			require("dotenv").setup({
				enable_on_load = true, -- Enable loading .env automatically
				cwd = "~/", -- Set to Neovim's config directory
			})
		end,
	},

	-- useful dev icons
	{ "echasnovski/mini.icons", version = "*" },

	-- unimpaired.vim: Pairs of handy bracket mappings
	"tpope/vim-unimpaired",

	-- comment/uncomment
	{ "numToStr/Comment.nvim", opts = {} },

	-- display sequence keys help
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{ "<leader>c", group = "[C]ode" },
			{ "<leader>c_", hidden = true },
			{ "<leader>d", group = "[D]ocument" },
			{ "<leader>d_", hidden = true },
			{ "<leader>r", group = "[R]ename" },
			{ "<leader>r_", hidden = true },
			{ "<leader>s", group = "[S]earch" },
			{ "<leader>s_", hidden = true },
			-- { "<leader>w", group = "[W]orkspace" },
			-- { "<leader>w_", hidden = true },
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
	-- "tweekmonster/startuptime.vim",

	-- delete/change/add parentheses/quotes/XML-tags/...
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
		enable = false,
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end,
	},

	-- switch between header/source
	{
		"jakemason/ouroboros",
		config = function()
			vim.keymap.set("n", "S", "<cmd>Ouroboros<CR>", { silent = true })
		end,
	},

	{
		"j-hui/fidget.nvim",
		opts = {
			-- options
		},
	},

	-- Better quickfix window in Neovim, polish old quickfix window
	{ "kevinhwang91/nvim-bqf", opts = {} },
}
