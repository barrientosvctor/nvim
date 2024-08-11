local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
    defaults = { lazy = true },
    dev = {
        path = vim.fn.expand "~/projects/nvim",
        pattern = { "barrientosvctor" }
    },
    performance = {
        cache = { enabled = true },
        -- To see all available rtp plugins, use :Lazy profile in rtp plugins section
        rtp = {
            disabled_plugins = {
                "matchit",
                "matchparen",
                "netrwPlugin",
                "gzip",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
                "spellfile",
                "shada",
                "man",
                "rplugin",
                "osc52"
            }
        }
    },
})
