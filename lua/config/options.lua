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

local options = {
    -- Basic config
    background = "dark",
    number = true,
    relativenumber = true,
    termguicolors = true,
    wrap = false,
    laststatus = 3,
    completeopt = "menu,menuone,noinsert,noselect",
    showmode = true,
    showcmd = false,
    colorcolumn = "80",

    -- Spaces / indents
    sw = 4,    -- Spaces
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
    undofile = true, -- undodir = ~/.local/state/nvim/undo/

    -- Other
    guicursor = "n-i-v-c:block",
    backspace = "indent,eol,start",
    hidden = true,
    scrolloff = 5,

    -- Terminal
    shell = chooseShell()
}

local global = {
    mapleader = ",",
    editorconfig = true
}

for key, value in pairs(options) do
    vim.opt[key] = value
end

for key, value in pairs(global) do
    vim.g[key] = value
end

if vim.fn.has("win32") == 1 then
    vim.opt.clipboard:prepend { "unnamed", "unnamedplus" }
elseif vim.fn.has("unix") == 1 then
    vim.opt.clipboard:append { "unnamedplus" }
end

-- disable some neovim providers to improve performance
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
