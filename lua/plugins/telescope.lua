return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-tree/nvim-web-devicons",
            enabled = vim.g.enable_devicons
        }
    },
    lazy = true,
    cmd = "Telescope",
    keys = {
        {
            "<leader>ff",
            "<Cmd>Telescope find_files<CR>",
            mode = "n",
            desc = "[F]ind [F]iles via telescope"
        },
        {
            "<leader>fg",
            "<Cmd>Telescope live_grep<CR>",
            mode = "n",
            desc = "Uses live [G]rep via telescope"
        },
        {
            "<leader>fb",
            "<Cmd>Telescope buffers<CR>",
            mode = "n",
            desc = "Lists open [B]uffers via telescope"
        },
        {
            "<leader>fh",
            "<Cmd>Telescope help_tags<CR>",
            mode = "n",
            desc = "Search into all nvim [H]elp documentation via telescope"
        },
        {
            "<leader>sf",
            function()
                return require "telescope.builtin".find_files { cwd = vim.fn.stdpath "config" }
            end,
            mode = "n",
            desc = "Search into nvim dotfiles folder"
        },
    },
    opts = {
        defaults = {
            layout_strategy = "horizontal",
            layout_config = {
                height = 0.70,
                width = 0.80,
                preview_cutoff = 120,
            }
        },
        pickers = {},
    }
}
