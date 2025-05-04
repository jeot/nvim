-- add some colorschemes as plugins
return {
	{
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			require("rose-pine").setup({})
			vim.cmd.colorscheme("rose-pine")
			-- ColorMyPencils("monokai")
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
