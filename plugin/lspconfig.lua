local lsp = require("util.lsp")
-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr })
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
    vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help, { buffer = bufnr })
    vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, { buffer = bufnr })
    vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, { buffer = bufnr })

    vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, { buffer = bufnr })
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { buffer = bufnr })
    vim.keymap.set('n', 'gI', require('telescope.builtin').lsp_implementations, { buffer = bufnr })
    vim.keymap.set('n', '<leader>D', require('telescope.builtin').lsp_type_definitions, { buffer = bufnr })
    vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, { buffer = bufnr })
    vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, { buffer = bufnr })

    -- Lesser used LSP functionality
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr })
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { buffer = bufnr })
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { buffer = bufnr })

    vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
        return vim.lsp.buf.format()
    end, { desc = "Auto format the actual buffer." })
end

local capabilities = vim.tbl_deep_extend("force",
vim.lsp.protocol.make_client_capabilities(),
require('cmp_nvim_lsp').default_capabilities()
)

local mason_lspconfig = require "mason-lspconfig"

require("mason").setup()
mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(lsp.servers),
}

mason_lspconfig.setup_handlers {
    function(server_name)
        require("lspconfig")[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = lsp.servers[server_name],
            filetypes = (lsp.servers[server_name] or {}).filetypes,
        }
    end,
}
