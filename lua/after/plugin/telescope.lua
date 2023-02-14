local status, telescope = pcall(require, "telescope")
if not status then return end

local actions = require("telescope.actions")
local fb_actions = telescope.extensions.file_browser.actions

telescope.setup({
    defaults = {
        file_ignore_patterns = { ".git", "node_modules" },
        mappings = {
            n = {
                ["q"] = actions.close
            }
        }
    },
    extensions = {
        file_browser = {
            theme = "dropdown",
            -- Use Telescope"s file browser instead netrw
            hijack_netrw = true,
            path = "%:p:h",
            cwd = vim.fn.expand("%:p:h"),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = "normal",
            layout_config = {
                height = 40
            },
            mappings = {
                -- Insert mode mappings
                ["i"] = {
                    ["<C-w>"] = function() vim.cmd("normal vbd") end,
                },
                -- Normal mode mappings
                ["n"] = {
                    ["N"] = fb_actions.create,
                    ["r"] = fb_actions.remove,
                    ["R"] = fb_actions.rename,
                    ["sa"] = fb_actions.select_all,
                    ["m"] = fb_actions.move,
                    ["h"] = fb_actions.goto_parent_dir
                }
            }
        }
    },
})

telescope.load_extension("file_browser")
