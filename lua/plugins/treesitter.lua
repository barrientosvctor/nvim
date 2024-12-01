return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufEnter",
    cmd = { "TSInstall", "TSpdate" },
    main = "nvim-treesitter.configs",
    opts = {
        ensure_installed = { "c", "cpp", "lua", "python", "javascript", "typescript", "markdown", "vimdoc" },
        auto_install = false,
        highlight = { enable = true },
        indent = { enable = true },
    },
}
