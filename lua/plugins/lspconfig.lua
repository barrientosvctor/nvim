return {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    lazy = true,
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true

        local lspconfig = require("lspconfig")
        local lsp_options = { capabilities = capabilities }

        lspconfig.tsserver.setup {}
        lspconfig.clangd.setup {}
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
            }
        }
        lspconfig.pyright.setup {}
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

                vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, opts)
                vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, opts)
                vim.keymap.set('n', 'gI', require('telescope.builtin').lsp_implementations, opts)
                vim.keymap.set('n', '<Leader>D', require('telescope.builtin').lsp_type_definitions, opts)
                vim.keymap.set('n', '<Leader>ds', require('telescope.builtin').lsp_document_symbols, opts)
                vim.keymap.set('n', '<Leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, opts)

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
