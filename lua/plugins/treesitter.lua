return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    cmd = { "TSInstall", "TSModuleInfo", "TSBufEnable", "TSBufDisable" },
    opts = {
        -- Add languages to be installed here that you want installed for treesitter
        ensure_installed = { "c", "cpp", "lua", "python", "javascript", "typescript", "markdown", "vimdoc" },

        -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
        auto_install = false,

        highlight = { enable = true },
        indent = { enable = true },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end
}
