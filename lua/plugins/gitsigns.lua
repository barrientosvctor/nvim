return {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    event = { "BufReadPost", "BufNewfile" },
    opts = {},
    keys = {
        {
            "<leader>gb",
            "<Cmd>Gitsigns toggle_current_line_blame<CR>",
            mode = "n",
            desc = "Toggle git blame to the current line."
        },
        {
            "<leader>gs",
            "<Cmd>Gitsigns diffthis<CR>",
            mode = "n",
            desc = "Show the git diff in the current file."
        }
    }
}
