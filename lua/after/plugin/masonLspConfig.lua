local status, masonLSP = pcall(require, "mason-lspconfig")
if not status then return end

masonLSP.setup({
    ensure_installed = {},
    automatic_installation = false,
})
