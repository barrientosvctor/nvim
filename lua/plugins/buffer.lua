return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    lazy = true,
    event = "UIEnter",
    config = function()
        require "bufferline".setup({
            options = {
                mode = "buffers", -- set to "tabs" to only show tabpages instead
                style_preset = require "bufferline".style_preset.default, -- or bufferline.style_preset.minimal,
                themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
                numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
                indicator = {
                    icon = '▎', -- this should be omitted if indicator style is not 'icon'
                    style = 'icon',
                },
                diagnostics = "nvim_lsp",
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    local s = " "
                    for e, n in pairs(diagnostics_dict) do
                        local sym = e == "error" and " "
                            or (e == "warning" and " " or "")
                        s = s .. n .. sym
                    end
                    return s
                end,
                buffer_close_icon = '󰅖',
                modified_icon = '●',
                close_icon = '',
                left_trunc_marker = '',
                right_trunc_marker = '',
                max_name_length = 18,
                max_prefix_length = 15,   -- prefix used when a buffer is de-duplicated
                truncate_names = true,    -- whether or not tab names should be truncated
                tab_size = 18,
                color_icons = true,       -- whether or not to add the filetype icon highlights
                show_buffer_icons = true, -- disable filetype icons for buffers
                show_buffer_close_icons = true,
                show_close_icon = true,
                show_tab_indicators = true,
                show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
                persist_buffer_sort = true,   -- whether or not custom sorted buffers should persist
                separator_style = "slant",    -- | "slope" | "thick" | "thin" | { 'any', 'any' },
                always_show_bufferline = true,
                hover = {
                    enabled = true,
                    delay = 200,
                    reveal = { 'close' }
                },
            }
        })
    end
}
