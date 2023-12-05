local M = {}


-- Modify every time you want to include some lsp to mason's automatic installation
-- To see the setup for any lsp look this: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
M.servers = {
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

return M
