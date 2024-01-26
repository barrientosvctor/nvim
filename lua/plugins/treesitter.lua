return {
    -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "windwp/nvim-ts-autotag"
    },
    lazy = true,
    event = "BufReadPost",
    build = ":TSUpdate",
    config = function()
        vim.defer_fn(function()
            require("nvim-treesitter.configs").setup {
                -- Add languages to be installed here that you want installed for treesitter
                ensure_installed = { "c", "cpp", "lua", "python", "tsx", "javascript", "typescript", "vimdoc", "vim" },

                -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
                auto_install = false,

                highlight = { enable = true },
                indent = { enable = true },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<c-space>",
                        node_incremental = "<c-space>",
                        scope_incremental = "<c-s>",
                        node_decremental = "<M-space>",
                    },
                },
                autotag = {
                    enable = true,
                },
            }
        end, 0)
    end
}
