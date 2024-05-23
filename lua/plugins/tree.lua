return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = true,
    event = "UIEnter",
    config = function()
        require("nvim-tree").setup {}
    end,
}
