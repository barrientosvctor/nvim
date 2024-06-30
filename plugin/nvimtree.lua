-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
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
})

vim.keymap.set("n", "<leader>ff", ":NvimTreeToggle<cr>")
vim.keymap.set("n", "<leader>fr", ":NvimTreeRefresh<cr>")
