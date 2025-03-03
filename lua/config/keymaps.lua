local map = vim.keymap.set

map("n", "<ESC>", "<Cmd>nohlsearch<CR>", { desc = "Clear search highlights on pressing <Esc> in normal mode" })

-- Open terminal
map("n", "<Leader>th", function()
    vim.cmd.new()
    vim.cmd.wincmd "J"
    vim.api.nvim_win_set_height(0, 12)
    vim.wo.winfixheight = true
    vim.cmd.term()
end)
map("n", "<Leader>tv", function()
    vim.cmd.new()
    vim.cmd.wincmd "L"
    vim.api.nvim_win_set_width(0, 60)
    vim.wo.winfixwidth = true
    vim.cmd.term()
end)

-- Tabs
map("n", "<Leader>te", "<Cmd>tabedit<CR>")
map("n", "<Leader>tp", "<Cmd>tabprevious<CR>")
map("n", "<Leader>tn", "<Cmd>tabnext<CR>")

-- Terminal
map("t", "<Esc><Esc>", "<C-\\><C-n>")
map("t", "<C-h>", "<C-\\><C-n><C-w>h")
map("t", "<C-j>", "<C-\\><C-n><C-w>j")
map("t", "<C-k>", "<C-\\><C-n><C-w>k")
map("t", "<C-l>", "<C-\\><C-n><C-w>l")

-- Switches between background colors
map("n", "<Leader>tb", function()
    if vim.o.background == "dark" then
        vim.o.background = "light"
    else
        vim.o.background = "dark"
    end
end)
