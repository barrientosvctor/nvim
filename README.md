# Victor's Neovim configuration

## Pre-requeriments
* [Neovim](https://neovim.io/) >= 0.8 version
* [Python](https://www.python.org/downloads/) >= 3.10.5 version
* [Node.js](https://nodejs.org/en/)
* [Git](https://git-scm.com/)
* [Chocolatey](https://chocolatey.org/) (Only for Windows users)
* [Homebrew](https://brew.sh/) (Only for Unix users)
* mingw: This is necessary for [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter). [Unix installation](https://formulae.brew.sh/formula/mingw-w64#default) / [Windows installation](https://community.chocolatey.org/packages/mingw)

## Neovim config

### Plugins

**Note:** Before the plugins installation, you need install [packer.nvim](https://github.com/wbthomason/packer.nvim).

* [neosolarized.nvim](https://github.com/svrana/neosolarized.nvim) | [colorbuddy.nvim](https://github.com/tjdevries/colorbuddy.nvim)
* [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - A collection of configurations for Neovim's built-in LSP.
* [mason.nvim](https://github.com/williamboman/mason.nvim) - LSP Installer.
    * It requires [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim)
* [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - A completion engine plugin for neovim written in Lua. Completion sources are installed from external repositories and "sourced".
* [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) - A [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) source for neovim's built-in language server client.
* [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - A blazing fast and easy to configure Neovim statusline written in Lua.
* [LuaSnip](https://github.com/L3MON4D3/LuaSnip) - These plugins allows create and use custom snippets.
    * These plugins requires [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) and [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
* [lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim) - LSP UI.
* [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - telescope.nvim is a highly extendable fuzzy finder over lists.
    * It requires [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) and [telescope-file-browser.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim).
* [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) - Filetype icons for Neovim.
* [editorconfig.nvim](https://github.com/gpanders/editorconfig.nvim) - Editorconfig allows set defaults rules for specifics file extensions or global files.
* [impatient.nvim](https://github.com/lewis6991/impatient.nvim) - Improve startup time in Neovim.
* [nvim-autotag](https://github.com/windwp/nvim-ts-autotag) | [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Automate brackets and tag.

## Neovim setup

1. Install [packer.nvim](https://github.com/wbthomason/packer.nvim)

2. Install plugins with `:PackerInstall`

3. Type this commands: `:LspInstall tsserver pyright clangd`

Enjoy!
