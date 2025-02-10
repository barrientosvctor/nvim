require("mason").setup {}

local lsp = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lsp.clangd.setup { capabilities = capabilities }
lsp.ts_ls.setup { capabilities = capabilities }
lsp.lua_ls.setup { capabilities = capabilities }
lsp.pylsp.setup { capabilities = capabilities }

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("ModLspConfig", {}),
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
        local opts = { buffer = ev.buf }

        vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<Leader>dn", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "<Leader>dp", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<Leader>D", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        vim.api.nvim_buf_create_user_command(ev.buf, "Format", function()
            return vim.lsp.buf.format()
        end, { desc = "Auto format the actual buffer." })
    end
})
