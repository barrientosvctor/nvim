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

    -- Backup
    swapfile = false,
    backup = false,
    undofile = true,
    undodir = "undodir", -- folder name where is located undo files into nvim folder

    -- Other
    guicursor = "n-i-v-c:block",
    backspace = "indent,eol,start",
    hidden = true,
    scrolloff = 10,
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

if vim.fn.has("win32") == 1 then
    vim.opt.clipboard:prepend { "unnamed", "unnamedplus" }
elseif vim.fn.has("unix") == 1 then
    vim.opt.clipboard:append { "unnamedplus" }
end

require("config.requires")
