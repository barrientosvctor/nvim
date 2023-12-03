return {
    "Shatur/neovim-ayu",
    lazy = false,
    opts = {
        mirage = false,
    },
    config = function()
        return vim.cmd.colorscheme "ayu-dark"
    end
}
