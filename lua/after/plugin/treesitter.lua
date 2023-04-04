local status, treesitter = pcall(require, "nvim-treesitter.configs")
if (not status) then
    print("TreeSitter is not installed.")
    return
end

local status, _ = pcall(require, "nvim-ts-autotag")
if (not status) then return end

treesitter.setup({
    -- enable syntax highlighting
    highlight = {
        enable = true,
    },
    -- enable indentation
    indent = { enable = true },
    -- enable autotagging (w/ nvim-ts-autotag plugin)
    autotag = { enable = true },
    -- ensure these language parsers are installed
    ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "c",
        "cpp",
    },
    -- auto install above language parsers
    auto_install = true,
})
