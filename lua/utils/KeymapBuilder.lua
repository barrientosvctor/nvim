local M = {}

---adds a keymap globally
---@param mode string
---@param lhs string
---@param rhs unknown
---@param description string
function M.map(mode, lhs, rhs, description)
    vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = description })
end

---adds a keymap for a buffer
---@param mode string
---@param lhs string
---@param rhs unknown
---@param description string
---@param buf unknown
function M.bufmap(mode, lhs, rhs, description, buf)
    vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = description, buffer = buf })
end

return M
