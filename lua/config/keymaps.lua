local keymap = vim.api.nvim_set_keymap

---advanced keymap options
---@param description string
---@return table
local function keymapOptions(description)
    return { silent = true, noremap = true, desc = (description or "") }
end

-- Split windows
keymap("n", "ty", ":vsp<cr><C-w>l", keymapOptions("Split vertical window"))
keymap("n", "tx", ":split<cr><C-w>j", keymapOptions("Split horizontal window"))

-- Open terminal
keymap("n", "th", ":botright new <Bar> :term<cr>", keymapOptions("Open horizontal terminal"))
keymap("n", "tv", ":botright vnew <Bar> :term<cr>", keymapOptions("Open vertical terminal"))

-- Select all
keymap("n", "<c-a>", "gg<S-v>G", keymapOptions("Select all on a buffer"))

-- Move between windows
keymap("", "<C-h>", "<C-w>h", keymapOptions("Move to left window"))
keymap("", "<C-j>", "<C-w>j", keymapOptions("Move to bottom window"))
keymap("", "<C-k>", "<C-w>k", keymapOptions("Move to up window"))
keymap("", "<C-l>", "<C-w>l", keymapOptions("Move to right window"))

-- Resize windows
keymap("n", "t<left>", "<C-w>>", keymapOptions("Resize to left"))
keymap("n", "t<right>", "<C-w><", keymapOptions("Resize to right"))
keymap("n", "t<up>", "<C-w>+", keymapOptions("Resize to up"))
keymap("n", "t<down>", "<C-w>-", keymapOptions("Resize to down"))

-- New tab
keymap("n", "te", ":tabedit<cr>", keymapOptions("Open a new tab"))

keymap("t", "<leader>zz", "<C-\\><C-n>", keymapOptions("Pass from insert mode to normal mode in terminal mode"))

-- Move between buffers
keymap("n", "<leader>df", ":bnext<cr>", keymapOptions("Move to next buffer"))
keymap("n", "<leader>fd", ":bprev<cr>", keymapOptions("Move to previous buffer"))
keymap("n", "<leader>dc", ":bdelete<cr>", keymapOptions("Delete the actual buffer"))
