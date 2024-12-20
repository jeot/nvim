-- set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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
nkeymap("J", "<nop>")
nkeymap("K", "<nop>")
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
nkeymap("s", "%") -- find the matching pair
vkeymap("s", "%") -- find the matching pair
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
nkeymap("<leader>tw", ":silent set wrap! wrap?<CR>") -- toggle wrap
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
ikeymap("kj", "<Esc>")
ikeymap("jk", "<Esc>")

-- record/repeat macro
vkeymap("Q", ":norm @q<CR>")
vkeymap(".", ":norm .<CR>")

vkeymap("<", "<gv") -- stay in indent mode (while in visual mode)
vkeymap(">", ">gv") -- stay in indent mode (while in visual mode)

-- moveing lines. surprisingly Alt works in nvim!
-- nkeymap('<c-Down>', ':m .+1<CR>')
-- nkeymap('<c-Up>', ':m .-2<CR>')
-- vkeymap('<c-Down>', ":m '>+1<CR>gv")
-- vkeymap('<c-Up>', ":m '<-2<CR>gv")

-- copy/paste/replace/substitute
nkeymap("Y", '"yy$') -- yank to end if line
vkeymap("p", "P") -- while pasting on top of visual selection, hold the yanked register
nkeymap("y", '"yy') -- also will put in unnamed register
vkeymap("y", '"yy') -- also will put in unnamed register
nkeymap("d", '"dd') -- also will put in unnamed register
vkeymap("d", '"dd') -- also will put in unnamed register
nkeymap("yaa", ":%y<cr>:%yank +<cr>") -- yank all file, also into clipboard
nkeymap("yal", ":%y<cr>:%yank +<cr>") -- yank all file, also into clipboard
nkeymap("daa", ":%d<cr>") -- delete all file
nkeymap("dal", ":%d<cr>") -- delete all file
ikeymap("<c-p>", "<c-r>y") -- paste what was yanked when writing
nkeymap("<c-v>", '"+p')
vkeymap("<c-v>", '"+P')
ikeymap("<c-v>", "<c-r>+") -- for windows clipboard
-- ckeymap('<c-v>', '<c-r>+')
vkeymap("<c-c>", '"+y')
nkeymap("<c-c>", '"+y')
nkeymap("<c-c><c-c>", '"+yy')
nkeymap("<c-c>aa", ":%y+<cr>") -- yank all file
-- ckeymap('<c-p>', '<c-r>0')
-- nkeymap('<c-p>', '"+p')
-- vkeymap('<c-y>', '"+y')
-- nkeymap('<c-y>', '"+y')
nkeymap("<leader>p", '"yp') -- from yanked register
vkeymap("<leader>p", '"yp')
nkeymap("<leader>rw", 'viw"yP') -- replace current word with yanked
nkeymap("<leader>rl", '"hyiw:s/<c-r>h/<c-r>0/gI<cr>') -- replace current word with yanked, in current line
nkeymap("<leader>ra", '"hyiw:%s/<c-r>h/<c-r>0/gI<cr>') -- replace current word with yanked, in file
nkeymap("<leader>rr", 'dd"0P')
-- nkeymap("<leader>YY", '"xyy') -- multi line yank by user
-- nkeymap("<leader>yy", '"Xyy') -- multi line yank by user
-- vkeymap("<leader>Y", '"xy')
-- nkeymap("<leader>Y", '"xy')
-- nkeymap("<leader>YY", '"xyy')
-- nkeymap("<leader>X", '"xp') -- paste multi
-- nkeymap("<leader>DD", '"xdd') -- multi line cut
-- nkeymap("<leader>dd", '"Xdd')
-- vkeymap("<leader>D", '"xd')
nkeymap("<leader>d", '"Dd')
vkeymap("<leader>d", '"Dd')
vkeymap("<leader>y", '"Yy')
nkeymap("<leader>y", '"Yy')
nkeymap("<leader>ys", 'mm:let @y=""<cr>:%g//yank Y<cr>:let @"=@y<cr>`m') -- multi line yank searched word
nkeymap("<leader>cc", 'mm"hyyp`mjviw"yP') -- duplicate line, replace word under cursor with yanked register
nkeymap("<leader>cc", 'mm"hyyp`mj*N:s//<C-R>y/g<CR>') -- duplicate line, replace word under cursor with yanked register in full line
-- nkeymap('<leader>R', ':%s/\\<<c-r><c-w>\\>/<c-r><c-w>/gI<left><left><left>') -- replace
-- vkeymap('<leader>R', ':s/\\<<c-r><c-w>\\>/<c-r><c-w>/gI<left><left><left>') -- replace
nkeymap("<leader><c-n>", ":%s/\\<<c-r><c-w>\\>//gIn<cr>") -- count keyword
vkeymap("<leader><c-n>", ":s/\\<<c-r><c-w>\\>//gIn<cr>") -- count keyword
nkeymap("<leader>R", '"hyiw:.,$s/\\<<C-r>h\\>/<c-r>0/gc<cr>') -- interactive replace the word under cursor

-- open some urls/files
nkeymap("<leader>oy", ':!start chrome "<c-r>""<cr>') -- open url from yanked
nkeymap("<leader>ou", "\"uyiW:!start chrome '<c-r>u'<cr>") -- open url
vkeymap("<leader>ou", '"uy:!start chrome "<c-r>u"<cr>') -- open visually selected url
nkeymap("<leader>os", '"uyiw:!start www.google.com/search?q="<c-r>u"<cr><cr>') -- search under cursor
vkeymap("<leader>os", '"uy:!start www.google.com/search?q="<c-r>u"<cr><cr>') -- search visually selected text

-- file/buffer
nkeymap("<leader>fe", vim.cmd.Ex) -- file explorer
nkeymap("<leader>sf", ":w<cr>") -- save buffer
nkeymap("<leader>sa", ":wall<CR>") -- save all files
nkeymap("<leader>so", ":w <bar> source %<cr>") -- save & source file
nkeymap("<leader>fp", "1<c-g>", "Display absolute file path") -- print filepath
nkeymap("<leader>Q", ":qall<CR>") -- close all
nkeymap("<leader>fQ", ":qall!<CR>") -- force close all
nkeymap("<leader>q", ":Bdelete<CR>") -- delete buffer, but don't close window (using vim-bbye plugin)
nkeymap("<leader>fq", ":Bdelete!<CR>") -- force delete buffer
nkeymap("<leader>cl", ":Bdelete<CR>") -- delete buffer, but don't close window (using vim-bbye plugin)
nkeymap("ZQ", ":Bdelete!<CR>") -- close buffer without saving, don't close window
nkeymap("ZZ", ":w <bar> Bdelete<CR>") -- save buffer and close, don't close window
-- nkeymap('<leader>ss', ':exe "mksession! " . v:this_session<CR>') -- save session

-- windows/splits
-- nkeymap('<c-h>', '<c-w>h')
-- nkeymap('<c-j>', '<c-w>j')
-- nkeymap('<c-k>', '<c-w>k')
-- nkeymap('<c-l>', '<c-w>l')
-- tkeymap('<c-h>', '<c-\\><c-n><c-w>h')
-- tkeymap('<c-j>', '<c-\\><c-n><c-w>j')
-- tkeymap('<c-k>', '<c-\\><c-n><c-w>k')
-- tkeymap('<c-l>', '<c-\\><c-n><c-w>l')
-- tkeymap('<leader>w', '<c-\\><c-n><c-w>')
nkeymap("<leader>wq", "<c-w>c") -- close window/split (safe)
nkeymap("<leader>wn", "<c-w><c-w>") -- next window
nkeymap("W", "<c-w><c-w>") -- next window
nkeymap("<leader>w", "<c-w>") -- all windows operations
-- nkeymap('<leader>sp', "<C-w>v") -- split window vertically
-- nkeymap('<leader>sh', "<C-w>s") -- split window horizontally

-- resize windows with arrows
nkeymap("<C-Up>", ":resize +2<CR>")
nkeymap("<C-Down>", ":resize -2<CR>")
nkeymap("<C-Left>", ":vertical resize -2<CR>")
nkeymap("<C-Right>", ":vertical resize +2<CR>")

-- quick file access
local nvim_config = vim.fn.stdpath("config")
nkeymap("<leader>ok", ":e " .. nvim_config .. "/lua/shk/keymap.lua<cr>")
nkeymap("<leader>oa", ":e ~/.config/alacritty/alacritty.toml<cr>")
nkeymap("<leader>oba", ":e ~/.bash_aliases<cr>")
nkeymap("<leader>op", ":e ~/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1<CR>")
nkeymap(
	"<leader>ot",
	":e ~/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json<CR>"
)
nkeymap("<leader>oh", ":e C:/Users/shk/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup/myScript.ahk<cr>")

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
-- nkeymap('<c-u>', '<c-u>zz')
-- nkeymap('<c-d>', '<c-d>zz')
-- nkeymap('{', '?^\\s*{<CR>:nohl<CR>')
-- nkeymap('}', '/^\\s*}<CR>:nohl<CR>')

-- execute command line under cursor
-- nkeymap('<leader>ee', ':silent exe "!" . getline(".")<CR>')
-- nkeymap('<leader>ex', ':exe getline(".")<CR>')
--nkeymap('<leader>et', ':exe "!tmux send -t .+ \'echo " . vim.fn.getline(".") . "\' Enter"<CR>')
--nkeymap('<leader>E', ':exe "!tmux send -t .+ \'" . vim.fn.getline(".") . "\' Enter"<CR>')

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic Error messages" })
-- vim.keymap.set("n", "<leader>x", vim.diagnostic.setloclist, { desc = "Open diagnostic Quickfix list" })
vim.keymap.set("n", "<leader>x", function()
	vim.cmd("norm gg0")
	vim.diagnostic.setloclist({ open = false })
end, { desc = "Populate diagnostic Quickfix list" })
vim.keymap.set("n", "<c-n>", "<cmd>lnext<CR>", { desc = "Next local fixlist" })
vim.keymap.set("n", "<c-p>", "<cmd>lprev<CR>", { desc = "Previous local fixlist" })
