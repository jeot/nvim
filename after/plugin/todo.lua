local todo = require("todo-comments")

todo.setup({
	keywords = {
		FIX = {
			icon = " ",
			color = "error",
			alt = { "fix", "FIXME", "BUG", "FIXIT", "ISSUE" },
			-- signs = false, -- configure signs for some keywords individually
		},
		TODO = { icon = " ", color = "info", alt = {"todo","Todo"} },
		HACK = { icon = " ", color = "warning", alt = {"Hack"} },
		WARN = { icon = " ", color = "warning", alt = {"WARNING","XXX","warn","Warn"} },
		PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE", "optimize", "Optimize", "perf","Perf" } },
		NOTE = { icon = " ", color = "hint", alt = { "INFO","Info","info","Note","note" } },
		TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED","Test","test" } },
	},
	highlight = {
		multiline = false,             -- enable multine todo comments
		multiline_pattern = "^.",     -- lua pattern to match the next multiline from the start of the matched keyword
		multiline_context = 10,       -- extra lines that will be re-evaluated when changing a line
		before = "",                  -- "fg" or "bg" or empty
		keyword = "bg",             -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
		after = "",                 -- "fg" or "bg" or empty
		pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
		comments_only = true,         -- uses treesitter to match keywords in comments only
		max_line_len = 400,           -- ignore lines longer than this
		exclude = {},                 -- list of file types to exclude highlighting
	},
	search = {
		command = "rg",
		args = {
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
		},
		-- regex that will be used to match keywords.
		-- don't replace the (KEYWORDS) placeholder
		pattern = [[\b(KEYWORDS):]], -- ripgrep regex
		-- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
	},
})

vim.keymap.set("n", "<leader>tt", "<cmd>TodoTelescope<cr>", { desc = "Next todo comment" })

vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
	vim.cmd("normal zvzz")
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
	vim.cmd("normal zvzz")
end, { desc = "Previous todo comment" })
