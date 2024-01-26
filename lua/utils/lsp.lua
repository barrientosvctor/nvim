local M = {}


-- Modify every time you want to include some lsp to mason's automatic installation
-- To see the setup for any lsp look this: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
M.servers = {
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

return M
