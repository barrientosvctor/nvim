return {
    {
        "barrientosvctor/abyss.nvim",
        enabled = true,
        dev = true,
        priority = 1000,
        opts = {},
    },
    {
        "ellisonleao/gruvbox.nvim",
        enabled = false,
        priority = 1000,
        opts = {
            contrast = "hard",
            italic = {
                strings = false
            },
        },
        config = function (_, opts)
            require("gruvbox").setup(opts)
            vim.cmd.colorscheme("gruvbox")
        end,
    },
    {
        "Mofiqul/vscode.nvim",
        enabled = false,
        priority = 1000,
        opts = {},
        config = function (_, opts)
            require("vscode").setup(opts)
            vim.cmd.colorscheme("vscode")
        end,
    },
}
