local status, null_ls = pcall(require, "null-ls")
if not status then
    return
end

local builtins = null_ls.builtins
local formatting = builtins.formatting
local diagnostics = builtins.diagnostics
local completion = builtins.completion

null_ls.setup({
    sources = {
        completion.luasnip,
        formatting.prettier,
        diagnostics.eslint.with({
            name = "eslint_d",
            meta = {
                url = "https://github.com/mantoni/eslint_d.js/",
                description = "Like ESLint, but faster.",
                notes = {
                    "Once spawned, the server will continue to run in the background. This is normal and not related to null-ls. You can stop it by running `eslint_d stop` from the command line.",
                },
            },
            command = "eslint_d",
        }),
        formatting.clang_format,
        formatting.stylua,
    },
})
