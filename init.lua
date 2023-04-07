local options = {
    -- Basic config
    background = "dark",
    number = true,
    relativenumber = true,
    termguicolors = true,
    wrap = false,
    laststatus = 3,
    completeopt = "menu,menuone,noselect",
    showmode = false,
    showcmd = false,
    colorcolumn = "80",

    -- Spaces / indents
    sw = 4, -- Spaces
    cindent = true,
    ai = true, -- Auto indent
    si = true, -- Smart indent
    breakindent = true,

    -- Highlights
    cursorline = true,
    winblend = 0,
    wildoptions = "pum",
    pumblend = 5,

    -- Search
    hlsearch = true,
    showmatch = true,
    incsearch = true,
    ignorecase = true,

    -- Encoding
    fileencoding = "utf-8",
    encoding = "utf-8",

    -- Other
    guicursor = "n-i-v-c:block",
    backspace = "indent,eol,start",
    swapfile = false,
    backup = false,
    hidden = true,
    scrolloff = 10,
    undofile = true,
}

local global = {
    mapleader = ","
}

-- vim.opt loop
for key, value in pairs(options) do
    vim.opt[key] = value
end

-- vim.g loop
for key, value in pairs(global) do
    vim.g[key] = value
end

if vim.fn.has("win32") then
    vim.opt.clipboard:prepend { "unnamed", "unnamedplus" }
    vim.opt.undodir = "$env:LOCALAPPDATA/nvim/undodir"
end

if vim.fn.has("macunix") then
    vim.opt.clipboard:append { "unnamedplus" }
    vim.opt.undodir = "$HOME/.config/nvim/undodir"
end

require("config.requires")
