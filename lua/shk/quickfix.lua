local function parse_build_log(path)
	if vim.fn.filereadable(path) == 0 then
		vim.notify("build.log not found: " .. path, vim.log.levels.ERROR)
		return
	end

	local lines = vim.fn.readfile(path)
	local qf = {}

	local function strip_ansi(s)
		if not s then
			return s
		end
		return s
			:gsub("\27%[[0-9;]*m", "") -- colors
			:gsub("\27%[[0-9;]*[KJHf]", "")
	end

	for _, raw in ipairs(lines) do
		local l = strip_ansi(raw)

		local file, lnum, col, typ, text

		-- ts style: file(line,col): error TSxxxx: message
		file, lnum, col, typ, text = string.match(l, "^(.-)%((%d+),(%d+)%)%:%s*(%w+)%s+TS%d+%:%s*(.*)$")

		-- ts style without TS code
		if not file then
			file, lnum, col, typ, text = string.match(l, "^(.-)%((%d+),(%d+)%)%:%s*(%w+)%s*:%s*(.*)$")
		end

		-- gcc/clang style: file:line:col: message
		if not file then
			file, lnum, col, text = string.match(l, "^(.-):(%d+):(%d+):%s*(.*)$")
		end

		-- ts style: file(line): message
		if not file then
			file, lnum, text = string.match(l, "^(.-)%((%d+)%)%:%s*(.*)$")
		end

		if file then
			local item = {
				filename = vim.fn.fnamemodify(file, ":p"),
				lnum = tonumber(lnum) or 1,
				col = col and tonumber(col) or 1,
				text = text or "",
				type = (typ and typ:lower():match("warn")) and "W" or "E",
			}
			table.insert(qf, item)
		end
		-- notice: no "else insert raw line"
	end

	if vim.tbl_isempty(qf) then
		vim.notify("No errors parsed from " .. path, vim.log.levels.INFO)
		return
	end

	vim.fn.setqflist({}, "r", { title = path, items = qf })
	vim.cmd("copen")
end

-- Keymaps:
-- <leader>e : load ./build.log from current working directory
vim.keymap.set("n", "<leader>xo", function()
	parse_build_log(vim.fn.getcwd() .. "/build.log")
end, { desc = "Load build.log into quickfix" })

-- <leader>E : prompt for a file path (handy if your log is elsewhere)
vim.keymap.set("n", "<leader>xi", function()
	local f = vim.fn.input("Log file: ", vim.fn.getcwd() .. "/build.log", "file")
	parse_build_log(f)
end, { desc = "Prompt for log file and load into quickfix" })
