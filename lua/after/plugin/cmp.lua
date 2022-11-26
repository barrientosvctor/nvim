local status, cmp = pcall(require, "cmp")
local status_luasnip, luasnip = pcall(require, "luasnip")
local status_cmpLuaSnip, _ = pcall(require, "cmp_luasnip")

if not status then return end
if not status_luasnip then return end
if not status_cmpLuaSnip then return end

require("luasnip/loaders/from_vscode").lazy_load()

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
    mapping = cmp.mapping.preset.insert({
	["<C-s>"] = cmp.mapping.select_next_item(),
	["<C-a>"] = cmp.mapping.select_prev_item(),
	["<C-p>"] = cmp.mapping.complete(),
	["<C-e>"] = cmp.mapping.abort(),
	["<cr>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
    }),
    formatting = {
	format = function(entry, vim_item)
	    vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
	    return vim_item
	end,
    },
    snippet = {
	expand = function(args)
	    luasnip.lsp_expand(args.body)
	end,
    },
    sources = cmp.config.sources({
	{ name = "nvim_lsp" },
	{ name = "luasnip" },
    }, {
	{ name = "path" }
    }),
    window = {
	-- completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
})
