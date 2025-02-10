require("nvim-treesitter.configs").setup {
    ensure_installed = { "markdown", "vimdoc" },
    auto_install = false,
    highlight = { enable = true },
    indent = { enable = true },
}
