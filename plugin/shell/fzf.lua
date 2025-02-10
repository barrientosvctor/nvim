require("fzf-lua").setup {
    "max-perf",
    winopts = {
        preview = {
            default = "builtin"
        }
    },
}

vim.keymap.set("n", "<Leader>ff", "<Cmd>FzfLua files<CR>")
vim.keymap.set("n", "<Leader>fb", "<Cmd>FzfLua buffers<CR>")
vim.keymap.set("n", "<Leader>fg", "<Cmd>FzfLua live_grep<CR>")
vim.keymap.set("n", "<Leader>fd", function()
    return require("fzf-lua").files { cwd = vim.fn.stdpath "config" }
end)
