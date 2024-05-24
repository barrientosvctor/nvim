return {
    "ibhagwan/fzf-lua",
    lazy = true,
    cmd = "FzfLua",
    keys = {
        {
            "<leader><leader>",
            function ()
                require("fzf-lua").files()
            end,
            mode = "n",
            desc = "Search and open files."
        },
        {
            "<leader>fb",
            function()
                require("fzf-lua").buffers()
            end,
            desc = "Show the open buffers."
        },
        {
            "<leader>fg",
            function()
                require("fzf-lua").grep()
            end,
            desc = "Search a pattern in entire project."
        },
        {
            "<leader>fs",
            function()
                require("fzf-lua").git_status()
            end,
            desc = "Show the untaged and staged git files."
        },
        {
            "<leader>fl",
            function()
                require("fzf-lua").builtin()
            end
        }
    },
    opts = {}
}
