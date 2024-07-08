-- Disable nvim built-in plugins
vim.g.loaded_gzip = 1 -- disable gzip
vim.g.loaded_man = 1 -- disable man
vim.g.loaded_remote_plugins = 1 -- disable rplugin
vim.g.loaded_shada_plugin = 1 -- disable shada
vim.g.loaded_spellfile_plugin = 1 -- disable spellfile
vim.g.loaded_tarPlugin = 1 -- disable tarPlugin
vim.g.loaded_2html_plugin = 1 -- disable tohtml
vim.g.loaded_tutor_mode_plugin = 1 -- disable tutor
vim.g.loaded_zipPlugin = 1 -- disable zipPlugin

-- Enable loader to increase performance
vim.loader.enable()

-- Neovim options
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
vim.opt.cindent = true
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

-- Terminal
if vim.fn.has "win32" == 1 then
    if vim.fn.executable "powershell" == 1 then
        vim.opt.shell = vim.fn.exepath "powershell"
        vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
        vim.opt.shellxquote = ""
    else
        vim.opt.shell = vim.fn.exepath "cmd"
        vim.opt.shellcmdflag = "/s /c"
        vim.opt.shellxquote = '"'
    end
end

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('dotfiles-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Set local settings for terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", {}),
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.scrolloff = 0

    vim.bo.filetype = "terminal"
  end,
})

-- Keymaps
-- Split windows
vim.keymap.set("n", "<Leader>ty", "<Cmd>vsp<CR><C-w>l")
vim.keymap.set("n", "<Leader>tx", "<Cmd>split<CR><C-w>j")

-- Open terminal
vim.keymap.set("n", "<Leader>th", function()
    vim.cmd.new()
    vim.cmd.wincmd "J"
    vim.api.nvim_win_set_height(0, 12)
    vim.wo.winfixheight = true
    vim.cmd.term()
end)
vim.keymap.set("n", "<Leader>tv", function()
    vim.cmd.new()
    vim.cmd.wincmd "L"
    vim.api.nvim_win_set_width(0, 60)
    vim.wo.winfixwidth = true
    vim.cmd.term()
end)

-- Move between windows
vim.keymap.set("", "<C-h>", "<C-w>h")
vim.keymap.set("", "<C-j>", "<C-w>j")
vim.keymap.set("", "<C-k>", "<C-w>k")
vim.keymap.set("", "<C-l>", "<C-w>l")

-- Resize windows
vim.keymap.set("n", "t<left>", "<C-w>>")
vim.keymap.set("n", "t<right>", "<C-w><")
vim.keymap.set("n", "t<up>", "<C-w>+")
vim.keymap.set("n", "t<down>", "<C-w>-")

-- Tabs
vim.keymap.set("n", "<Leader>te", "<Cmd>tabedit<CR>")
vim.keymap.set("n", "<Leader>tp", "<Cmd>tabprevious<CR>")
vim.keymap.set("n", "<Leader>tn", "<Cmd>tabnext<CR>")

-- Terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l")

-- Delete buffer
vim.keymap.set("n", "<Leader>bd", "<Cmd>bdelete<CR>")

-- Inspect treesitter elements
vim.keymap.set("n", "<Leader>ww", "<Cmd>Inspect<CR>")
vim.keymap.set("n", "<Leader>wq", "<Cmd>InspectTree<CR>")

-- Move line
vim.keymap.set("n", "<C-S-Up>", "<Cmd>move -2<CR>")
vim.keymap.set("n", "<C-S-Down>", "<Cmd>move +1<CR>")

-- Source nvimrc file
vim.keymap.set("n", "<Leader>so", function()
    -- To reload the file on the current buffer, type %
    local target_file = vim.fn.input("File to refresh: ", vim.fn.stdpath("config") .. "/", "file")
    vim.cmd.source(target_file)
end)

-- Clear search highlights on pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Vim Plug packages
local Plug = vim.fn["plug#"]

vim.call "plug#begin"
-- Colors
Plug("ellisonleao/gruvbox.nvim")
Plug("~/projects/nvim/abyss.nvim")

-- Syntax highlighting
Plug("nvim-treesitter/nvim-treesitter", { ["tag"] = "v0.9.2", ["do"] = ":TSUpdate" })

-- LSP
Plug("neovim/nvim-lspconfig", { ["tag"] = "v0.1.8" })
Plug("williamboman/mason.nvim", { ["tag"] = "v1.10.0" })
Plug("williamboman/mason-lspconfig.nvim", { ["tag"] = "v1.29.0" })
Plug("hrsh7th/cmp-nvim-lsp", { ["commit"] = "39e2eda" })

-- Completion
Plug("hrsh7th/nvim-cmp", { ["commit"] = "a110e12" })

-- Snippets
Plug("L3MON4D3/LuaSnip", { ["tag"] = "v2.3.0" })
Plug("saadparwaiz1/cmp_luasnip", { ["commit"] = "05a9ab2" })
Plug("rafamadriz/friendly-snippets")

-- Fuzzy finder / File explorer
Plug("nvim-lua/plenary.nvim")
Plug("nvim-telescope/telescope.nvim", { ["tag"] = "0.1.8" })
Plug("nvim-telescope/telescope-file-browser.nvim", { ["commit"] = "a7ab9a9" })
Plug("nvim-telescope/telescope-fzf-native.nvim", { ["commit"] = "cf48d4d", ["do"] = function()
    if vim.fn.executable "make" == 1 then
        return "make"
    elseif vim.fn.executable "cmake" == 1 then
        return "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release -G Ninja && cmake --build build --config Release"
    else
        return ""
    end
end
})

-- Other
Plug("echasnovski/mini.pairs", { ["branch"] = "stable" })
Plug("lewis6991/gitsigns.nvim", { ["tag"] = "v0.9.0" })
vim.call "plug#end"

-- Plugins configuration
require('mini.pairs').setup()
require('gitsigns').setup()

require("gruvbox").setup {
    contrast = "hard",
    italic = {
        strings = false
    }
}

require("nvim-treesitter.configs").setup {
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = { "c", "cpp", "lua", "python", "vimdoc", "javascript", "typescript", "markdown" },

    -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
    auto_install = false,

    highlight = { enable = true },
    indent = { enable = true },
}

-- Modify every time you want to include some lsp to mason's automatic installation
-- To see the setup for any lsp look this: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = {
    lua_ls = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
            telemetry = { enable = false },
        },
    },
    clangd = {},
    tsserver = {},
    pyright = {
        python = {
            analysis = {
                autoSearchPaths = false,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true
            },
        }
    },
    cmake = {},
}

local on_attach = function(_, bufnr)
    vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, { buffer = bufnr })
    vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, { buffer = bufnr })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
    vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help, { buffer = bufnr })
    vim.keymap.set('n', '<Leader>dn', vim.diagnostic.goto_next, { buffer = bufnr })
    vim.keymap.set('n', '<Leader>dp', vim.diagnostic.goto_prev, { buffer = bufnr })

    vim.keymap.set('n', 'gd', "<Cmd>Telescope lsp_definitions<CR>", { buffer = bufnr })
    vim.keymap.set('n', 'gr', "<Cmd>Telescope lsp_references<CR>", { buffer = bufnr })
    vim.keymap.set('n', 'gI', "<Cmd>Telescope lsp_implementations<CR>", { buffer = bufnr })
    vim.keymap.set('n', '<Leader>D', "<Cmd>Telescope lsp_type_definitions<CR>", { buffer = bufnr })
    vim.keymap.set('n', '<Leader>ds', "<Cmd>Telescope lsp_document_symbols<CR>", { buffer = bufnr })
    vim.keymap.set('n', '<Leader>ws', "<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>", { buffer = bufnr })

    -- Lesser used LSP functionality
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr })
    vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, { buffer = bufnr })
    vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, { buffer = bufnr })

    vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
        return vim.lsp.buf.format()
    end, { desc = "Auto format the actual buffer." })
end

local capabilities = vim.tbl_deep_extend("force",
vim.lsp.protocol.make_client_capabilities(),
require('cmp_nvim_lsp').default_capabilities()
)

local mason_lspconfig = require "mason-lspconfig"

require("mason").setup()
mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
    function(server_name)
        require("lspconfig")[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
        }
    end,
}

local cmp = require 'cmp'
local luasnip = require 'luasnip'

luasnip.config.set_config {
    history = true,
    enable_autosnippets = true,
}

-- NOTE: the loader is called twice so it picks up the defaults first then my custom vscode snippets.
-- see: https://github.com/L3MON4D3/LuaSnip/issues/364
require('luasnip.loaders.from_vscode').lazy_load()
require('luasnip.loaders.from_vscode').lazy_load({ paths = "./snippets" })

cmp.setup {
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = string.format('%s', vim_item.kind) -- This concatenates the name of the item kind
            -- Source
            vim_item.menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                nvim_lua = "[Lua]",
                latex_symbols = "[LaTeX]",
            })[entry.source.name]
            return vim_item
        end
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    mapping = cmp.mapping.preset.insert {
        ['<C-f>'] = cmp.mapping.complete {},
        ['<CR>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                if luasnip.expandable() then
                    luasnip.expand()
                else
                    cmp.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true
                    })
                end
            else
                fallback()
            end
        end),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.locally_jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
}

require "telescope".setup({
    defaults = {
        layout_strategy = "horizontal",
        layout_config = {
            height = 0.70,
            width = 0.80,
            preview_cutoff = 120,
        }
    },
    pickers = {},
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
        },
        file_browser = {
            theme = "dropdown",
            -- Uses Telescope's file browser instead netrw
            hijack_netrw = true,
            path = "%:p:h",
            cwd = vim.fn.expand("%:p:h"),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = "normal",
        }
    },
})

require "telescope".load_extension "file_browser"

vim.keymap.set("n", "<Leader>fg", "<Cmd>Telescope live_grep<CR>")
vim.keymap.set("n", "<Leader>ff", "<Cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<Leader>fb", "<Cmd>Telescope buffers<CR>")
vim.keymap.set("n", "<Leader>fh", "<Cmd>Telescope help_tags<CR>")
vim.keymap.set("n", "<Leader>fv", "<Cmd>Telescope file_browser<CR>")
vim.keymap.set("n", "<Leader>fc", "<Cmd>Telescope builtin<CR>")

vim.cmd.colorscheme "gruvbox"
