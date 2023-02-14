local cmp_status, cmp = pcall(require, "cmp")
if (not cmp_status) then return end

local luasnip_status, luasnip = pcall(require, "luasnip")
if (not luasnip_status) then return end

-- Snippets engine like vscode
require("luasnip.loaders.from_vscode").lazy_load()

-- Nerd font icons
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- for luasnip snippet engine
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        format = function (entry, vim_item)
            vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            return vim_item
        end
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-s>"] = cmp.mapping.select_next_item(),
	    ["<C-a>"] = cmp.mapping.select_prev_item(),
        ["<C-f>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ["<CR>"] = cmp.mapping.confirm({ select = true })
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
    })
})
