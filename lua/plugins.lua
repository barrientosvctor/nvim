local status, packer = pcall(require, "packer")
if not status then
    print("Packer is not installed.")
    return
end

return packer.startup(function(use)
    use "wbthomason/packer.nvim"

    -- Customization
    use "LunarVim/horizon.nvim"
    use "Shatur/neovim-ayu"
    use "nvim-lualine/lualine.nvim"

    -- LSP
    use "nvim-treesitter/nvim-treesitter"
    use {
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim"
    }
    use "glepnir/lspsaga.nvim"

    -- Cmp
    use {
	"hrsh7th/cmp-nvim-lsp",
	requires = {
	    "hrsh7th/nvim-cmp",
	    "hrsh7th/cmp-path",
	    "L3MON4D3/LuaSnip",
	    "saadparwaiz1/cmp_luasnip"
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
    use "windwp/nvim-autopairs"
    use "windwp/nvim-ts-autotag"
    use "numToStr/Comment.nvim"
    use "gpanders/editorconfig.nvim"
end)
