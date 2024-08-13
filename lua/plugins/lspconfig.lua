return {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    lazy = true,
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        -- Automatically install LSPs to stdpath for neovim
        {
            "williamboman/mason.nvim",
            cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
            dependencies = {
                { "williamboman/mason-lspconfig.nvim", opts = {} },
            },
        },
    },
    config = function()
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
            html = {},
            cssls = {},
        }
        local on_attach = function(_, bufnr)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[R]e[n]ame', buffer = bufnr })
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction', buffer = bufnr })
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation', buffer = bufnr })
            vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help, { desc = 'Signature Documentation', buffer = bufnr })
            vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, { desc = 'Go to [N]ext [D]iagnostic', buffer = bufnr })
            vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, { desc = 'Go to [P]revious [D]iagnostic', buffer = bufnr })

            vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, { desc = '[G]oto [D]efinition', buffer = bufnr })
            vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = '[G]oto [R]eferences', buffer = bufnr })
            vim.keymap.set('n', 'gI', require('telescope.builtin').lsp_implementations, { desc = '[G]oto [I]mplementation', buffer = bufnr })
            vim.keymap.set('n', '<leader>D', require('telescope.builtin').lsp_type_definitions, { desc = 'Type [D]efinition', buffer = bufnr })
            vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, { desc = '[D]ocument [S]ymbols', buffer = bufnr })
            vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, { desc = '[W]orkspace [S]ymbols', buffer = bufnr })

            -- Lesser used LSP functionality
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration', buffer = bufnr })
            vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { desc = '[W]orkspace [A]dd Folder', buffer = bufnr })
            vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { desc = '[W]orkspace [R]emove Folder', buffer = bufnr })

            vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
                return vim.lsp.buf.format()
            end,
                { desc = "Auto format the actual buffer." })
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

        -- TODO: remake lspconfig setup removing mason lspconfig
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
