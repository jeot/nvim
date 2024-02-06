-- set leader key
vim.g.mapleader = ' '

local keymap = vim.keymap.set
local opts = { noremap=true, silent=true }
local function allkeymap(key, map) -- All
	keymap('', key, map, opts)
end
local function nkeymap(key, map) -- Normal
	keymap('n', key, map, opts)
end
local function ikeymap(key, map) -- Insert
	keymap('i', key, map, opts)
end
local function vkeymap(key, map) -- Visual
	keymap('v', key, map, opts)
end
local function xkeymap(key, map) -- Visual Block
	keymap('x', key, map, opts)
end
local function tkeymap(key, map) -- Terminal?
	keymap('t', key, map, opts)
end
local function ckeymap(key, map) -- Command?
	keymap('c', key, map, opts)
end

allkeymap('<C-z>', '<nop>')
nkeymap('J', '<nop>')
nkeymap('K', '<nop>')
nkeymap('<space><space>', '<nop>')

-- the most I use
nkeymap('<leader>v', ':vs<cr><c-w>l')
nkeymap('<C-o>', '<C-o>zz')
nkeymap('<C-i>', '<C-i>zz')
nkeymap('#', '^')
nkeymap('s', '%') -- find the matching pair
vkeymap('s', '%') -- find the matching pair
nkeymap('U', '<c-r>') -- redo
nkeymap('*', '*N:silent set hls<CR>') -- don't jump with * search
nkeymap('<leader>;', 'q:k') -- show command history
nkeymap('<leader>/', 'q/k') -- show search history
nkeymap('<leader>j', 'mz:join<cr>`z') -- join the lines, hold the cursor
vkeymap('<leader>j', 'mz:join<cr>`z')
nkeymap('<leader>k', 'kmz:join<cr>`z')
vkeymap('<leader>k', 'kmz:join<cr>`z')
nkeymap('<leader>th', '<cmd>silent set hlsearch! hlsearch?<CR>') -- toggle highlight
nkeymap('<leader>tw', ':silent set wrap! wrap?<CR>') -- toggle wrap
nkeymap('<leader>ts', ':silent set spell! spell?<CR>') -- toggle spell
nkeymap('<leader>z', 'zAzz') -- toggle folding
nkeymap('<leader>s"', '/".\\{-}"<cr>') -- search "" strings
nkeymap('<leader>s\'', '/\'.\\{-}\'<cr>') -- search '' strings
nkeymap('<leader>cd', '<cmd>cd %:h<cr>') -- change global directory to current buffer
nkeymap('n', 'nzvzz') -- center find
nkeymap('N', 'Nzvzz')
nkeymap('<leader>=', '=i{') -- auto indent inside {} block
tkeymap('<Esc>', '<C-\\><C-n>')
nkeymap('vaa', 'ggVG') -- select all file
ikeymap('<C-l>', '_')

-- record/repeat macro
vkeymap('Q', ':norm @q<CR>')
vkeymap('.', ':norm .<CR>')

vkeymap("<", "<gv") -- stay in indent mode (while in visual mode)
vkeymap(">", ">gv") -- stay in indent mode (while in visual mode)

-- moveing lines. surprisingly Alt works in nvim!
-- nkeymap('<c-Down>', ':m .+1<CR>')
-- nkeymap('<c-Up>', ':m .-2<CR>')
-- vkeymap('<c-Down>', ":m '>+1<CR>gv")
-- vkeymap('<c-Up>', ":m '<-2<CR>gv")

-- copy/paste/replace/substitute
nkeymap('Y', 'y$') -- yank to end if line
vkeymap('p', 'P') -- while pasting on top of visual selection, hold the yanked register
nkeymap('<c-v>', '"+p')
vkeymap('<c-v>', '"+P')
ikeymap('<c-v>', '<c-r>+') -- for windows clipboard
-- ckeymap('<c-v>', '<c-r>+')
vkeymap('<c-c>', '"+y')
nkeymap('<c-c>', '"+y')
nkeymap('<c-c><c-c>', '"+yy')
ikeymap('<c-p>', '<c-r>0') -- paste what was yanked when writing
ckeymap('<c-p>', '<c-r>0')
-- nkeymap('<c-p>', '"+p')
-- vkeymap('<c-y>', '"+y')
-- nkeymap('<c-y>', '"+y')
nkeymap('yaa', ':%y<cr>') -- yank all file
nkeymap('daa', ':%d<cr>') -- yank all file
nkeymap('<c-c>aa', ':%y+<cr>') -- yank all file
nkeymap('<leader>p', '"0p') -- from yanked register
nkeymap('<leader>P', '"0P')
vkeymap('<leader>p', '"0p')
vkeymap('<leader>P', '"0P')
nkeymap('<leader>rw', 'viw"0P') -- replace current word with yanked
nkeymap('<leader>rl', '"hyiw:s/<c-r>h/<c-r>0/gI<cr>') -- replace current word with yanked, in current line
nkeymap('<leader>ra', '"hyiw:%s/<c-r>h/<c-r>0/gI<cr>') -- replace current word with yanked, in file
nkeymap('<leader>rr', 'dd"0P')
nkeymap('<leader>YY', '"xyy') -- multi line yank by user
nkeymap('<leader>yy', '"Xyy')
nkeymap('<leader>ys', 'mx:let @x=""<cr>:%g//yank X<cr>:let @+=@x<cr>`x') -- multi line yank searched word
nkeymap('<leader>cc', 'mx"hyyp`xjviw"0P') -- duplicate line, replace word under cursor with yanked register
nkeymap('<leader>Y', '"xy')
nkeymap('<leader>y', '"Xy')
vkeymap('<leader>Y', '"xy')
vkeymap('<leader>y', '"Xy')
nkeymap('<leader>DD', '"xdd') -- multi line cut
nkeymap('<leader>dd', '"Xdd')
vkeymap('<leader>D', '"xd')
vkeymap('<leader>d', '"Xd')
nkeymap('<leader>x', '"xp') -- paste multi
nkeymap('<leader>YY', '"xyy')
-- nkeymap('<leader>R', ':%s/\\<<c-r><c-w>\\>/<c-r><c-w>/gI<left><left><left>') -- replace
-- vkeymap('<leader>R', ':s/\\<<c-r><c-w>\\>/<c-r><c-w>/gI<left><left><left>') -- replace
nkeymap('<leader><c-n>', ':%s/\\<<c-r><c-w>\\>//gIn<cr>') -- count keyword
vkeymap('<leader><c-n>', ':s/\\<<c-r><c-w>\\>//gIn<cr>') -- count keyword
nkeymap('<leader>R', '"hyiw:.,$s/\\<<C-r>h\\>/<c-r>0/gc<cr>') -- interactive replace the word under cursor

-- open some urls/files
nkeymap('<leader>oy', ':!start chrome "<c-r>""<cr>') -- open url from yanked
nkeymap('<leader>ou', '"uyiW:!start chrome \'<c-r>u\'<cr>') -- open url
vkeymap('<leader>ou', '"uy:!start chrome "<c-r>u"<cr>') -- open visually selected url
nkeymap('<leader>os', '"uyiw:!start www.google.com/search?q="<c-r>u"<cr>') -- open url
vkeymap('<leader>os', '"uy:!start www.google.com/search?q="<c-r>u"<cr>') -- search visually selected text

-- file/buffer
nkeymap('<leader>fe', vim.cmd.Ex) -- file explorer
nkeymap('<leader>sf', ':w<cr>') -- save buffer
nkeymap('<leader>ss', ':exe "mksession! " . v:this_session<CR>') -- save session
nkeymap('<leader>so', ':w <bar> source %<cr>') -- save & source file
nkeymap('<leader>sa', ':wall<CR>') -- save all files
nkeymap('<leader>ff', '1<c-g>') -- print filepath
nkeymap('<leader>Q', ':qall<CR>') -- close all
nkeymap('<leader>fQ', ':qall!<CR>') -- force close all
nkeymap('<leader>q', ':Bdelete<CR>') -- delete buffer, but don't close window (using vim-bbye plugin)
nkeymap('<leader>fq', ':Bdelete!<CR>') -- force delete buffer
nkeymap('ZQ', ':bd!<cr>') -- close buffer without saving, don't close window
nkeymap('ZZ', ':w <bar> Bdelete<CR>') -- save buffer and close, don't close window

-- windows/splits
-- nkeymap('<c-h>', '<c-w>h')
-- nkeymap('<c-j>', '<c-w>j')
-- nkeymap('<c-k>', '<c-w>k')
-- nkeymap('<c-l>', '<c-w>l')
-- tkeymap('<c-h>', '<c-\\><c-n><c-w>h')
-- tkeymap('<c-j>', '<c-\\><c-n><c-w>j')
-- tkeymap('<c-k>', '<c-\\><c-n><c-w>k')
-- tkeymap('<c-l>', '<c-\\><c-n><c-w>l')
nkeymap('<leader>w', '<c-w>') -- all windows operations
-- tkeymap('<leader>w', '<c-\\><c-n><c-w>')
nkeymap('<leader>wq', '<c-w>c') -- close window/split (safe)
nkeymap('<leader>wn', '<c-w><c-w>') -- next window
nkeymap('W', '<c-w><c-w>') -- next window
-- nkeymap('<leader>sp', "<C-w>v") -- split window vertically
-- nkeymap('<leader>sh', "<C-w>s") -- split window horizontally

-- resize windows with arrows
nkeymap("<C-Up>", ":resize +2<CR>")
nkeymap("<C-Down>", ":resize -2<CR>")
nkeymap("<C-Left>", ":vertical resize -2<CR>")
nkeymap("<C-Right>", ":vertical resize +2<CR>")

-- quick file access
nkeymap('<leader>oi', ':e ~/AppData/Local/nvim/init.lua<cr>')
nkeymap('<leader>ok', ':e ~/AppData/Local/nvim/lua/shk/keymap.lua<cr>')
nkeymap('<leader>oa', ':e ~/.config/alacritty/alacritty.yml<cr>')
nkeymap('<leader>oh', ':e C:/Users/shk/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup/myScript.ahk<cr>')
nkeymap('<leader>op', ':e ~/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1<CR>')
nkeymap('<leader>ot', ':e ~/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json<CR>')
nkeymap('<leader>oP', ':e ~/AppData/Local/nvim/after/plugin/<CR>')

-- navigation
-- nkeymap('J', '}')
-- nkeymap('K', '{')
-- nkeymap('J', '<cmd>execute "keepjumps norm! " . v:count1 . "}zz"<CR>')
-- nkeymap('K', '<cmd>execute "keepjumps norm! " . v:count1 . "{zz"<CR>')
-- vkeymap('J', '<cmd>execute "keepjumps norm! " . v:count1 . "}zz"<CR>')
-- vkeymap('K', '<cmd>execute "keepjumps norm! " . v:count1 . "{zz"<CR>')
nkeymap('<c-n>', '<cmd>bnext<CR>') -- previously L
nkeymap('<c-p>', '<cmd>bprevious<CR>') -- previously H
nkeymap('<c-u>', '9kzz');
nkeymap('<c-d>', '9jzz');
vkeymap('<c-u>', '9k');
vkeymap('<c-d>', '9j');
nkeymap('gl', '$');
nkeymap('gh', '^');
vkeymap('gl', '$');
vkeymap('gh', '^');
nkeymap('ge', 'G');
vkeymap('ge', 'G');
-- nkeymap('<c-u>', '<c-u>zz');
-- nkeymap('<c-d>', '<c-d>zz');
-- nkeymap('{', '?^\\s*{<CR>:nohl<CR>')
-- nkeymap('}', '/^\\s*}<CR>:nohl<CR>')

-- execute command line under cursor
nkeymap('<leader>ee', ':silent exe "!" . getline(".")<CR>')
nkeymap('<leader>ex', ':exe getline(".")<CR>')
--nkeymap('<leader>et', ':exe "!tmux send -t .+ \'echo " . vim.fn.getline(".") . "\' Enter"<CR>')
--nkeymap('<leader>E', ':exe "!tmux send -t .+ \'" . vim.fn.getline(".") . "\' Enter"<CR>')

