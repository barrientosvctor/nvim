return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    cmd = { "NvimTreeToggle", "NvimTreeRefresh", "NvimTreeOpen", "NvimTreeClose" },
    keys = {
        {
            "<Leader>fv",
            function()
                require("nvim-tree.api").tree.toggle({ find_file = true, update_root = true })
            end,
            mode = "n",
            desc = "Open NvimTree."
        },
    },
    opts = {},
}
