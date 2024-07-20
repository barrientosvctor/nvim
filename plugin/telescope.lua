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
        }
    },
})

require "telescope".load_extension "file_browser"

vim.keymap.set("n", "<Leader>fg", "<Cmd>Telescope live_grep<CR>")
vim.keymap.set("n", "<Leader>ff", "<Cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<Leader>fb", "<Cmd>Telescope buffers<CR>")
vim.keymap.set("n", "<Leader>fh", "<Cmd>Telescope help_tags<CR>")
vim.keymap.set("n", "<Leader>fv", "<Cmd>Telescope file_browser<CR>")
vim.keymap.set("n", "<Leader>fc", "<Cmd>Telescope builtin<CR>")
