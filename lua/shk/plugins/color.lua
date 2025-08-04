-- add some colorschemes as plugins
return {
	{
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			require("rose-pine").setup({})
			vim.cmd.colorscheme("rose-pine")
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
			vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
		end,
	},
	-- {
	--	"tanvirtin/monokai.nvim",
	--	config = function()
	--		require("monokai").setup({})
	--		vim.cmd.colorscheme("monokai")
	--		-- ColorMyPencils("monokai")
	--	end,
	-- },
	-- "rafi/awesome-vim-colorschemes", -- multiple colorscheme in one repository
	-- "folke/tokyonight.nvim",
}
