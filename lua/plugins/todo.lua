local key = require("utils.keymap")

return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    config = function()
        require "todo-comments".setup({})
        key.map("n", "<leader>ft", ":TodoTelescope<cr>", "View all [T]ags via telescope")
    end
}
