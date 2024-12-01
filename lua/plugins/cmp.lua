return {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
        -- Snippet Engine & its associated nvim-cmp source
        'saadparwaiz1/cmp_luasnip',
        {
            'L3MON4D3/LuaSnip',
            dependencies = 'rafamadriz/friendly-snippets',
            opts = { history = true, updateevents = "TextChanged,TextChangedI" },
            config = function(_, opts)
                local ls = require("luasnip")
                ls.config.setup(opts)

                -- NOTE: the loader is called twice so it picks up the defaults first then my custom vscode snippets.
                -- see: https://github.com/L3MON4D3/LuaSnip/issues/364
                require('luasnip.loaders.from_vscode').lazy_load()
                require('luasnip.loaders.from_vscode').lazy_load({ paths = "./snippets" })

                vim.keymap.set({ 'i', 's' }, "<C-k>", function()
                    if ls.expand_or_jumpable() then
                        ls.expand_or_jump()
                    end
                end)

                vim.keymap.set({ 'i', 's' }, "<C-j>", function()
                    if ls.jumpable(-1) then
                        ls.jump(-1)
                    end
                end)
            end,
        },
        -- Adds LSP completion capabilities
        'hrsh7th/cmp-nvim-lsp',
    },
    event = "InsertEnter",
    opts = function()
        local cmp = require 'cmp'

        return {
            formatting = {
                format = function(entry, vim_item)
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
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert {
                ['<C-n>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
                ['<C-p>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
                ['<C-f>'] = cmp.mapping.complete {},
                ['<CR>'] = cmp.mapping(
                    cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Insert,
                        select = true
                    },
                    { 'i', 's' }
                ),
            },
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            },
        }
    end
}
