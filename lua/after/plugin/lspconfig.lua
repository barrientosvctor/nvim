local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if (not lspconfig_status) then
    print("Lspconfig is not installed.")
    return
end

local nvim_lsp_status, nvim_lsp = pcall(require, "cmp_nvim_lsp")
if (not nvim_lsp_status) then return end

local capabilities = nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- ///////////////// MODIFY THIS LIST EVERY TIME YOU INSTALL A NEW LSP //////////////////
local servers = { "tsserver", "pyright", "clangd" }

for _, lang in ipairs(servers) do
    lspconfig[lang].setup { capabilities = capabilities }
end
