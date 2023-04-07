local status, packer = pcall(require, "packer")

function install_packer()
    print("Packer.nvim is installing...")

    local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    vim.fn.system {
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        packer_path,
    }

    print("Packer.nvim were installed, restart their Neovim.")
end

if (not status) then
    install_packer()
    return
end

return packer.startup(function(use)
    use "wbthomason/packer.nvim"

    -- Improve nvim speed
    use "lewis6991/impatient.nvim"

    -- Customization
    use "tjdevries/colorbuddy.nvim"
    use "nvim-tree/nvim-web-devicons"
    use "svrana/neosolarized.nvim"
    use "nvim-lualine/lualine.nvim"

    -- LSP
    use "neovim/nvim-lspconfig"
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "glepnir/lspsaga.nvim"

    -- Autocomplete
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/nvim-cmp"

    -- Snippets --
    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"
    use "rafamadriz/friendly-snippets"

    -- Syntax
    use {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    }

    -- Tree
    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.1",
        requires = { {"nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim"} }
    }

    -- Utils
    use "gpanders/editorconfig.nvim"
    use "windwp/nvim-ts-autotag"
    use "windwp/nvim-autopairs"
end)
