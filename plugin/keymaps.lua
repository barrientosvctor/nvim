-- Split windows
vim.keymap.set("n", "<leader>ty", ":vsp<cr><C-w>l")
vim.keymap.set("n", "<leader>tx", ":split<cr><C-w>j")

-- Open terminal
vim.keymap.set("n", "<leader>th", function()
    vim.cmd.new()
    vim.cmd.wincmd "J"
    vim.api.nvim_win_set_height(0, 12)
    vim.wo.winfixheight = true
    vim.cmd.term()
end)
vim.keymap.set("n", "<leader>tv", function()
    vim.cmd.new()
    vim.cmd.wincmd "L"
    vim.api.nvim_win_set_width(0, 60)
    vim.wo.winfixwidth = true
    vim.cmd.term()
end)

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
vim.keymap.set("n", "<leader>te", ":tabedit<cr>")
vim.keymap.set("n", "<leader>tp", ":tabprevious<cr>")
vim.keymap.set("n", "<leader>tn", ":tabnext<cr>")

-- Terminal
vim.keymap.set("t", "<leader>zz", "<C-\\><C-n>")
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l")

-- Delete buffer
vim.keymap.set("n", "<leader>bd", ":bdelete<cr>")

-- Inspect treesitter elements
vim.keymap.set("n", "<leader>ww", ":Inspect<cr>")
vim.keymap.set("n", "<leader>wq", ":InspectTree<cr>")

-- Move line
vim.keymap.set("n", "<C-S-Up>", ":move -2<cr>")
vim.keymap.set("n", "<C-S-Down>", ":move +1<cr>")

-- Source nvimrc file
vim.keymap.set("n", "<leader>so", function()
    -- To reload the file on the current buffer, type %
    local target_file = vim.fn.input("File to refresh: ", vim.fn.stdpath("config") .. "/", "file")
    vim.cmd.source(target_file)
end)

