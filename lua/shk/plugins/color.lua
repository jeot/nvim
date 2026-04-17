return {
	-- {
	-- 	"rose-pine/neovim",
	-- 	as = "rose-pine",
	-- 	config = function()
	-- 		require("rose-pine").setup({
	-- 			disable_background = true,
	-- 			disable_float_background = true,
	-- 		})
	-- 		vim.cmd.colorscheme("rose-pine")
	-- 	end,
	-- },
	-- {
	-- 	"tanvirtin/monokai.nvim",
	-- 	config = function()
	-- 		require("monokai").setup({
	-- 			disable_background = true,
	-- 			disable_float_background = true,
	-- 		})
	-- 		vim.cmd.colorscheme("monokai")
	-- 	end,
	-- },
	{
		"tanvirtin/monokai.nvim",
		lazy = false, -- load immediately
		priority = 1000, -- load before other stuff
		config = function()
			require("monokai").setup({
				-- You can customize here if you want (optional)
				-- palette = require("monokai").pro, -- or .classic, .soda, .ristretto
				-- other options like italics, etc.
			})

			vim.cmd.colorscheme("monokai") -- or "monokai_pro", "monokai_soda", etc.
		end,
	},
	-- "rafi/awesome-vim-colorschemes", -- multiple colorscheme in one repository
	-- "folke/tokyonight.nvim",
}
