return {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" },
    lazy = true,
    keys = {
        {
            "<Leader>ff",
            "<Cmd>FZF<CR>",
            mode = "n",
            desc = "[F]ind [F]iles"
        },
        {
            "<Leader>fb",
            "<Cmd>Buffers<CR>",
            mode = "n",
            desc = "Lists open [B]uffers"
        },
        {
            "<Leader>fg",
            "<Cmd>Rg<CR>",
            mode = "n",
            desc = "Uses live [G]rep"
        },
        {
            "<Leader>fh",
            "<Cmd>Helptags<CR>",
            mode = "n",
            desc = "Search into all nvim [H]elp documentation via fzf"
        },
        {
            "<Leader>fs",
            function()
                vim.cmd("Files " .. vim.fn.stdpath "config")
            end,
            mode = "n",
            desc = "Search into nvim dotfiles folder"
        },
    },
}
