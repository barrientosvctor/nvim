return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = true,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        {
            "<Leader>fv",
            "<Cmd>NvimTreeToggle<CR>",
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
