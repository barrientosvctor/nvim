return {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    event = "BufReadPost",
    opts = {},
    keys = {
        {
            "<leader>gb",
            ":Gitsigns toggle_current_line_blame<cr>",
            mode = "n",
            desc = "Toggle git blame to the current line."
        },
        {
            "<leader>gs",
            ":Gitsigns diffthis<cr>",
            mode = "n",
            desc = "Show the git diff in the current file."
        }
    }
}
