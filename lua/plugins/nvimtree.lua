return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    cmd = { "NvimTreeToggle", "NvimTreeRefresh", "NvimTreeOpen", "NvimTreeClose" },
    keys = {
        {
            "<Leader>fe",
            function()
                require("nvim-tree.api").tree.toggle({ find_file = true, update_root = true })
            end,
            mode = "n",
            desc = "Open NvimTree."
        },
    },
    opts = {
        disable_netrw = true,
        hijack_netrw  = true,
        view          = {
            width = 30,
            side = "right",
            preserve_window_proportions = true,
        },
        renderer      = {
            add_trailing = true,
            group_empty = true,
            indent_markers = {
                enable = true,
                inline_arrows = true,
            },
        },
        git           = {
            enable = false,
        },
        filters       = {
            dotfiles = true,
            git_ignored = true,
        },
        actions       = {
            open_file = {
                quit_on_open = true,
            },
        },
    },
}
