local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- create some group
local group = augroup("SmashThatLikeButton", { clear = true })
local yank_group = augroup("HighlightYank", {})
local diagnostic_group = augroup("MyDiagnosticEvents", {})

-- different indentation style for different file types
-- autocmd({ "FileType" }, {
-- 	group = group,
-- 	pattern = { "*.css", "*.html" },
-- 	command = "setlocal ts=2 sw=2 sts=0 noexpandtab",
-- })

-- delete white space at end of lines
autocmd("BufWritePre", {
	group = group,
	pattern = {
		"*.h",
		"*.c",
		"*.cpp",
		"*.lua",
		"*.m",
		"*.md",
		"*.rs",
		"*.js",
		"*.ts",
		"*.jsx",
		"*.tsx",
		"*.css",
		"*.html",
	},
	command = [[%s/\s\+$//e]],
})

-- auto reload file
autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
	group = group,
	pattern = "*",
	command = "if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif ",
})
-- (is this redundant with autoread option in neovim?)
autocmd({ "FileChangedShellPost" }, {
	group = group,
	pattern = "*",
	command = "echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None",
})

-- highlight yank for a short time
autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 50,
		})
	end,
})

-- Zoom / Restore window.
vim.cmd([[
function! s:ZoomToggle() abort
  if exists('t:zoomed') && t:zoomed
    execute t:zoom_winrestcmd
    let t:zoomed = 0
  else
    let t:zoom_winrestcmd = winrestcmd()
    resize
    vertical resize
    let t:zoomed = 1
  endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <leader>we :ZoomToggle<CR>
]])

-- vhdl tree-sitter test:
--local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
--parser_config.vhdl = {
--  install_info = {
--    url = "~/publics/tree-sitter-vhdl", -- local path or git repo
--    files = {"src/parser.c"},
--    -- optional entries:
--    branch = "main", -- default branch in case of git repo if different from master
--    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
--    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
--  },
--  filetype = "vhdl", -- if filetype does not match the parser name
--}

-- toggle listchars and eol
local eol = false
local function toggle_eol()
	if eol then
		eol = false
		vim.opt.listchars:append({ eol = " " })
		print("turn OFF eol char display")
	else
		eol = true
		vim.opt.list = true
		vim.opt.listchars:append({ eol = "󰌑" })
		print("turn ON eol char ﬋ display")
	end
end

local function toggle_listchars()
	if vim.opt.list:get() then
		vim.opt.list = false
		print("listchars OFF")
	else
		vim.opt.list = true
		print("listchars ON")
	end
end
vim.keymap.set("n", "<leader>te", toggle_eol, {})
vim.keymap.set("n", "<leader>tl", toggle_listchars, {})

-- toggle diff mode
local diffmode = false
local function toggle_diffmode()
	if diffmode then
		diffmode = false
		vim.cmd("windo diffthis")
		print("diff mode on")
	else
		diffmode = true
		vim.cmd("windo diffoff")
		print("diff mode off")
	end
end
vim.keymap.set("n", "<leader>td", toggle_diffmode, {})

vim.cmd([[
  :hi link CurSearch IncSearch
]])

autocmd("DiagnosticChanged", {
	group = diagnostic_group,
	callback = function()
		local bufnr = vim.api.nvim_get_current_buf()
		-- Save cursor position
		local cur_pos = vim.api.nvim_win_get_cursor(0)

		-- Check if there are diagnostics in the current buffer
		local diagnostics = vim.diagnostic.get(bufnr)
		if #diagnostics > 0 then
			-- Silently update quickfix list
			vim.diagnostic.setqflist({ open = false })
		else
			-- Clear quickfix list when no diagnostics
			vim.fn.setqflist({}, "r")
		end

		-- Restore cursor position
		vim.api.nvim_win_set_cursor(0, cur_pos)
	end,
})
