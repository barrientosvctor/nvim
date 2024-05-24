return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = true,
    cmd = "NvimTreeToggle",
    keys = {
        {
            "<leader>zz",
            function ()
                vim.cmd("NvimTreeToggle")
            end,
            desc = "Open the tree files."
        },
        {
            "<leader>zr",
            function()
                vim.cmd("NvimTreeRefresh")
            end,
            desc = "Refresh the tree files."
        }
    },
    opts = {
        disable_netrw = true,
        hijack_netrw = true,
        hijack_cursor = true,
        hijack_unnamed_buffer_when_opening = false,
        sync_root_with_cwd = true,
        update_focused_file = {
            enable = true,
            update_root = false,
        },
        view = {
            adaptive_size = false,
            side = "right",
            width = 30,
            preserve_window_proportions = true,
        },
        git = {
            enable = true,
            ignore = true,
        },
        actions = {
            open_file = {
                resize_window = true,
            },
        },
    }
}
