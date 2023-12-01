return {
    "Shatur/neovim-ayu",
    lazy = false,
    priority = 1000,
    opts = {
        mirage = false,
    },
    config = function()
        return vim.cmd.colorscheme "ayu-dark"
    end
}
