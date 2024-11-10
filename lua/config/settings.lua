-- disable some neovim providers to improve performance
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

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
vim.opt.ruler = false

-- Spaces / indents
vim.opt.sw = 4
vim.opt.ai = true -- Auto indent
vim.opt.si = true -- Smart indent
vim.opt.breakindent = true

-- Highlights
vim.opt.cursorline = true

-- Search
vim.opt.hlsearch = true
vim.opt.showmatch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wildignore:append { "*/tmp/*", "*/temp/*", "*/node_modules/*", "*/.venv/*", "*/__pycache__/*", ".DS_Store", ".env", "*/coverage/*", "*/build/*", "*/dist/*", "*/.vscode/*", "*/.git/*", "*.o", "*.obj", "*.pyc", "*.log" }

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
