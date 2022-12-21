local status, packer = pcall(require, "packer")
if not status then
    print("Packer is not installed.")
    return
end

return packer.startup(function(use)
    use "wbthomason/packer.nvim"

    -- Customization
    use "nvim-lualine/lualine.nvim"
    use {
	"svrana/neosolarized.nvim",
	requires = { "tjdevries/colorbuddy.nvim" },
    }

    -- LSP
    use "nvim-treesitter/nvim-treesitter"
    use {
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim"
    }
    use "glepnir/lspsaga.nvim"

    -- Cmp
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

    -- Tree
    use {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	requires = {
	    "nvim-lua/plenary.nvim",
	    "nvim-telescope/telescope-file-browser.nvim"
	}
    }

    -- Utils
    use "jiangmiao/auto-pairs"
    use "numToStr/Comment.nvim"
    use "gpanders/editorconfig.nvim"
end)
