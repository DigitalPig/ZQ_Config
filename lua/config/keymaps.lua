-- Key mappings
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap("x", "J", ":m '>+1<CR>gv=gv", opts)
keymap("x", "K", ":m '<-2<CR>gv=gv", opts)
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Keep cursor in place when joining lines
keymap("n", "J", "mzJ`z", opts)

-- Keep cursor centered when scrolling
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Clear search highlighting
keymap("n", "<Esc>", ":nohlsearch<CR>", opts)

-- Better paste
keymap("x", "<leader>p", [["_dP]], opts)

-- FzfLua keymaps (from nvimrc)
keymap("n", "<leader>ff", "<cmd>FzfLua files<cr>", opts)
keymap("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>", opts)
keymap("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", opts)
keymap("n", "<leader>fh", "<cmd>FzfLua tags<cr>", opts)
keymap("n", "<leader>gf", "<cmd>FzfLua git_files<cr>", opts)

-- Additional Git keymaps (gitsigns keymaps are defined in the plugin config)
keymap("n", "<leader>gc", "<cmd>FzfLua git_commits<cr>", { noremap = true, silent = true, desc = "Git commits" })
keymap("n", "<leader>gC", "<cmd>FzfLua git_bcommits<cr>", { noremap = true, silent = true, desc = "Git buffer commits" })
keymap("n", "<leader>gst", "<cmd>FzfLua git_status<cr>", { noremap = true, silent = true, desc = "Git status" })
keymap("n", "<leader>sr", "<cmd>FzfLua lsp_references<cr>", opts)
keymap("n", "<leader>ss", "<cmd>FzfLua lsp_document_symbols<cr>", opts)
keymap("n", "<leader>sw", "<cmd>FzfLua lsp_workspace_symbols<cr>", opts)

-- Telescope file browser
keymap("n", "<leader>fe", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", opts)

-- DAP (Debug Adapter Protocol) keymaps
keymap("n", "<leader>dn", function() require('dap-python').test_method() end, opts)
keymap("n", "<leader>df", function() require('dap-python').test_class() end, opts)
keymap("n", "<leader>db", function() require('dap').toggle_breakpoint() end, opts)
keymap("n", "<F5>", function() require('dap').continue() end, opts)
keymap("n", "<S-F5>", function() require('dap').terminate() end, opts)
keymap("n", "<F11>", function() require('dap').step_into() end, opts)
keymap("n", "<S-F12>", function() require('dap').step_out() end, opts)
keymap("n", "<F10>", function() require('dap').step_over() end, opts)
keymap("n", "<leader>dr", function() require('dap').repl.open() end, opts)

-- Visual mode DAP
keymap("v", "<leader>ds", "<ESC>:lua require('dap-python').debug_selection()<CR>", opts)

-- LeetCode keymaps
keymap("n", "<leader>ll", ":LeetCodeList<cr>", opts)
keymap("n", "<leader>lt", ":LeetCodeTest<cr>", opts)
keymap("n", "<leader>ls", ":LeetCodeSubmit<cr>", opts)
keymap("n", "<leader>li", ":LeetCodeSignIn<cr>", opts)