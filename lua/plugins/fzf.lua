return {
  "ibhagwan/fzf-lua",
    lazy = true,
    event = "UIEnter",
  config = function()
    require("fzf-lua").setup({})
  end
}
