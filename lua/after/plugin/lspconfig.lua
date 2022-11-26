local status, lspconfig = pcall(require, "lspconfig")
if not status then return end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local servers = { "tsserver", "cssls", "jsonls", "html", "emmet_ls", "pyright", "sumneko_lua" }

for _, lang in ipairs(servers) do
    lspconfig[lang].setup { capabilities = capabilities }
end
