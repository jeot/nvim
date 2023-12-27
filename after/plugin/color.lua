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

-- ColorMyPencils()
-- ColorMyPencils("Iceberg")
-- ColorMyPencils("github") -- light

-- ColorMyPencils("gruvbox")
-- vim.g.gruvbox_invert_selection = 0
-- vim.g.gruvbox_contrast_dark = 'soft'

-- styles: 'default', 'atlantis', 'andromeda', 'shusia', 'maia', 'espresso'
vim.g.sonokai_style = 'default'
vim.g.sonokai_better_performance = 1
ColorMyPencils("sonokai")
