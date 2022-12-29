local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    print("Treesitter is not installed.")
    return
end

treesitter.setup({
    ensure_installed = { "javascript", "html", "python", "css" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true
    }
})
