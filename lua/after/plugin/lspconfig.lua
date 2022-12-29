local status, lspconfig = pcall(require, "lspconfig")
if not status then
    print("Lspconfig is not installed.")
    return
end

local status, mason = pcall(require, "mason")
if not status then
    print("Mason is not installed.")
    return
end

local status, masonLSP = pcall(require, "mason-lspconfig")
if not status then
    print("Mason-Lspconfig is not installed.")
    return
end

-- Lspconfig
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local servers = { "tsserver", "cssls", "jsonls", "html", "pyright", "sumneko_lua" }

for _, lang in ipairs(servers) do
    lspconfig[lang].setup { capabilities = capabilities }
end

-- Mason
mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

-- Mason lspconfig
masonLSP.setup({})
