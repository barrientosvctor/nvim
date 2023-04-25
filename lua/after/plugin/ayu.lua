local status, ayu = pcall(require, "ayu")
if (not status) then return end

ayu.setup({
    mirage = false,
    overrides = {},
})

vim.cmd.colorscheme("ayu-dark")
