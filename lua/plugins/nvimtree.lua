return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = true,
    cmd = { "NvimTreeToggle", "NvimTreeRefresh", "NvimTreeOpen", "NvimTreeClose" },
    keys = {
        {
            "<Leader>fv",
            function()
                require"nvim-tree.api".tree.toggle({ find_file = true, update_root = true })
            end,
            mode = "n",
            desc = "Open NvimTree"
        },
    },
    opts = {
        disable_netrw = true,
        hijack_netrw  = true,
        sort = {
            sorter = "name",
        },
        view = {
            width = 30,
            side = "right",
            preserve_window_proportions = true,
            number = false,
            relativenumber = false,
        },
        renderer = {
            add_trailing = false,
            group_empty = true,
            indent_markers = {
                enable = true,
                inline_arrows = true,
            },
            icons = {
                show = {
                    file = false,
                    folder = false,
                    folder_arrow = false,
                    git = false,
                    modified = false,
                    hidden = false,
                    diagnostics = false,
                    bookmarks = false,
                },
                web_devicons = {
                    file = {
                        enable = true,
                        color = true,
                    },
                    folder = {
                        enable = true,
                        color = false,
                    },
                },
            },
        },
        git = {
            enable = true,
        },
        filters = {
            dotfiles = true,
            git_ignored = true,
        },
        actions = {
            open_file = {
                quit_on_open = true,
            },
        },
        diagnostics = {
            enable = true,
            show_on_dirs = true,
        },
    },
}
