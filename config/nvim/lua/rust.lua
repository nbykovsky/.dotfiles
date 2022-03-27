vim.g.rustfmt_autosave = 1

require'lspconfig'.rust_analyzer.setup{}

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "<S-t>", ":RustTest <CR>", opts)  -- run test under cursor
keymap("n", "<C-t>", ":RustTest! <CR>", opts)  -- run test under cursor
