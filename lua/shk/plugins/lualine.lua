local function wrap()
	if vim.opt.wrap:get() then
		return ""
	end
	return ""
end

local function spell()
	if vim.opt.spell:get() then
		return "SPELLING"
	end
	return ""
end

local function transparent_lualine()
	local lualine_groups = {
		"lualine_a_normal",
		"lualine_a_insert",
		"lualine_a_visual",
		"lualine_a_command",
		"lualine_a_replace",
		"lualine_a_terminal",
		"lualine_b_normal",
		"lualine_b_insert",
		"lualine_b_visual",
		"lualine_b_command",
		"lualine_b_replace",
		"lualine_b_terminal",
		"lualine_c_normal",
		"lualine_c_insert",
		"lualine_c_visual",
		"lualine_c_command",
		"lualine_c_replace",
		"lualine_c_terminal",
		"lualine_x_normal",
		"lualine_x_insert",
		"lualine_x_visual",
		"lualine_x_command",
		"lualine_x_replace",
		"lualine_x_terminal",
		"lualine_y_normal",
		"lualine_y_insert",
		"lualine_y_visual",
		"lualine_y_command",
		"lualine_y_replace",
		"lualine_y_terminal",
		"lualine_z_normal",
		"lualine_z_insert",
		"lualine_z_visual",
		"lualine_z_command",
		"lualine_z_replace",
		"lualine_z_terminal",
	}

	for _, group in ipairs(lualine_groups) do
		vim.api.nvim_set_hl(0, group, { bg = "none" })
	end

	-- Also clear the base statusline
	vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
	vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
end

return {
	"nvim-lualine/lualine.nvim",
	lazy = false, -- load immediately
	priority = 1000, -- load before other stuff
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				-- section_separators = { left = " ", right = " " },
				-- component_separators = { left = '|', right = '|' },
				-- section_separators = { left = "", right = "" },
				-- section_separators = { left = "", right = "" },
				-- section_separators = { left = "", right = "" },
				-- component_separators = { left = "", right = "" },
				-- section_separators = { left = '', right = '' },
				-- component_separators = { left = '', right = '' },
				-- section_separators = { left = '', right = ''},
				-- component_separators = { left = '', right = '' },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = true,
				-- refresh = {
				-- 	statusline = 200,
				-- 	tabline = 200,
				-- 	winbar = 200,
				-- },
			},

			sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", symbols = { readonly = "", modified = "●" } } },
				lualine_x = {
					"selectioncount",
					"searchcount",
					{ "diagnostics", symbols = { error = "● ", warn = "● ", hint = "● ", info = "● " } },
					spell,
					wrap,
				},
				lualine_y = {
					"progress",
					-- "location",
					"encoding",
					-- "mode",
				},
				lualine_z = { { "branch", icon = "" } },
				-- lualine_b = {'branch', 'diff', 'diagnostics'},
				-- lualine_b = { { "filename", symbols = { readonly = "", modified = "●" } } },
				-- lualine_b = {{'branch', icon = {'', color={fg='lime'}}}, 'diagnostics'},
				-- lualine_c = {},
			},

			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", symbols = { readonly = "", modified = "●" } } },
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},

			winbar = {},
			inactive_winbar = {},
		})
		transparent_lualine()
	end,
}
