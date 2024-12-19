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
            "<Cmd>Telescope buffers<CR>",
            desc = "Open buffers",
            mode = "n",
        },
        {
            "<Leader>fg",
            "<Cmd>Telescope live_grep<CR>",
            desc = "Open grep",
            mode = "n",
        },
    },
    opts = {},
}
