return {
    "ibhagwan/fzf-lua",
    lazy = true,
    keys = {
        {
            "<Leader>ff",
            "<Cmd>FzfLua files<CR>",
            mode = "n",
            desc = "[F]ind [F]iles"
        },
        {
            "<Leader>fb",
            "<Cmd>FzfLua buffers<CR>",
            mode = "n",
            desc = "Lists open [B]uffers"
        },
        {
            "<Leader>fg",
            "<Cmd>FzfLua live_grep<CR>",
            mode = "n",
            desc = "Uses live [G]rep"
        },
        {
            "<Leader>fh",
            "<Cmd>FzfLua helptags<CR>",
            mode = "n",
            desc = "Search into all nvim [H]elp documentation via fzf"
        },
        {
            "<Leader>fs",
            function()
                return require("fzf-lua").files { cwd = vim.fn.stdpath "config" }
            end,
            mode = "n",
            desc = "Search into nvim dotfiles folder"
        },
    },
    opts = {
        "max-perf",
        winopts = {
            preview = {
                default = "default"
            }
        }
    }
}
