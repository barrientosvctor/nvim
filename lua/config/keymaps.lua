local keymap = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

-- Hotkeys
keymap("n", "<C-q>", ":q<CR>", options)
keymap("n", "q<C-q>", ":qa<CR>", options)
keymap("n", "<C-w>", ":w<CR>", options)

-- Split window
keymap("n", "ty", ":vsp<CR><C-w>l", options)
keymap("n", "tx", ":split<CR><C-w>j", options)

-- Increment / decrement
keymap("n", "+", "<C-a>", options)
keymap("n", "-", "<C-x>", options)

-- Open terminal
keymap("n", "th", ":botright new <Bar> :term<CR>", options)
keymap("n", "tv", ":botright vnew <Bar> :term<CR>", options)

-- Move between windows
keymap("", "<C-h>", "<C-w>h", options)
keymap("", "<C-j>", "<C-w>j", options)
keymap("", "<C-k>", "<C-w>k", options)
keymap("", "<C-l>", "<C-w>l", options)

-- Resize window
keymap("n", "t<left>", "<C-w>>", options)
keymap("n", "t<right>", "<C-w><", options)
keymap("n", "t<up>", "<C-w>+", options)
keymap("n", "t<down>", "<C-w>-", options)

-- New tab
keymap("n", "te", ":tabedit<CR>", options)

--Telescope
keymap("n", "<F1>", ":Telescope file_browser<CR>", options)
keymap("n", "<F2>", ":Telescope find_files<CR>", options)

-- Lspsaga
keymap("n", "ñd", ":Lspsaga diagnostic_jump_next<CR>", options)
keymap("n", "ññ", ":Lspsaga hover_doc<CR>", options)
keymap("n", "gd", ":Lspsaga lsp_finder<CR>", options)
keymap("n", "gp", ":Lspsaga preview_definition<CR>", options)
keymap("n", "ff", ":Lspsaga code_action<CR>", options)

-- Normal mode in terminal mode
keymap("t", "<Esc><Esc>", "<C-\\><C-n>", options)
