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
        "nordtheme/vim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "nord"
        end
    },
}
