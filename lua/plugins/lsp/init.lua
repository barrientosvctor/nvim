return {
    "neovim/nvim-lspconfig",
    dependencies = {
        {
            "williamboman/mason.nvim",
            cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
            opts = {},
        },
        {
            "williamboman/mason-lspconfig.nvim",
            version = "v1.30.0",
            opts = {},
        }
    },
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        require("mason-lspconfig").setup_handlers {
            function (server_name)
                require("lspconfig")[server_name].setup {
                    capabilities = capabilities
                }
            end,

            ["clangd"] = function (server_name)
                local clangd_setup = {
                    capabilities = capabilities
                }

                if vim.fn.has("win32") and vim.fn.executable("clangd") then
                    local clangd_exe = vim.fn.exepath "clangd"
                    clangd_setup.cmd = { clangd_exe, "--query-driver=C:\\msys64\\ucrt64\\bin\\gcc.exe,C:\\msys64\\ucrt64\\bin\\g++.exe" } -- MSYS2 compiler
                end

                require("lspconfig").clangd.setup(clangd_setup)
            end,
        }

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
    end
}
