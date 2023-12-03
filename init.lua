require("config")

-- auto format on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.lua", "*.c", "*.cpp", "*.h", "*.hpp", "*.js", "*.ts", "*.tsx", "*.py" },
    callback = function(_)
        return vim.lsp.buf.format()
    end
})
