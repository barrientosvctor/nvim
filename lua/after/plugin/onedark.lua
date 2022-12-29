local status, onedark = pcall(require, "onedarkpro")
if not status then return end

onedark.setup({
    colors = {},
    highlights = {},
    filetypes = {},
    plugins = {},
    options = {
        bold = false,
        italic = true,
        underline = true,
        undercurl = true,

        cursorline = true,
        transparency = false,
        terminal_colors = true,
        highlight_inactive_windows = false,
    }
})

vim.cmd("colorscheme onedark")
