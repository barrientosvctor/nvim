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
    },
    opts = {
        'max-perf',
        winopts = {
            preview = {
                default = "builtin"
            }
        }
    },
}
