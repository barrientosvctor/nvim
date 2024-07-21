-- Modify every time you want to include some lsp to mason's automatic installation
-- To see the setup for any lsp look this: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = {
    lua_ls = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
            telemetry = { enable = false },
        },
    },
    clangd = {},
    tsserver = {},
    pyright = {
        python = {
            analysis = {
                autoSearchPaths = false,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true
            },
        }
    },
    cmake = {},
}

local on_attach = function(_, bufnr)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr })
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
    vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help, { buffer = bufnr })
    vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, { buffer = bufnr })
    vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, { buffer = bufnr })

    vim.keymap.set('n', 'gd', ":Telescope lsp_definitions<cr>", { buffer = bufnr })
    vim.keymap.set('n', 'gr', ":Telescope lsp_references<cr>", { buffer = bufnr })
    vim.keymap.set('n', 'gI', ":Telescope lsp_implementations<cr>", { buffer = bufnr })
    vim.keymap.set('n', '<leader>D', ":Telescope lsp_type_definitions<cr>", { buffer = bufnr })
    vim.keymap.set('n', '<leader>ds', ":Telescope lsp_document_symbols<cr>", { buffer = bufnr })
    vim.keymap.set('n', '<leader>ws', ":Telescope lsp_dynamic_workspace_symbols<cr>", { buffer = bufnr })

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
    ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
    function(server_name)
        require("lspconfig")[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
        }
    end,
}
