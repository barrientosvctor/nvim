local status, packer = pcall(require, "packer")
if not status then
    print("Packer is not installed.")
    return
end

return packer.startup(function(use)
    use "wbthomason/packer.nvim"
    use "lewis6991/impatient.nvim"

    -- UI
    use "nvim-tree/nvim-web-devicons"
    use "nvim-lualine/lualine.nvim"

    -- LSP
    use "neovim/nvim-lspconfig"
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "glepnir/lspsaga.nvim"

    -- Syntax highlighting
    use "nvim-treesitter/nvim-treesitter"

    -- Autocomplete
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/nvim-cmp"

    -- Snippets --
    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"
    use "rafamadriz/friendly-snippets"

    -- Tree
    use {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        requires = {
            "nvim-lua/plenary.nvim",
	        "nvim-telescope/telescope-file-browser.nvim"
        },
    }

    use "gpanders/editorconfig.nvim"
end)
