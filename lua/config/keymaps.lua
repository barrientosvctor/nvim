local key = require("utils.keymap")

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

-- Tabs
key.map("n", "te", ":tabedit<cr>", "Open a new tab")
key.map("n", "tp", ":tabprevious<cr>", "Go to the previous tab")
key.map("n", "tn", ":tabnext<cr>", "Go to the next tab")

-- Terminal
key.map("t", "<leader>zz", "<C-\\><C-n>", "Exit from terminal mode to normal mode")
key.map("t", "<C-h>", "<C-\\><C-n><C-w>h", "Move to left window in terminal mode")
key.map("t", "<C-j>", "<C-\\><C-n><C-w>j", "Move to bottom window in terminal mode")
key.map("t", "<C-k>", "<C-\\><C-n><C-w>k", "Move to up window in terminal mode")
key.map("t", "<C-l>", "<C-\\><C-n><C-w>l", "Move to right window in terminal mode")

-- Delete buffer
key.map("n", "<leader>dc", ":bdelete<cr>", "Delete the actual buffer")

-- Inspect treesitter elements
key.map("n", "<leader>ww", ":Inspect<cr>", "Inspect the treesitter element inside cursor")
key.map("n", "<leader>wq", ":InspectTree<cr>", "Inspect the treesitter tree elements into the file")

key.map("n", "<leader>we", ":color abyss<cr>", "Reload abyss.nvim")
