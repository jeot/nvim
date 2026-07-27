local M = {}
local uv = vim.uv or vim.loop

M.max_filesize = 100 * 1024

local function get_file_size(path)
	if type(path) ~= "string" or path == "" then
		return 0
	end

	local stat = uv.fs_stat(path)
	if stat and stat.type == "file" then
		return stat.size or 0
	end

	local size = vim.fn.getfsize(path)
	if size < 0 then
		return 0
	end

	return size
end

function M.is_path_large(path, max_filesize)
	return get_file_size(path) > (max_filesize or M.max_filesize)
end

function M.mark_buffer(bufnr, path)
	bufnr = bufnr or vim.api.nvim_get_current_buf()
	path = path or vim.api.nvim_buf_get_name(bufnr)
	vim.b[bufnr].large_file = M.is_path_large(path)
	return vim.b[bufnr].large_file
end

function M.is_large_buffer(bufnr)
	bufnr = bufnr or vim.api.nvim_get_current_buf()
	if vim.b[bufnr].large_file == nil then
		return M.mark_buffer(bufnr)
	end
	return vim.b[bufnr].large_file
end

function M.apply_buffer_settings(bufnr)
	bufnr = bufnr or vim.api.nvim_get_current_buf()
	if not M.is_large_buffer(bufnr) then
		return false
	end

	vim.bo[bufnr].swapfile = false
	vim.bo[bufnr].undofile = false
	vim.bo[bufnr].syntax = "OFF"

	pcall(vim.treesitter.stop, bufnr)

	local detach = vim.lsp.buf_detach_client or vim.lsp.buf_detach
	for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
		pcall(detach, bufnr, client.id)
	end

	return true
end

function M.apply_window_settings(winid, bufnr)
	bufnr = bufnr or vim.api.nvim_win_get_buf(winid)
	if not M.is_large_buffer(bufnr) then
		return false
	end

	vim.wo[winid].foldmethod = "manual"
	vim.wo[winid].foldexpr = "0"
	return true
end

return M
