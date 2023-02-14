local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    print("Treesitter is not installed.")
    return
end

treesitter.setup({
    -- Lspsaga.nvim needs these syntax highlight to work.
    ensure_installed = { "markdown", "markdown_inline" },
    sync_install = false,
    highlight = {
        enable = true,
        disable = { "lua" },
    },
})
