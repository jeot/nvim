local function ColorMyPencils(color)
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "Normal", { bg = "#3B4252" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#3B4252" })

	require('rose-pine').setup({variant = 'moon'})
	require('rose-pine').setup({variant = 'main'})
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	-- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#3B4252", fg = "#5E81AC" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#3B4252" })
	-- vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#3B4252" })
	-- vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "#3B4252" })
end

ColorMyPencils()
-- ColorMyPencils("gruvbox")
-- ColorMyPencils("Iceberg")
-- ColorMyPencils("github") -- light
