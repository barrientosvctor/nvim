return {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = require("lspconfig")
        local lsp_options = { capabilities = capabilities }

        lspconfig.tsserver.setup(lsp_options)
        lspconfig.clangd.setup(lsp_options)
        lspconfig.cmake.setup(lsp_options)
        lspconfig.lua_ls.setup {
            on_init = function(client)
                local path = client.workspace_folders[1].name
                if (vim.uv or vim.loop).fs_stat(path..'/.luarc.json') or (vim.uv or vim.loop).fs_stat(path..'/.luarc.jsonc') then
                    return
                end

                client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                    runtime = {
                        -- Tell the language server which version of Lua you're using
                        -- (most likely LuaJIT in the case of Neovim)
                        version = 'LuaJIT'
                    },
                    -- Make the server aware of Neovim runtime files
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME
                            -- Depending on the usage, you might want to add additional paths here.
                            -- "${3rd}/luv/library"
                            -- "${3rd}/busted/library",
                        }
                        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                        -- library = vim.api.nvim_get_runtime_file("", true)
                    }
                })
            end,
            settings = {
                Lua = {}
            },
            capabilities = capabilities
        }
        lspconfig.pyright.setup(lsp_options)
        lspconfig.html.setup(lsp_options)
        lspconfig.cssls.setup(lsp_options)

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("ModLspConfig", {}),
            callback = function(ev)
                -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
                local opts = { buffer = ev.buf }

                vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
                vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<Leader>dn', vim.diagnostic.goto_next, opts)
                vim.keymap.set('n', '<Leader>dp', vim.diagnostic.goto_prev, opts)

                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, opts)
                vim.keymap.set('n', '<Leader>ds', vim.lsp.buf.document_symbol, opts)
                vim.keymap.set('n', '<Leader>ws', vim.lsp.buf.workspace_symbol, opts)

                -- Lesser used LSP functionality
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, opts)

                vim.api.nvim_buf_create_user_command(ev.buf, "Format", function()
                    return vim.lsp.buf.format()
                end,
                    { desc = "Auto format the actual buffer." })
            end
        })
    end
}
