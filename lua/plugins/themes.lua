---@type boolean
local enable_abyss = false

return {
    {
        "barrientosvctor/abyss.nvim",
        dev = true,
        lazy = false,
        enabled = enable_abyss,
        priority = 1000,
        opts = {}
    },
    {
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            contrast = "hard"
        },
        config = function(_, opts)
            require "gruvbox".setup(opts)
            vim.cmd.colorscheme "gruvbox"
        end
    }
}
