require("config.plugins")
require("config.keymaps")
require("after.plugin.editorconfig")

-- LSP
require("after.plugin.mason")
require("after.plugin.masonLspConfig")
require("after.plugin.lspconfig")
require("after.plugin.lspsaga")

-- Syntax highlighting
require("after.plugin.treesitter")

-- Autocomplete
require("after.plugin.cmp")

-- Tree
require("after.plugin.telescope")

-- UI
require("after.plugin.icons")
require("after.plugin.lualine")
