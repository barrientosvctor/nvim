local status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status then return end

mason_lspconfig.setup({
    ensure_installed = { "tsserver", "pyright", "html", "jsonls", "cssls", "emmet_ls", "sumneko_lua" },
    automatic_installation = true
})
