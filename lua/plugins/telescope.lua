local key = require "utils.KeymapBuilder"

return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require "telescope".setup({
            defaults = {
                layout_strategy = "horizontal",
                layout_config = {
                    height = 0.70,
                    width = 0.70
                }
            },
            pickers = {},
            extensions = {},

        })

        local builtin = require "telescope.builtin"
        key.map("n", "<leader>ff", builtin.find_files, "[F]ind [F]iles via telescope")
        key.map("n", "<leader>fg", builtin.live_grep, "Uses live [G]rep via telescope")
        key.map("n", "<leader>fb", builtin.buffers, "Lists open [B]uffers via telescope")
        key.map("n", "<leader>fh", builtin.help_tags, "Search into all nvim [H]elp documentation via telescope")
    end
}
