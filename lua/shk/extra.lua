local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- create some group
local group = augroup("SmashThatLikeButton", { clear = true })
local yank_group = augroup("HighlightYank", {})

-- different indentation style for different file types
autocmd({ "FileType" }, {
	group = group,
	pattern = { "*.lua", "*.css", "*.html" },
	command = "setlocal ts=2 sw=2 sts=0 noexpandtab",
})

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
-- (is this redundant with autoread option in neovim?)
autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
	group = group,
	pattern = "*",
	command = "if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif ",
})
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
			timeout = 40,
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

if vim.g.neovide then
	-- vim.g.neovide_transparency = 1
	-- vim.g.neovide_floating_blur_amount_x = 20.0
	-- vim.g.neovide_floating_blur_amount_y = 20.0
	-- vim.g.neovide_fullscreen = false
	vim.opt.linespace = 5
	vim.g.neovide_maximized = true
	vim.g.neovide_scale_factor = 1
	vim.g.neovide_hide_mouse_when_typing = false
	vim.g.neovide_remember_window_size = true
end

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
		vim.opt.listchars:append({ eol = "﬋" })
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

--[[ -- starting directory
autocmd("VimEnter", {
  group = group,
  pattern = '*',
  callback = function()
    vim.api.nvim_set_current_dir(vim.fn.expand("%:p:h"))
  end,
}) ]]

-- -- don't fold in .h files
-- autocmd(
--   {"BufEnter", "BufWinEnter"}, { group = group, pattern = {"*.h"}, command = "set fdl=99"}
-- )

-- disable diagnostics by default
-- vim.diagnostic.disable()
--

vim.cmd([[
  :hi link CurSearch IncSearch
]])
