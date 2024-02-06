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
	-- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#3B4252", fg = "#5E81AC" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#3B4252" })
	-- vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#3B4252" })
	-- vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "#3B4252" })
end

-- add some colorschemes as plugins
return {
	'rafi/awesome-vim-colorschemes', -- multiple colorscheme in one repository
	--'folke/tokyonight.nvim',
	--'marko-cerovac/material.nvim',
	{ 'rose-pine/neovim',     as = 'rose-pine' },

	{ 'sainnhe/sonokai',
		config = function()
			-- styles: 'default', 'atlantis', 'andromeda', 'shusia', 'maia', 'espresso'
			vim.g.sonokai_style = 'maia'
			-- vim.g.sonokai_style = 'espresso'
			vim.g.sonokai_better_performance = 1
			ColorMyPencils("sonokai")
		end,
	}

}
