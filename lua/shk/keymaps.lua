-- set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local open_cmd

if vim.fn.has("mac") == 1 then
	open_cmd = "open"
elseif vim.fn.has("unix") == 1 then
	open_cmd = "xdg-open"
elseif vim.fn.has("win32") == 1 then
	open_cmd = "start"
end

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local function allkeymap(key, map, desc) -- All
	opts["desc"] = desc
	keymap("", key, map, opts)
end
local function nkeymap(key, map, desc) -- Normal
	opts["desc"] = desc
	keymap("n", key, map, opts)
end
local function ikeymap(key, map, desc) -- Insert
	opts["desc"] = desc
	keymap("i", key, map, opts)
end
local function vkeymap(key, map, desc) -- Visual
	opts["desc"] = desc
	keymap("v", key, map, opts)
end
local function xkeymap(key, map, desc) -- Visual Block
	opts["desc"] = desc
	keymap("x", key, map, opts)
end
local function tkeymap(key, map, desc) -- Terminal?
	opts["desc"] = desc
	keymap("t", key, map, opts)
end
local function ckeymap(key, map, desc) -- Command?
	opts["desc"] = desc
	keymap("c", key, map, opts)
end

-- the ugly things!
allkeymap("<C-z>", "<nop>")
xkeymap("<C-;>", "<Esc>")
vkeymap("<C-;>", "<Esc>")
ckeymap("<C-;>", "<Esc>")
ikeymap("<C-;>", "<Esc>")
xkeymap("<C-;>", "<Esc>")
-- nkeymap("<C-;>", "<Esc>")
-- nkeymap("J", "<nop>")
-- nkeymap("K", "<nop>")
nkeymap("<space><space>", "<nop>")
tkeymap("<C-;>", "<Esc><C-\\><C-n>")
tkeymap("<Esc>", "<C-\\><C-n>")

-- the most I use
nkeymap("<C-;>", "<Esc><cmd>nohlsearch<CR>")
nkeymap("<Esc>", "<cmd>nohlsearch<CR>")
nkeymap("<leader>v", ":vs<cr><c-w>l")
nkeymap("<C-o>", "<C-o>zz")
nkeymap("<C-i>", "<C-i>zz")
nkeymap("#", "^")
nkeymap("<c-m>", "%") -- find the matching pair
vkeymap("<c-m>", "%") -- find the matching pair
nkeymap("U", "<c-r>") -- redo
nkeymap("*", "*N:silent set hls<CR>") -- don't jump with * search
-- vkeymap('*', '*N') -- don't jump with * search
nkeymap("<leader>;", "q:k") -- show command history
nkeymap("<leader>/", "q/k") -- show search history
nkeymap("<leader>j", "mz:join<cr>`z") -- join the lines, hold the cursor
vkeymap("<leader>j", "mz:join<cr>`z")
nkeymap("<leader>k", "kmz:join<cr>`z")
vkeymap("<leader>k", "kmz:join<cr>`z")
nkeymap("<leader>th", "<cmd>silent set hlsearch! hlsearch?<CR>") -- toggle highlight
nkeymap("<leader>ts", ":silent set spell! spell?<CR>") -- toggle spell
nkeymap("<leader>z", "zAzz") -- toggle folding
nkeymap('<leader>s"', '/".\\{-}"<cr>') -- search "" strings
nkeymap("<leader>s'", "/'.\\{-}'<cr>") -- search '' strings
nkeymap("<leader>cd", "<cmd>cd %:h<cr>") -- change global directory to current buffer
nkeymap("n", "nzvzz") -- center find
nkeymap("N", "Nzvzz")
nkeymap("<leader>=", "=i{") -- auto indent inside {} block
nkeymap("vaa", "ggVG") -- select all file
nkeymap("vv", "V") -- select line
nkeymap("<leader>tt", "mmI{/* <Esc>A */}<Esc>`m") -- comment html tag
-- ikeymap("kj", "<Esc>")
-- ikeymap("jk", "<Esc>")

-- record/repeat macro
vkeymap("Q", ":norm @q<CR>")
vkeymap(".", ":norm .<CR>")

vkeymap("<", "<gv") -- stay in indent mode (while in visual mode)
vkeymap(">", ">gv") -- stay in indent mode (while in  mode)

-- moveing lines.  hahaha
-- nkeymap('<c-Down>', ':m .+1<CR>')
-- nkeymap('<c-Up>', ':m .-2<CR>')
-- vkeymap('<c-Down>', ":m '>+1<CR>gv")
-- vkeymap('<c-Up>', ":m '<-2<CR>gv")

-- copy/paste/replace/substitute
vkeymap("p", "P") -- while pasting on top of selection, hold the yanked register
-- nkeymap("D", '"dD') -- also will put in unnamed register
-- vkeymap("D", '"dD') -- also will put in unnamed register
-- nkeymap("d", '"dd') -- also will put in unnamed register
-- vkeymap("d", '"dd') -- also will put in unnamed register
nkeymap("C", '"cC') -- also will put in unnamed register
vkeymap("C", '"cC') -- also will put in unnamed register
nkeymap("c", '"cc') -- also will hahaha
vkeymap("c", '"cc') -- hhh
nkeymap("<leader>pd", '"-p') -- paste last small deleted (less than a line)
nkeymap("<leader>py", '"0p') -- paste what was last yanked
nkeymap("<leader>pc", '"cp') -- paste what was last changed (replaced)
nkeymap("<leader>pi", '".p') -- paste what was last inserted
nkeymap("yaa", ":%yank<cr>") -- yank all file
-- nkeymap("daa", ":%d<cr>") -- delete all file
ikeymap("<c-p>", "<c-r>+") -- paste what was yanked/deleted inside vim
nkeymap("<c-v>", '"*p') -- the last thing that was copied outside of the vim
vkeymap("<c-v>", '"*P') -- the last thing that was copied outside of the vim
ikeymap("<c-v>", "<c-r>*") -- the last thing that was copied outside of the vim
nkeymap("<leader>y*", 'mm*:let @y=""<cr>:%g//yank Y<cr>:let @+=@y<cr>`m') -- multi line yank searched word
nkeymap("<leader>yc", ":let @y=''<cr>") -- clear multi line yank register (y)
nkeymap("<leader>yy", ":yank Y<cr>:let @+=@y<cr>") -- add line to multi line yank register (y)
nkeymap("<leader>ro", 'viw"0P') -- replace only current word with yanked
nkeymap("<leader>rl", 'mm"hyiw:s/<c-r>h/<c-r>0/g<cr>`m') -- replace current word with yanked, in line
nkeymap("<leader>co", 'mm"hyy"hp`mjviw"0P') -- duplicate line, replace word under cursor with yanked register
nkeymap("<leader>cl", 'mm"hyy"hp`mj*N:s//<c-r>0/g<cr>`mj*N:silent set hls<cr>') -- duplicate line, replace word under cursor with yanked register in full line. search word under cursor
vkeymap("<c-c>", '"+y')
nkeymap("<c-c>", '"+y')
nkeymap("<c-c><c-c>", '"+yy')
-- nkeymap("<c-c>aa", ":%y+<cr>") -- yank all file
-- nkeymap("<leader>ra", '"hyiw:%s/<c-r>h/<c-r>y/gI<cr>') -- replace current word with yanked, in file
-- nkeymap("<leader>rr", 'ddO<Esc>"yP') -- replace line with yanked line
-- nkeymap('<leader>r"', 'vi""yP') -- replace inside ""
-- nkeymap("<leader>r'", "vi'\"yP") -- replace inside ''
-- nkeymap("<leader>r(", 'f)F(vi("yP') -- replace inside ()
-- nkeymap("<leader>r)", 'f)F(vi("yP') -- replace inside ()
nkeymap("<leader><c-n>", ":%s/\\<<c-r><c-w>\\>//gIn<cr>") -- count keyword
vkeymap("<leader><c-n>", ":s/\\<<c-r><c-w>\\>//gIn<cr>") -- count keyword (in the selection)
-- nkeymap("<leader>R", '"hyiw:.,$s/\\<<C-r>h\\>/<c-r>0/gc<cr>') -- interactive replace the word under cursor
-- nkeymap('<leader>R', ':%s/\\<<c-r><c-w>\\>/<c-r><c-w>/gI<left><left><left>') -- replace
-- vkeymap('<leader>R', ':s/\\<<c-r><c-w>\\>/<c-r><c-w>/gI<left><left><left>') -- replace

-- open some urls/files
-- test: https://google.com https://thisweek.me/app
-- nkeymap("<leader>ou", '"uyiW:!' .. open_cmd .. " chrome '<c-r>u'<cr>") -- open url
nkeymap("<leader>ou", '"uyiW:!' .. open_cmd .. " <c-r>u<cr>") -- open url
vkeymap("<leader>ou", '"uy:!' .. open_cmd .. " <c-r>u<cr>") -- open visually selected url
nkeymap("<leader>oy", ":!" .. open_cmd .. ' <c-r>"<cr>') -- open url from yanked
nkeymap("<leader>os", '"uyiw:!' .. open_cmd .. ' https://www.google.com/search?q="<c-r>u"<cr><cr>') -- search under cursor
vkeymap("<leader>os", '"uy:!' .. open_cmd .. ' https://www.google.com/search?q="<c-r>u"<cr><cr>') -- search visually selected text

-- file/buffer
nkeymap("<leader>sf", "<cmd>w<cr>") -- save buffer
vkeymap("<leader>sf", "<Esc><cmd>w<cr>") -- save buffer
nkeymap("<leader>sa", "<cmd>wa<CR>") -- save all files
vkeymap("<leader>sa", "<Esc><cmd>wa<CR>") -- save all files
nkeymap("<leader>so", "<cmd>w <bar> source %<cr>") -- save & source file
nkeymap("<leader>fp", "1<c-g>", "Display absolute file path") -- print filepath
-- nkeymap("q<CR>", "<cmd>qall<CR>") -- close all
nkeymap("<leader>Q", "<cmd>qall<CR>") -- close all
nkeymap("<leader>FQ", "<cmd>qall!<CR>") -- force close all
nkeymap("<leader>q", "<cmd>Bdelete<CR>") -- delete buffer, but don't close window (using vim-bbye plugin)
nkeymap("<leader>fq", "<cmd>Bdelete!<CR>") -- force delete buffer
nkeymap("ZQ", "<cmd>Bdelete!<CR>") -- close buffer without saving, don't close window
nkeymap("ZZ", "<cmd>w <bar> Bdelete<CR>") -- save buffer and close, don't close window
nkeymap("<leader>oi", "<CMD>Oil --float<CR>", "Open parent directory")
nkeymap("-", "<CMD>Oil --float<CR>", "Open parent directory")
-- nkeymap('<leader>ss', ':exe "mksession! " . v:this_session<CR>') -- save session

-- tabs/windows/splits
nkeymap("s", "<nop>")
nkeymap("sp", ":split<cr>")
nkeymap("sv", ":vsplit<cr>")
nkeymap("sc", "<c-w>c")
nkeymap("so", "<c-w>o")
nkeymap("sh", "<c-w>h")
nkeymap("sj", "<c-w>j")
nkeymap("sk", "<c-w>k")
nkeymap("sl", "<c-w>l")
nkeymap("W", "<c-w><c-w>") -- next window
nkeymap("T", "gt") -- switch to next tab
-- nkeymap('<c-h>', '<c-w>h')
-- nkeymap('<c-j>', '<c-w>j')
-- nkeymap('<c-k>', '<c-w>k')
-- nkeymap('<c-l>', '<c-w>l')
-- tkeymap('<c-h>', '<c-\\><c-n><c-w>h')
-- tkeymap('<c-j>', '<c-\\><c-n><c-w>j')
-- tkeymap('<c-k>', '<c-\\><c-n><c-w>k')
-- tkeymap('<c-l>', '<c-\\><c-n><c-w>l')
-- tkeymap('<leader>w', '<c-\\><c-n><c-w>')
-- nkeymap("<leader>wq", "<c-w>c") -- close window/split (safe)
-- nkeymap("<leader>wn", "<c-w><c-w>") -- next window
-- nkeymap("<leader>w", "<c-w>") -- all windows operations
-- nkeymap('<leader>sp', "<C-w>v") -- split window vertically
-- nkeymap('<leader>sh', "<C-w>s") -- split window horizontally

-- resize windows with arrows
nkeymap("<C-Down>", ":resize +1<CR>")
nkeymap("<C-Up>", ":resize -1<CR>")
nkeymap("<C-Right>", ":vertical resize -1<CR>")
nkeymap("<C-Left>", ":vertical resize +1<CR>")

-- quick open file
local nvim_config = vim.fn.stdpath("config")
nkeymap("<leader>oa", ":e ~/.aliases<cr>")
-- nkeymap("<leader>obc", ":e ~/.config/waybar/config.jsonc<cr>")
-- nkeymap("<leader>obs", ":e ~/.config/waybar/style.css<cr>")
nkeymap("<leader>oh", ":e ~/.config/hypr/hyprland.conf<cr>")
nkeymap("<leader>ok", ":e " .. nvim_config .. "/lua/shk/keymaps.lua<cr>")
nkeymap("<leader>ot", ":e ~/.config/tmux/tmux.conf<cr>")
-- nkeymap("<leader>op", ":e ~/OneDrive/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1<cr>")
-- nkeymap("<leader>oh", ":e C:/Users/shk/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup/myScript.ahk<cr>")
-- nkeymap("<leader>oh", ":e C:/Users/shk/OneDrive/Documents/AutoHotkey/Test1.ahk<cr>")

-- navigation
-- nkeymap('J', '}')
-- nkeymap('K', '{')
-- nkeymap('J', '<cmd>execute "keepjumps norm! " . v:count1 . "}zz"<CR>')
-- nkeymap('K', '<cmd>execute "keepjumps norm! " . v:count1 . "{zz"<CR>')
-- vkeymap('J', '<cmd>execute "keepjumps norm! " . v:count1 . "}zz"<CR>')
-- vkeymap('K', '<cmd>execute "keepjumps norm! " . v:count1 . "{zz"<CR>')
-- nkeymap('<c-n>', '<cmd>bnext<CR>') -- previously L
-- nkeymap('<c-p>', '<cmd>bprevious<CR>') -- previously H
nkeymap("<c-u>", "9kzz")
nkeymap("<c-d>", "9jzz")
vkeymap("<c-u>", "9k")
vkeymap("<c-d>", "9j")
nkeymap("gl", "$")
nkeymap("gh", "^")
vkeymap("gl", "$")
vkeymap("gh", "^")
nkeymap("ge", "G")
vkeymap("ge", "G")
nkeymap("L", "<cmd>lnext<CR>", "Next item in location list")
nkeymap("H", "<cmd>lprev<CR>", "Previous item in location list")
nkeymap(")", "<cmd>lnext<CR>", "Next item in location list")
nkeymap("(", "<cmd>lprev<CR>", "Previous item in location list")
-- nkeymap("<c-0>", "<cmd>lnext<CR>", "Next item in location list")
-- nkeymap("<c-9>", "<cmd>lprev<CR>", "Previous item in location list")
-- nkeymap('<c-u>', '<c-u>zz')
-- nkeymap('<c-d>', '<c-d>zz')
-- nkeymap('{', '?^\\s*{<CR>:nohl<CR>')
-- nkeymap('}', '/^\\s*}<CR>:nohl<CR>')

------ Diagnostic keymaps ------

-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
-- vim.keymap.set("n", "<leader>dh", vim.diagnostic.hide, { desc = "Hide Diagnostic message" })
-- vim.keymap.set("n", "<leader>ds", vim.diagnostic.show, { desc = "Show Diagnostic message" })
vim.keymap.set("n", "<c-p>", vim.diagnostic.goto_prev, { desc = "Go to previous Diagnostic message" })
vim.keymap.set("n", "<c-n>", vim.diagnostic.goto_next, { desc = "Go to next Diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic Error messages" })
vim.keymap.set("n", "<leader>td", function()
	local enabled = true
	local ok_is_enabled, state = pcall(vim.diagnostic.is_enabled)
	if ok_is_enabled and type(state) == "boolean" then
		enabled = state
	elseif vim.g.shk_diagnostics_enabled ~= nil then
		enabled = vim.g.shk_diagnostics_enabled
	end

	local next_state = not enabled

	-- Newer Neovim accepts boolean; fallback keeps compatibility with older versions.
	local ok_toggle = pcall(vim.diagnostic.enable, next_state)
	if not ok_toggle then
		if next_state then
			pcall(vim.diagnostic.enable)
		else
			pcall(vim.diagnostic.disable)
		end
	end

	vim.g.shk_diagnostics_enabled = next_state
	vim.notify(("Diagnostics %s"):format(next_state and "enabled" or "disabled"), vim.log.levels.INFO)
end, { desc = "Toggle diagnostics globally" })
