return {
        "craftzdog/solarized-osaka.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = true
        },
    config = function()
        return vim.cmd.colorscheme "solarized-osaka"
    end
}
