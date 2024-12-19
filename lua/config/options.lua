vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.mapleader = ","
vim.g.maplocalleader = ","
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.wrap = true
vim.opt.completeopt:append { "menu", "menuone", "noinsert", "noselect" }
vim.opt.cursorline = true
vim.opt.fileencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.clipboard:append { "unnamed", "unnamedplus" }

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("dotfiles-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
