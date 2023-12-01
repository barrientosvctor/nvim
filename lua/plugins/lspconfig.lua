local key = require("utils.KeymapBuilder")

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
    config = function()
        -- [[ Configure LSP ]]
        --  This function gets run when an LSP connects to a particular buffer.
        local on_attach = function(_, bufnr)
            -- NOTE: Remember that lua is a real programming language, and as such it is possible
            -- to define small helper and utility functions so you don't have to repeat yourself
            -- many times.
            --
            -- In this case, we create a function that lets us more easily define mappings specific
            -- for LSP related items. It sets the mode, buffer and description for us each time.
            key.bufmap('n', '<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame', bufnr)
            key.bufmap('n', '<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', bufnr)

            --            key.bufmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
            --            key.bufmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
            --            key.bufmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
            --            key.bufmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
            --            key.bufmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
            --            key.bufmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

            key.bufmap('n', 'K', vim.lsp.buf.hover, 'Hover Documentation', bufnr)
            key.bufmap('n', '<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation', bufnr)

            -- Lesser used LSP functionality
            key.bufmap('n', 'gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration', bufnr)
            key.bufmap('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder', bufnr)
            key.bufmap('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder', bufnr)
            key.bufmap('n', '<leader>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, '[W]orkspace [L]ist Folders', bufnr)

            -- Create a command `:Format` local to the LSP buffer
            vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
                vim.lsp.buf.format()
            end, { desc = 'Format current buffer with LSP' })
        end

        local servers = {
            lua_ls = {
                Lua = {
                    workspace = { checkThirdParty = false },
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
        }

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

        local mason_lspconfig = require "mason-lspconfig"

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
    end
}