local telescope_file_browser_actions = require "telescope._extensions.file_browser.actions"

require "telescope".setup({
    defaults = {
        layout_strategy = "horizontal",
        layout_config = {
            height = 0.70,
            width = 0.80,
            preview_cutoff = 120,
        }
    },
    pickers = {},
    extensions = {
        file_browser = {
            theme = "dropdown",
            -- Uses Telescope's file browser instead netrw
            hijack_netrw = true,
            path = "%:p:h",
            cwd = vim.fn.expand("%:p:h"),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = "normal",
            mappings = {
                ["n"] = {
                    ["e"] = telescope_file_browser_actions.open,
                    ["c"] = telescope_file_browser_actions.create,
                    ["R"] = telescope_file_browser_actions.remove,
                    ["r"] = telescope_file_browser_actions.rename,
                    ["<C-a>"] = telescope_file_browser_actions.select_all,
                    ["m"] = telescope_file_browser_actions.move,
                    ["l"] = telescope_file_browser_actions.goto_parent_dir,
                    ["C"] = telescope_file_browser_actions.copy,
                    ["od"] = telescope_file_browser_actions.open_dir,
                    ["h"] = telescope_file_browser_actions.toggle_hidden,
                    ["ta"] = telescope_file_browser_actions.toggle_all,
                    ["L"] = telescope_file_browser_actions.goto_home_dir,
                    ["tb"] = telescope_file_browser_actions.toggle_browser,
                    ["?"] = "which_key",
                },
                ["i"] = {
                    ["<C-e>"] = telescope_file_browser_actions.open,
                    ["<C-c>"] = telescope_file_browser_actions.create,
                    ["<C-t>"] = telescope_file_browser_actions.remove,
                    ["<C-r>"] = telescope_file_browser_actions.rename,
                    ["?"] = "which_key",
                },
            }
        }
    },
})

require "telescope".load_extension "file_browser"

vim.keymap.set("n", "<leader>fg", function()
    require "telescope.builtin".live_grep()
end)

vim.keymap.set("n", "<leader>ff", function()
    require "telescope.builtin".find_files()
end)

vim.keymap.set("n", "<leader>fb", function()
    require "telescope.builtin".buffers()
end)

vim.keymap.set("n", "<leader>fh", function()
    require "telescope.builtin".help_tags()
end)

vim.keymap.set("n", "<leader>fv", function()
    require "telescope".extensions.file_browser.file_browser()
end)
