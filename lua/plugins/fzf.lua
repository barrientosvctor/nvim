return {
    "ibhagwan/fzf-lua",
    lazy = true,
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
    config = function()
        require("fzf-lua").setup({
            'max-perf',
            winopts = {
                preview = {
                    default = "builtin"
                }
            }
        })
    end
}
