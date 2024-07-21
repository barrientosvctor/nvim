vim.g.loaded_gzip = 1 -- disable gzip
vim.g.loaded_man = 1 -- disable man
vim.g.loaded_remote_plugins = 1 -- disable rplugin
vim.g.loaded_shada_plugin = 1 -- disable shada
vim.g.loaded_spellfile_plugin = 1 -- disable spellfile
vim.g.loaded_tarPlugin = 1 -- disable tarPlugin
vim.g.loaded_2html_plugin = 1 -- disable tohtml
vim.g.loaded_tutor_mode_plugin = 1 -- disable tutor
vim.g.loaded_zipPlugin = 1 -- disable zipPlugin

if vim.loader then
    vim.loader.enable()
end

vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Basic config
vim.opt.background = "dark"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.wrap = true
vim.opt.completeopt:append { "menu", "menuone", "noinsert", "noselect" }
vim.opt.showmode = true
vim.opt.showcmd = false
vim.opt.colorcolumn = "80"

-- Spaces / indents
vim.opt.sw = 4
vim.opt.ai = true -- Auto indent
vim.opt.si = true -- Smart indent
vim.opt.breakindent = true

-- Highlights
vim.opt.cursorline = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Search
vim.opt.hlsearch = true
vim.opt.showmatch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Encoding
vim.opt.fileencoding = "utf-8"
vim.opt.encoding = "utf-8"

-- Backup
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true -- undodir = ~/.local/state/nvim/undo

-- Other
vim.opt.backspace:append { "indent", "eol", "start" }
vim.opt.hidden = true
vim.opt.scrolloff = 5
vim.opt.clipboard:append { "unnamed", "unnamedplus" }

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('dotfiles-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
