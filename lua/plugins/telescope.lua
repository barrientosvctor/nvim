return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        {
            "<Leader>ff",
            "<Cmd>Telescope find_files<CR>",
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
    opts = {},
}
