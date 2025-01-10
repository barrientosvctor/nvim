return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
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
        {
            "<Leader>fd",
            function()
                return require("telescope.builtin").find_files { cwd = vim.fn.stdpath "config" }
            end,
            desc = "Open neovim dotfiles",
            mode = "n",
        },
    },
    opts = {},
}
