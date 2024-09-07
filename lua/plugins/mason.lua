return {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    opts = {},
    config = function(_, opts)
        require("mason").setup(opts)

        local ensure_installed = {
            "typescript-language-server",
            "lua-language-server",
            "clangd",
            "html-lsp",
            "css-lsp",
            "cmake-language-server",
        }

        local registry = require("mason-registry")

        for _, package in ipairs(ensure_installed) do
            if not registry.is_installed(package) then
                registry.get_package(package):install()
            end
        end
    end
}
