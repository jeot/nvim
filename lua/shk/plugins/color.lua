-- examples to use the function
-- ColorMyPencils()
-- ColorMyPencils("Iceberg")
-- ColorMyPencils("github") -- light

-- ColorMyPencils("gruvbox")
-- vim.g.gruvbox_invert_selection = 0
-- vim.g.gruvbox_contrast_dark = 'soft'

local function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "#3B4252" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#3B4252" })
	vim.api.nvim_set_hl(0, "FloatBorder", { bg = "black", fg = "gray" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "black" })
	vim.api.nvim_set_hl(0, "Pmenu", { bg = "black" })
	-- vim.api.nvim_set_hl(0, "Pmenu", { bg = "black" })
	-- vim.api.nvim_set_hl(0, "FloatTitle", { bg = "black" })
	-- vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#191930", blend = 90 })
	-- vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "#191930", blend = 90 })
end

-- Create user command
vim.api.nvim_create_user_command("ColorMyPencils", function(opts)
	ColorMyPencils(opts.args ~= "" and opts.args or nil)
end, {
	nargs = "?",
	complete = function()
		-- Add your colorscheme names here for completion
		return { "rose-pine", "monokai", "gruvbox", "github", "Iceberg" }
	end,
})

-- add some colorschemes as plugins
return {
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				-- transparent = true,
			})
			ColorMyPencils("kanagawa")
		end,
	},
	-- {
	--	"rose-pine/neovim",
	--	as = "rose-pine",
	--	config = function()
	--		require("rose-pine").setup({})
	--		ColorMyPencils("rose-pine")
	--	end,
	-- },
	-- {
	--	"tanvirtin/monokai.nvim",
	--	config = function()
	--		require("monokai").setup({})
	--		vim.cmd.colorscheme("monokai")
	--		-- ColorMyPencils("monokai")
	--	end,
	-- },
	"rafi/awesome-vim-colorschemes", -- multiple colorscheme in one repository
	-- "folke/tokyonight.nvim",
}
