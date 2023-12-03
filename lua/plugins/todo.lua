return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    lazy = true,
    keys = {
        {
            "<leader>ft",
            ":TodoTelescope<cr>",
            mode = "n",
            desc = "View all [T]ags via telescope"
        }
    }
}
