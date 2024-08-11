return {
    "norcalli/nvim-colorizer.lua",
    lazy = true,
    cmd = { "ColorizerToggle", "ColorizerAttachToBuffer" },
    event = { "BufReadPre", "BufNewFile" },
}
