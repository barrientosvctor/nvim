local key = require("utils.keymap")
local lsp = require("utils.lsp")

return {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    dependencies = {
        -- Automatically install LSPs to stdpath for neovim
        {
            "williamboman/mason.nvim",
            dependencies = {
                { "williamboman/mason-lspconfig.nvim", opts = {} },
            },
            opts = {},
        },

        -- Useful status updates for LSP
        { "j-hui/fidget.nvim", opts = {} },

        -- Additional lua configuration, makes nvim stuff amazing!
        { "folke/neodev.nvim", opts = {} },
    },
    lazy = true,
    event = "BufReadPost",
    config = function()
        -- [[ Configure LSP ]]
        --  This function gets run when an LSP connects to a particular buffer.
        local on_attach = function(_, bufnr)
            key.bufmap('n', '<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame', bufnr)
            key.bufmap('n', '<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', bufnr)

            key.bufmap('n', 'gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition', bufnr)
            key.bufmap('n', 'gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences', bufnr)
            key.bufmap('n', 'gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation', bufnr)
            key.bufmap('n', '<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition', bufnr)
            key.bufmap('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols',
                bufnr)
            key.bufmap('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols,
                '[W]orkspace [S]ymbols', bufnr)

            key.bufmap('n', 'K', vim.lsp.buf.hover, 'Hover Documentation', bufnr)
            key.bufmap('i', '<C-s>', vim.lsp.buf.signature_help, 'Signature Documentation', bufnr)

            -- Lesser used LSP functionality
            key.bufmap('n', 'gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration', bufnr)
            key.bufmap('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder', bufnr)
            key.bufmap('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder', bufnr)

            -- auto format on save
            vim.api.nvim_create_autocmd("BufWritePre", {
                callback = function(_)
                    return vim.lsp.buf.format()
                end
            })
        end

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

        local mason_lspconfig = require "mason-lspconfig"

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
    end
}
