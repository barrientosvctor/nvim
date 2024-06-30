require("fzf-lua").setup({
    "max-perf",
    winopts = {
        preview = {
            default = "builtin" --`builtin|bat|cat|head`
        },
    }
})

vim.keymap.set("n", "<leader><leader>", ":FzfLua files<cr>")
vim.keymap.set("n", "<leader>fg", ":FzfLua live_grep<cr>")
vim.keymap.set("n", "<leader>fb", ":FzfLua buffers<cr>")
vim.keymap.set("n", "<leader>fh", ":FzfLua helptags<cr>")
