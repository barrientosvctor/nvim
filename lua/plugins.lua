local status, packer = pcall(require, "packer")
if not status then
    print("Packer is not installed.")
    return
end

return packer.startup(function(use)
    use "wbthomason/packer.nvim"

    -- Customization
    use "nvim-lualine/lualine.nvim"
    use "olimorris/onedarkpro.nvim"

    -- LSP
    use "nvim-treesitter/nvim-treesitter"
    use {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim"
    }

    use {
        "hrsh7th/cmp-nvim-lsp",
        requires = {
			"hrsh7th/nvim-cmp",
	    	"hrsh7th/cmp-path",
	    	"L3MON4D3/LuaSnip",
	    	"saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets"
        }
    }
    use "glepnir/lspsaga.nvim"

    -- Tree
    use {
	    "nvim-telescope/telescope.nvim",
	    branch = "0.1.x",
	    requires = {
	        "nvim-lua/plenary.nvim",
	        "nvim-telescope/telescope-file-browser.nvim"
	    }
    }

    use "gpanders/editorconfig.nvim"
    use "jiangmiao/auto-pairs"
    use "numToStr/Comment.nvim"
end)
