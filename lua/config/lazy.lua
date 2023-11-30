local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

require("lazy").setup("plugins")

--return packer.startup(function(use)
--    use "wbthomason/packer.nvim"
--
--    -- Improve nvim speed
--    use "lewis6991/impatient.nvim"
--
--    -- Customization
--    use "nvim-tree/nvim-web-devicons"
--    use "nvim-lualine/lualine.nvim"
--    use "Shatur/neovim-ayu"
--
--    -- LSP
--    use "neovim/nvim-lspconfig"
--    use "williamboman/mason.nvim"
--    use "williamboman/mason-lspconfig.nvim"
--    use "glepnir/lspsaga.nvim"
--    use "jose-elias-alvarez/null-ls.nvim"
--
--    -- Autocomplete
--    use "hrsh7th/cmp-nvim-lsp"
--    use "hrsh7th/nvim-cmp"
--
--    -- Snippets --
--    use "L3MON4D3/LuaSnip"
--    use "saadparwaiz1/cmp_luasnip"
--    use "rafamadriz/friendly-snippets"
--
--    -- Syntax
--    use {
--        "nvim-treesitter/nvim-treesitter",
--        run = function()
--            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
--            ts_update()
--        end,
--    }
--
--    -- Tree
--    use {
--        "nvim-telescope/telescope.nvim", tag = "0.1.1",
--        requires = { { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim" } }
--    }
--
--    -- Utils
--    use "gpanders/editorconfig.nvim"
--    use "windwp/nvim-ts-autotag"
--    use "windwp/nvim-autopairs"
--    use "numToStr/Comment.nvim"
--    use "lewis6991/gitsigns.nvim"
--    use "akinsho/bufferline.nvim"
--end)
