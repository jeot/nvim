local status, lualine = pcall(require, "lualine")
if not status then
	return
end

--- @param trunc_width number trunctates component when screen width is less then trunc_width
--- @param trunc_len number truncates component to trunc_len number of chars
--- @param hide_width number hides component when window width is smaller then hide_width
--- @param no_ellipsis boolean whether to disable adding '...' at end after truncation
--- return function that can format the component accordingly
local function trunc(trunc_width, trunc_len, hide_width, no_ellipsis)
	return function(str)
		local win_width = vim.fn.winwidth(0)
		if hide_width and win_width < hide_width then
			return ''
		elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
			return str:sub(1, trunc_len) .. (no_ellipsis and '' or '...')
		end
		return str
	end
end

local function wrap()
	if (vim.opt.wrap:get()) then return "" end
	return ""
end

lualine.setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		section_separators = { left = ' ', right = ' ' },
		-- component_separators = { left = '|', right = '|' },
		-- section_separators = { left = '', right = '' },
		-- component_separators = { left = '', right = '' },
		component_separators = { left = '', right = '' },
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
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},

	sections = {
		lualine_a = { 'mode' },
		-- lualine_b = {'branch', 'diff', 'diagnostics'},
		lualine_b = { { 'filename', symbols = { readonly = '', modified = '●' } } },
		-- lualine_b = {{'branch', icon = {'', color={fg='lime'}}}, 'diagnostics'},
		lualine_c = {},
		lualine_x = { 'selectioncount', 'searchcount',
			{ 'diagnostics', symbols = { error = '•', warn = '•', hint = '•', info = '•' } }, wrap},
		-- { 'branch', icon = { '', color = { fg = 'lime' } } } },
		lualine_y = { 'progress', 'location', 'encoding' },
		-- lualine_y = { 'encoding', 'fileformat',
		-- 	{ 'filetype', colored = true, icon_only = false, icon = { align = 'right' } } },
		lualine_z = {{'branch', icon = ''}}
	},

	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { { 'filename', symbols = { readonly = '' } } },
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},

	-- tabline = {
	-- 	-- lualine_a = { { 'buffers',
	-- 	-- 	max_length = vim.o.columns * 9 / 10,
	-- 	-- 	symbols = {
	-- 	-- 		-- modified = ' +',     -- Text to show when the buffer is modified
	-- 	-- 		modified = ' ●', -- Text to show when the buffer is modified
	-- 	-- 		alternate_file = '', -- Text to show to identify the alternate file
	-- 	-- 		directory = '', -- Text to show when the buffer is a directory
	-- 	-- 	},
	-- 	-- } },
	-- 	lualine_a = {},
	-- 	lualine_b = {},
	-- 	lualine_c = {},
	-- 	lualine_x = {},
	-- 	lualine_y = {},
	-- 	lualine_z = {},
	-- 	-- lualine_z = { { 'tabs', max_length = vim.o.columns / 10 } }
	-- },

	winbar = {},
	inactive_winbar = {},
	extensions = { 'nvim-tree' }
}
