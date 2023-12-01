local key = require("utils.KeymapBuilder")

-- Split windows
key.map("n", "ty", ":vsp<cr><C-w>l", "Split vertical window")
key.map("n", "tx", ":split<cr><C-w>j", "Split horizontal window")

-- Open terminal
key.map("n", "th", ":botright new <Bar> :term<cr>", "Open horizontal terminal")
key.map("n", "tv", ":botright vnew <Bar> :term<cr>", "Open vertical terminal")

-- Select all
key.map("n", "<c-a>", "gg<S-v>G", "Select all on a buffer")

-- Move between windows
key.map("", "<C-h>", "<C-w>h", "Move to left window")
key.map("", "<C-j>", "<C-w>j", "Move to bottom window")
key.map("", "<C-k>", "<C-w>k", "Move to up window")
key.map("", "<C-l>", "<C-w>l", "Move to right window")

-- Resize windows
key.map("n", "t<left>", "<C-w>>", "Resize to left")
key.map("n", "t<right>", "<C-w><", "Resize to right")
key.map("n", "t<up>", "<C-w>+", "Resize to up")
key.map("n", "t<down>", "<C-w>-", "Resize to down")

-- New tab
key.map("n", "te", ":tabedit<cr>", "Open a new tab")

key.map("t", "<leader>zz", "<C-\\><C-n>", "Pass from insert mode to normal mode in terminal mode")

-- Move between buffers
key.map("n", "<leader>df", ":bnext<cr>", "Move to next buffer")
key.map("n", "<leader>fd", ":bprev<cr>", "Move to previous buffer")
key.map("n", "<leader>dc", ":bdelete<cr>", "Delete the actual buffer")
