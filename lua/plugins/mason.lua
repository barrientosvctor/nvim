return {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    dependencies = {
        { "williamboman/mason-lspconfig.nvim", opts = {} },
    },
}
