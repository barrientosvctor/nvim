vim.g.loaded_gzip = 1 -- disable gzip
vim.g.loaded_man = 1 -- disable man
vim.g.loaded_remote_plugins = 1 -- disable rplugin
vim.g.loaded_shada_plugin = 1 -- disable shada
vim.g.loaded_spellfile_plugin = 1 -- disable spellfile
vim.g.loaded_tarPlugin = 1 -- disable tarPlugin
vim.g.loaded_2html_plugin = 1 -- disable tohtml
vim.g.loaded_tutor_mode_plugin = 1 -- disable tutor
-- vim.g.loaded_zipPlugin = 1 -- disable zipPlugin

if vim.loader then
    vim.loader.enable()
end

local function chooseShell()
    if vim.fn.has "win32" == 1 then
        if vim.fn.executable "pwsh" == 1 then
            return "pwsh.exe"
        elseif vim.fn.executable "powershell" == 1 then
            return "powershell.exe"
        else
            return "cmd.exe"
        end
    else
        if vim.fn.has "unix" == 1 or vim.fn.has "macos" == 1 then
            return "bash"
        end
    end
end

vim.g.mapleader = ","
vim.g.maplocalleader = ","
vim.g.editorconfig = true

-- Basic config
vim.opt.background = "dark"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.laststatus = 3
vim.opt.completeopt = "menu,menuone,noinsert,noselect"
vim.opt.showmode = true
vim.opt.showcmd = false
vim.opt.colorcolumn = "80"

-- Spaces / indents
vim.opt.sw = 4
vim.opt.cindent = true
vim.opt.ai = true -- Auto indent
vim.opt.si = true -- Smart indent
vim.opt.breakindent = true

-- Highlights
vim.opt.cursorline = true
vim.opt.winblend = 0
vim.opt.wildoptions = "pum"
vim.opt.pumblend = 5

-- Search
vim.opt.hlsearch = true
vim.opt.showmatch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true

-- Encoding
vim.opt.fileencoding = "utf-8"
vim.opt.encoding = "utf-8"

-- Backup
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true -- undodir = ~/.local/state/nvim/undo

-- Other
vim.opt.guicursor = "n-i-v-c:block"
vim.opt.backspace = "indent,eol,start"
vim.opt.hidden = true
vim.opt.scrolloff = 5

-- Terminal
vim.opt.shell = chooseShell()

if vim.fn.has("win32") == 1 then
    vim.opt.clipboard:prepend { "unnamed", "unnamedplus" }
elseif vim.fn.has("unix") == 1 then
    vim.opt.clipboard:append { "unnamedplus" }
end

require("keymaps")
