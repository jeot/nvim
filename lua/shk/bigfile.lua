local M = {}
local uv = vim.uv or vim.loop

M.max_filesize = 100 * 1024
M.max_filesize_by_extension = {
	csv = 10 * 1024,
}
M.max_filesize_by_filetype = {
	csv = 10 * 1024,
}
M.ignore_extensions = {
	txt = true,
	log = true,
	db = true,
}
M.ignore_filetypes = {
	log = true,
	text = true,
}
M.binary_extensions = {
	["7z"] = true,
	avi = true,
	bin = true,
	bmp = true,
	class = true,
	dll = true,
	dylib = true,
	exe = true,
	gif = true,
	gz = true,
	ico = true,
	jar = true,
	jpeg = true,
	jpg = true,
	lockb = true,
	mkv = true,
	mov = true,
	mp3 = true,
	mp4 = true,
	o = true,
	otf = true,
	pdf = true,
	png = true,
	pyc = true,
	rar = true,
	so = true,
	sqlite = true,
	sqlite3 = true,
	tar = true,
	ttf = true,
	wav = true,
	webm = true,
	woff = true,
	woff2 = true,
	xz = true,
	zip = true,
}

local function get_extension(path)
	if type(path) ~= "string" or path == "" then
		return ""
	end
	return string.lower(vim.fn.fnamemodify(path, ":e"))
end

local function get_buffer_filetype(bufnr)
	local ft = vim.bo[bufnr].filetype or ""
	return string.lower(ft)
end

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

local function is_binary_path(path)
	if type(path) ~= "string" or path == "" then
		return false
	end

	local stat = uv.fs_stat(path)
	if not (stat and stat.type == "file") then
		return false
	end

	local fd = uv.fs_open(path, "r", 438) -- 438 => 0666
	if not fd then
		return false
	end

	local ok, chunk = pcall(uv.fs_read, fd, 1024, 0)
	pcall(uv.fs_close, fd)
	if not ok or type(chunk) ~= "string" or chunk == "" then
		return false
	end

	return chunk:find("\0", 1, true) ~= nil
end

function M.get_max_filesize(path, bufnr)
	bufnr = bufnr or vim.api.nvim_get_current_buf()
	local ext = get_extension(path)
	local ft = get_buffer_filetype(bufnr)

	return M.max_filesize_by_extension[ext] or M.max_filesize_by_filetype[ft] or M.max_filesize
end

local function should_disable_for_path(path, bufnr)
	local ext = get_extension(path)
	if M.ignore_extensions[ext] then
		return true
	end
	if M.binary_extensions[ext] then
		return true
	end

	local ft = get_buffer_filetype(bufnr)
	if M.ignore_filetypes[ft] then
		return true
	end

	return is_binary_path(path)
end

function M.is_path_large(path, max_filesize)
	return get_file_size(path) > (max_filesize or M.get_max_filesize(path))
end

function M.mark_buffer(bufnr, path)
	bufnr = bufnr or vim.api.nvim_get_current_buf()
	path = path or vim.api.nvim_buf_get_name(bufnr)
	local max_filesize = M.get_max_filesize(path, bufnr)
	local always_disable = should_disable_for_path(path, bufnr)
	vim.b[bufnr].large_file = always_disable or M.is_path_large(path, max_filesize)
	vim.b[bufnr].large_file_filetype = get_buffer_filetype(bufnr)
	return vim.b[bufnr].large_file
end

function M.is_large_buffer(bufnr)
	bufnr = bufnr or vim.api.nvim_get_current_buf()
	if vim.b[bufnr].large_file == nil or vim.b[bufnr].large_file_filetype ~= get_buffer_filetype(bufnr) then
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
