return {
    "ibhagwan/fzf-lua",
    keys = {
        {
            "<Leader>ff",
            "<Cmd>FzfLua files<CR>",
            desc = "Open files",
            mode = "n",
        },
        {
            "<Leader>fb",
            "<Cmd>FzfLua buffers<CR>",
            desc = "Open buffers",
            mode = "n",
        },
        {
            "<Leader>fg",
            "<Cmd>FzfLua live_grep<CR>",
            desc = "Open grep",
            mode = "n",
        },
        {
            "<Leader>fd",
            function()
                return require("fzf-lua").files { cwd = vim.fn.stdpath "config" }
            end,
            desc = "Open neovim dotfiles",
            mode = "n",
        },
    },
    opts = {
        "max-perf",
        winopts = {
            preview = {
                default = "builtin"
            }
        },
    },
}
