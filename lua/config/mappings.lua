local map = vim.keymap.set

map("n", "<ESC>", "<Cmd>nohlsearch<CR>", { desc = "Clear search highlights on pressing <Esc> in normal mode" })

-- Split windows
map("n", "<Leader>ty", "<Cmd>vsp<CR><C-w>l")
map("n", "<Leader>tx", "<Cmd>split<CR><C-w>j")

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

-- Move between windows
map("", "<C-h>", "<C-w>h")
map("", "<C-j>", "<C-w>j")
map("", "<C-k>", "<C-w>k")
map("", "<C-l>", "<C-w>l")

-- Resize windows
map("n", "t<left>", "<C-w>>")
map("n", "t<right>", "<C-w><")
map("n", "t<up>", "<C-w>+")
map("n", "t<down>", "<C-w>-")

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

-- Buffers
map("n", "<Leader>bn", "<Cmd>bnext<CR>")
map("n", "<Leader>bp", "<Cmd>bprev<CR>")
map("n", "<Leader>bd", "<Cmd>bdelete<CR>")

-- Source nvimrc file
map("n", "<Leader>so", function()
    -- To reload the file on the current buffer, type %
    local target_file = vim.fn.input("File to refresh: ", vim.fn.stdpath("config") .. "/", "file")
    vim.cmd.source(target_file)
end)

-- Switches between background colors
map("n", "<Leader>tb", function()
    if vim.o.background == "dark" then
        vim.o.background = "light"
    else
        vim.o.background = "dark"
    end
end)
