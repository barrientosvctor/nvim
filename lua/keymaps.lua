-- Split windows
vim.keymap.set("n", "ty", ":vsp<cr><C-w>l")
vim.keymap.set("n", "tx", ":split<cr><C-w>j")

-- Open terminal
vim.keymap.set("n", "th", ":botright new <Bar> :term<cr>")
vim.keymap.set("n", "tv", ":botright vnew <Bar> :term<cr>")

-- Move between windows
vim.keymap.set("", "<C-h>", "<C-w>h")
vim.keymap.set("", "<C-j>", "<C-w>j")
vim.keymap.set("", "<C-k>", "<C-w>k")
vim.keymap.set("", "<C-l>", "<C-w>l")

-- Resize windows
vim.keymap.set("n", "t<left>", "<C-w>>")
vim.keymap.set("n", "t<right>", "<C-w><")
vim.keymap.set("n", "t<up>", "<C-w>+")
vim.keymap.set("n", "t<down>", "<C-w>-")

-- Tabs
vim.keymap.set("n", "te", ":tabedit<cr>")
vim.keymap.set("n", "tp", ":tabprevious<cr>")
vim.keymap.set("n", "tn", ":tabnext<cr>")

-- Terminal
vim.keymap.set("t", "<leader>zz", "<C-\\><C-n>")
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l")

-- Delete buffer
vim.keymap.set("n", "<leader>dc", ":bdelete<cr>")

-- Inspect treesitter elements
vim.keymap.set("n", "<leader>ww", ":Inspect<cr>")
vim.keymap.set("n", "<leader>wq", ":InspectTree<cr>")

vim.keymap.set("n", "<leader>we", ":color abyss<cr>")
