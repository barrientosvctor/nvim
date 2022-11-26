local status, _ = pcall(require, "horizon")
if not status then return end

vim.cmd [[colorscheme horizon]]
