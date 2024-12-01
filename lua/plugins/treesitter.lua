return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    opts = {
        -- Add languages to be installed here that you want installed for treesitter
        ensure_installed = { "c", "cpp", "lua", "python", "javascript", "typescript", "markdown", "vimdoc" },

        -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
        auto_install = false,

        highlight = { enable = true },
        indent = { enable = true },
    },
}
