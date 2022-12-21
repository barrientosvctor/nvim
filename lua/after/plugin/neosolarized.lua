local status, neosolarized = pcall(require, "neosolarized")
if not status then return end

neosolarized.setup({
    background_set = true
})
