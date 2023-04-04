local keymap = vim.api.nvim_set_keymap
local options = { silent = true, noremap = true }

-- Hotkeys
keymap("n", "<C-w>", ":w<cr>", options)

-- Split windows
keymap("n", "ty", ":vsp<cr><C-w>l", options)
keymap("n", "tx", ":split<cr><C-w>j", options)

-- Open terminal
keymap("n", "th", ":botright new <Bar> :term<cr>", options)
keymap("n", "tv", ":botright vnew <Bar> :term<cr>", options)

-- Move between windows
keymap("", "<C-h>", "<C-w>h", options)
keymap("", "<C-j>", "<C-w>j", options)
keymap("", "<C-k>", "<C-w>k", options)
keymap("", "<C-l>", "<C-w>l", options)

-- Resize windows
keymap("n", "t<left>", "<C-w>>", options)
keymap("n", "t<right>", "<C-w><", options)
keymap("n", "t<up>", "<C-w>+", options)
keymap("n", "t<down>", "<C-w>-", options)

-- New tab
keymap("n", "te", ":tabedit<cr>", options)

-- Normal mode in terminal mode
keymap("t", "<leader>zz", "<C-\\><C-n>", options)

-- Telescope
keymap("n", "<F2>", ":Telescope file_browser<cr>", options)
keymap("n", "<F3>", ":Telescope find_files<cr>", options)
keymap("n", "<F4>", ":Telescope live_grep<cr>", options)

-- Lspsaga
keymap("n", "ñd", ":Lspsaga diagnostic_jump_next<CR>", options)
keymap("n", "ññ", ":Lspsaga hover_doc<CR>", options)
keymap("n", "gd", ":Lspsaga lsp_finder<CR>", options)
keymap("n", "gp", ":Lspsaga preview_definition<CR>", options)
keymap("n", "ff", ":Lspsaga code_action<CR>", options)
